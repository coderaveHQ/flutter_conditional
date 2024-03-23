import 'package:flutter/widgets.dart';

/// This class represents a case in a conditional statement.
class Case {
  /// The condition for this case
  final bool condition;

  /// Indicates whether this case is active or not
  final bool isActive;

  /// The widget returned when the condition is met
  final Widget? widget;

  /// Constructor for the Case class
  const Case({this.condition = false, this.isActive = true, this.widget});
}
