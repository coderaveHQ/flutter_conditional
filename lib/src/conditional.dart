import 'package:flutter/widgets.dart';

import 'package:flutter_conditional/src/case.dart';
import 'package:flutter_conditional/src/value.dart';

// This class contains methods for conditional widget rendering.
class Conditional {
  // This method returns a single widget depending on the condition.
  static Widget single(
      {
      // The condition for displaying the widget
      bool condition = false,

      // The widget to display when the condition is met
      Widget? widget,

      // The widget to display when the condition is not met
      Widget? fallback}) {
    return optionalSingle(
            condition: condition, widget: widget, fallback: fallback) ??
        const SizedBox
            .shrink(); // Return an empty widget if no condition is met
  }

  // This method returns a single widget if the condition is met, otherwise null.
  static Widget? optionalSingle(
      {bool condition = false, Widget? widget, Widget? fallback}) {
    if (condition) return widget;
    return fallback;
  }

  // This method returns a widget based on multiple cases.
  static Widget multiCase(
      {
      // The list of cases
      List<Case>? cases,

      // The widget to display when no condition is met
      Widget? fallback}) {
    return optionalMultiCase(cases: cases, fallback: fallback) ??
        const SizedBox
            .shrink(); // Return an empty widget if no condition is met
  }

  // This method returns a widget based on multiple cases, or null if no case is met.
  static Widget? optionalMultiCase({List<Case>? cases, Widget? fallback}) {
    final List<Case> activeCases = (cases ?? [])
        .where((c) => c.isActive)
        .toList(); // Selecting active cases
    if (activeCases.isEmpty) return null;

    for (Case c in activeCases) {
      if (c.condition) {
        return c.widget;
      }
    }

    return fallback;
  }

  // This method returns a widget based on multiple matching values.
  static Widget multiMatch<T>(
      {
      // The value to type match
      T? value,

      // The list of values
      List<Value<T>>? values,

      // The widget to display when no value matches
      Widget? fallback}) {
    return optionalMultiMatch(
            value: value, values: values, fallback: fallback) ??
        const SizedBox.shrink(); // Return an empty widget if no value matches
  }

  // This method returns a widget based on multiple matching values, or null if no value matches.
  static Widget? optionalMultiMatch<T>(
      {T? value, List<Value<T>>? values, Widget? fallback}) {
    if (value == null) return null;

    final List<Value<T>> activeValues = (values ?? [])
        .where((v) => v.isActive)
        .toList(); // Selecting active values
    if (activeValues.isEmpty) return null;

    for (Value<T> v in activeValues) {
      if (v.value == value) {
        return v.widget;
      }
    }

    return fallback;
  }
}
