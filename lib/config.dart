import 'package:path/path.dart' as path;

class Structure {
  static String commentContent = "//Write your code here";

  static Map<String, String> featureStructure(String feature) {
    String domainImportContent =
        "export 'models/${feature}_model.dart';\nexport 'repository/${feature}_repository.dart';\nexport 'services/${feature}_service.dart';";
    String indexContent =
        "export 'domain/${feature}_domain.dart';\nexport 'providers/providers.dart';\nexport 'screens/screens.dart';\nexport 'widgets/widgets.dart';\n";
    return {
      "domain/models/${feature}_model.dart": commentContent,
      "domain/repository/${feature}_repository.dart": commentContent,
      "domain/services/${feature}_service.dart": commentContent,
      "domain/${feature}_domain.dart": domainImportContent,
      "providers/${feature}_provider.dart": commentContent,
      "providers/providers.dart": "export '${feature}_provider.dart';",
      "screens/${feature}_screens.dart": commentContent,
      "screens/screens.dart": "export '${feature}_screens.dart';",
      "widgets/${feature}_widget.dart": commentContent,
      "widgets/widgets.dart": "export '${feature}_widget.dart';",
      "index.dart": indexContent,
    }.map((key, value) => MapEntry(path.join(feature, key), value));
  }
}
