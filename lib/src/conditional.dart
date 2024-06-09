import 'package:flutter/widgets.dart';

import 'package:flutter_conditional/src/builder_case.dart';
import 'package:flutter_conditional/src/builder_value.dart';
import 'package:flutter_conditional/src/case.dart';
import 'package:flutter_conditional/src/typedefs.dart';
import 'package:flutter_conditional/src/value.dart';

/// This class contains methods for conditional widget rendering.
class Conditional {
  /// ---------------------
  /// 100% WIDGET
  /// ---------------------

  /// This method returns a single widget depending on the condition.
  static Widget single(
      {
      /// The condition for displaying the widget
      bool condition = false,

      /// The widget to display when the condition is met
      Widget? widget,

      /// The widget to display when the condition is not met
      Widget? fallback}) {
    return optionalSingle(
            condition: condition, widget: widget, fallback: fallback) ??
        const SizedBox
            .shrink(); // Return an empty widget if no condition is met
  }

  /// This method returns a widget based on multiple cases.
  static Widget multiCase(
      {
      /// The list of cases
      List<Case>? cases,

      /// The widget to display when no condition is met
      Widget? fallback}) {
    return optionalMultiCase(cases: cases, fallback: fallback) ??
        const SizedBox
            .shrink(); // Return an empty widget if no condition is met
  }

  /// This method returns a widget based on multiple matching values.
  static Widget multiMatch<T>(
      {
      /// The value to type match
      T? value,

      /// The list of values
      List<Value<T>>? values,

      /// The widget to display when no value matches
      Widget? fallback}) {
    return optionalMultiMatch(
            value: value, values: values, fallback: fallback) ??
        const SizedBox.shrink(); // Return an empty widget if no value matches
  }

  /// ---------------------
  /// OPTIONAL WIDGET
  /// ---------------------

  /// This method returns a single widget if the condition is met, otherwise null.
  static Widget? optionalSingle(
      {
      /// The condition for displaying the widget
      bool condition = false,

      /// The widget to display when the condition is met
      Widget? widget,

      /// The widget to display when the condition is not met
      Widget? fallback}) {
    if (condition) return widget;
    return fallback;
  }

  /// This method returns a widget based on multiple cases, or null if no case is met.
  static Widget? optionalMultiCase(
      {
      /// The list of cases
      List<Case>? cases,

      /// The widget to display when no condition is met
      Widget? fallback}) {
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

  /// This method returns a widget based on multiple matching values, or null if no value matches.
  static Widget? optionalMultiMatch<T>(
      {
      /// The value to type match
      T? value,

      /// The list of values
      List<Value<T>>? values,

      /// The widget to display when no value matches
      Widget? fallback}) {
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

  /// ---------------------
  /// 100% WIDGET BUILDER
  /// ---------------------

  /// This method returns a single widget by passing builder functions depending on the condition.
  static Widget singleBuilder(
      // The context to be passed to the builder function
      BuildContext context,
      {
      /// The condition for displaying the widget
      bool condition = false,

      /// The widget to display when the condition is met
      OptionalWidgetBuilder? widgetBuilder,

      /// The widget to display when the condition is not met
      OptionalWidgetBuilder? fallbackBuilder}) {
    return single(
        condition: condition,
        widget: widgetBuilder?.call(context),
        fallback: fallbackBuilder?.call(context));
  }

  /// This method returns a widget by passing builder functions based on multiple cases.
  static Widget multiCaseBuilder(
      // The context to be passed to the builder function
      BuildContext context,
      {
      /// The list of cases
      List<BuilderCase>? cases,

      /// The widget to display when no condition is met
      OptionalWidgetBuilder? fallbackBuilder}) {
    return multiCase(
        cases: cases
            ?.map((BuilderCase builderCase) => builderCase.toCase(context))
            .toList(),
        fallback: fallbackBuilder?.call(context));
  }

  /// This method returns a widget by passing builder functions based on multiple matching values.
  static Widget multiMatchBuilder<T>(
      // The context to be passed to the builder function
      BuildContext context,
      {
      /// The value to type match
      T? value,

      /// The list of values
      List<BuilderValue<T>>? values,

      /// The widget to display when no value matches
      OptionalWidgetBuilder? fallbackBuilder}) {
    return multiMatch(
        value: value,
        values: values
            ?.map((BuilderValue builderValue) => builderValue.toValue(context))
            .toList(),
        fallback: fallbackBuilder?.call(context));
  }

  /// ---------------------
  /// OPTIONAL WIDGET BUILDER
  /// ---------------------

  /// This method returns a single widget by passing builder functions if the condition is met, otherwise null.
  static Widget? optionalSingleBuilder(
      // The context to be passed to the builder function
      BuildContext context,
      {
      /// The condition for displaying the widget
      bool condition = false,

      /// The widget to display when the condition is met
      OptionalWidgetBuilder? widgetBuilder,

      /// The widget to display when the condition is not met
      OptionalWidgetBuilder? fallbackBuilder}) {
    return optionalSingle(
        condition: condition,
        widget: widgetBuilder?.call(context),
        fallback: fallbackBuilder?.call(context));
  }

  /// This method returns a widget by passing builder functions based on multiple cases, or null if no case is met.
  static Widget? optionalMultiCaseBuilder(
      // The context to be passed to the builder function
      BuildContext context,
      {
      /// The list of cases
      List<BuilderCase>? cases,

      /// The widget to display when no condition is met
      OptionalWidgetBuilder? fallbackBuilder}) {
    return optionalMultiCase(
        cases: cases
            ?.map((BuilderCase builderCase) => builderCase.toCase(context))
            .toList(),
        fallback: fallbackBuilder?.call(context));
  }

  /// This method returns a widget by passing builder functions based on multiple matching values, or null if no value matches.
  static Widget? optionalMultiMatchBuilder<T>(
      // The context to be passed to the builder function
      BuildContext context,
      {
      /// The value to type match
      T? value,

      /// The list of values
      List<BuilderValue<T>>? values,

      /// The widget to display when no value matches
      OptionalWidgetBuilder? fallbackBuilder}) {
    return optionalMultiMatch(
        value: value,
        values: values
            ?.map((BuilderValue builderValue) => builderValue.toValue(context))
            .toList(),
        fallback: fallbackBuilder?.call(context));
  }
}
