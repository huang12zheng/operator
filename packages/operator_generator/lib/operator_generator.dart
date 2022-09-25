/// * Inspiration from below:
///
/// ```dart
/// class A {
///   final int a;
///   A(this.a);
/// }
/// extension on A {
///   getFn(String prop) {
///     final func = map[prop];
///     if (func == null) {
///       throw ArgumentError('Property `$prop` does not exist on ItemClass.');
///     }
///     return func.call(this);
///   }
///   static Map<String, Function(A)> map = {'a': (A ins) => ins.a};
/// }
/// main() {
///   print(A(1).getFn('a'));
/// }
/// ```

import 'package:build/src/builder/build_step.dart';
import 'package:analyzer/dart/element/element.dart';
import 'package:operator_annotation/operator_annotation.dart';
import 'package:source_gen/source_gen.dart';
import 'package:path/path.dart';

class OperatorGenerator extends GeneratorForAnnotation<Operator> {
  @override
  generateForAnnotatedElement(
      Element element, ConstantReader annotation, BuildStep buildStep) {
    if (element is! ClassElement) {
      throw InvalidGenerationSourceError('Operator only apply on Class');
    }
    // final output = <String>[];
    // output.add('// Code for "${element.name}"');
    // final ClassElement classElement = element;
    /// source from: https://github.com/objectbox/objectbox-dart/blob/ba25c58e2a6f5f08dabf68f9bd133140ea7252b3/generator/lib/src/entity_resolver.dart
    // for (final f in element.accessors) {
    // if (f.isGetter &&
    //     f.correspondingSetter == null &&
    //     !entity.constructorParams
    //         .any((String param) => param.startsWith('${f.name} '))) {
    //   readOnlyFields.add(f.name);
    // }

    // }
    // for (var f in element.fields) {
    //   print(f.name);
    // }
    final String mapperStr = element.fields
        .map((f) => '\'${f.name}\': (${element.name} ins) => ins.${f.name}')
        .join(',');

    return '''
      part of '${basename(buildStep.inputId.path)}';

      extension ${element.name}X on ${element.name} {

      dynamic operator [](String prop) {
        final func = map[prop];
        if (func == null) {
          throw ArgumentError('Property `\$prop` does not exist on ItemClass.');
        }
        return func.call(this);
      }
      static Map<String, Function(${element.name})> map = {${mapperStr}};
    }''';
  }
}
