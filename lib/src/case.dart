import 'package:flutter_conditional/src/typedefs.dart';

/// Represents a case in the Conditional widget.
class Case {
  /// The condition expression for this case.
  final bool expression;

  /// Determines if this case is active or not.
  final bool isActive;

  /// A builder function that returns a widget based on the condition.
  final OptionalWidgetBuilder? builder;

  /// Creates a new Case with the provided condition expression, isActive status,
  /// and an optional builder function.
  const Case(this.expression, {this.isActive = true, this.builder});
}
