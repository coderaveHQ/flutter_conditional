import 'package:flutter/widgets.dart';

import 'package:flutter_conditional/flutter_conditional.dart';

/// This class represents a case in a conditional statement with a builder function.
class BuilderCase {
  /// The condition for this case
  final bool condition;

  /// Indicates whether this case is active or not
  final bool isActive;

  /// The widget returned when the condition is met
  final OptionalWidgetBuilder? widgetBuilder;

  /// Constructor for the BuilderCase class
  const BuilderCase({this.condition = false, this.isActive = true, this.widgetBuilder});

  /// This method returns a Case based on the builder function
  Case toCase(BuildContext context) {
    return Case(
      condition: condition,
      isActive: isActive,
      widget: widgetBuilder?.call(context)
    );
  }
}