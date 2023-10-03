import 'dart:io';
import 'package:feature_gen/config.dart';
import 'package:path/path.dart' as path;

class LibFileGenerator {
  final String _libFolderPath;

  LibFileGenerator(this._libFolderPath);

  void generateFile(String fileName, String content) {
    final filePath = path.join(_libFolderPath, fileName);
    final file = File(filePath);

    try {
      if (file.existsSync()) {
        throw Exception("Feature Not Empty");
      }
      generatePath(filePath);
      file.writeAsStringSync(content);
      print('File "${file.path}" generated in the lib folder.');
    } catch (e) {
      print('Error generating file: $e');
    }
  }

  void generatePath(String filePath) {
    // Get the directory part of the file path.
    final dir = Directory(File(filePath).parent.path);

    // Create missing directories if they don't exist.
    if (!dir.existsSync()) {
      dir.createSync(recursive: true);
    }
  }

  void buildFeature(String feature) {
    final structure = Structure.featureStructure(feature);
    structure.forEach((key, value) {
      generateFile(key, value);
    });
  }
}
