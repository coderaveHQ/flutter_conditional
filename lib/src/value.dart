import 'package:flutter_conditional/src/typedefs.dart';

/// Represents a value in the Conditional widget.
class Value<T> {
  /// The value to match against in the Conditional widget.
  final T value;

  /// Determines if this value is active or not.
  final bool isActive;

  /// A builder function that returns a widget based on the matched value.
  final OptionalWidgetBuilder? builder;

  /// Creates a new Value with the provided value, isActive status,
  /// and an optional builder function.
  const Value(this.value, {this.isActive = true, this.builder});
}
