import 'package:flutter/widgets.dart';

// This class represents a value in a conditional statement.
class Value<T> {
  // The value of this object
  final T? value;

  // Indicates whether this value is active or not
  final bool isActive;

  // The widget returned when this value matches
  final Widget? widget;

  // Constructor for the Value class
  const Value({this.value, this.isActive = true, this.widget});
}
