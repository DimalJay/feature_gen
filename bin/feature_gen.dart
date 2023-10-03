import 'package:args/args.dart';
import 'package:feature_gen/generator.dart';

void main(List<String> arguments) {
  final argParser = ArgParser()
    ..addOption('feature', abbr: 'f', help: 'Name of the feature to generate');
  final argResults = argParser.parse(arguments);
  final feature = argResults['feature'] as String?;
  final generator = LibFileGenerator('lib');

  if (feature != null) {
    generator.buildFeature(feature);
  }
}
