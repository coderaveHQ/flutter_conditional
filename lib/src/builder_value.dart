import 'package:flutter/widgets.dart';

import 'package:flutter_conditional/flutter_conditional.dart';

/// This class represents a value in a conditional statement with a builder function
class BuilderValue<T> {
  /// The value of this object
  final T? value;

  /// Indicates whether this value is active or not
  final bool isActive;

  /// The widget returned when this value matches
  final OptionalWidgetBuilder? widgetBuilder;

  /// Constructor for the BuilderValue class
  const BuilderValue({this.value, this.isActive = true, this.widgetBuilder});

  /// This method returns a Value based on the builder function
  Value<T> toValue(BuildContext context) {
    return Value<T>(
        value: value, isActive: isActive, widget: widgetBuilder?.call(context));
  }
}
