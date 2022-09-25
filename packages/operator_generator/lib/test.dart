import 'package:operator_annotation/operator_annotation.dart';

part 'test.operator.dart';

@operator
class A {
  final int a;
  A(this.a);
}
