// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

// **************************************************************************
// OperatorGenerator
// **************************************************************************

part of 'test.dart';

extension AX on A {
  dynamic operator [](String prop) {
    final func = map[prop];
    if (func == null) {
      throw ArgumentError('Property `$prop` does not exist on ItemClass.');
    }
    return func.call(this);
  }

  static Map<String, Function(A)> map = {'a': (A ins) => ins.a};
}
