import 'package:flutter_conditional/src/typedefs.dart';

class Value<T> {
  final T value;
  final bool isActive;
  final OptionalWidgetBuilder? builder;

  const Value(this.value, {this.isActive = true, this.builder});
}
