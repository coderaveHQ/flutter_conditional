import 'package:flutter_conditional/src/typedefs.dart';

class Case {
  final bool expression;
  final bool isActive;
  final OptionalWidgetBuilder? builder;

  const Case(this.expression, {this.isActive = true, this.builder});
}
