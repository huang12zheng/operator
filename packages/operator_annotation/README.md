* Usage
```dart
import 'package:operator_annotation/operator_annotation.dart';

part 'test.operator.dart';

@operator
class A {
  final int a;
  A(this.a);
}
//////
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

```