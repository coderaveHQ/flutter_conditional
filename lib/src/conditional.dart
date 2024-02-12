import 'package:flutter/widgets.dart';

import 'package:flutter_conditional/src/case.dart';
import 'package:flutter_conditional/src/typedefs.dart';
import 'package:flutter_conditional/src/value.dart';

/// A widget that conditionally renders different widgets based on provided cases.
class Conditional extends StatelessWidget {
  /// The list of cases to evaluate and render.
  final List<Case>? cases;

  /// A fallback builder that is executed when none of the cases match.
  final OptionalWidgetBuilder? fallbackBuilder;

  /// Creates a Conditional widget with a single case.
  Conditional.single(bool condition,
      {super.key, OptionalWidgetBuilder? builder, this.fallbackBuilder})
      : cases = [Case(condition, builder: builder)];

  /// Creates a Conditional widget with multiple cases.
  const Conditional.multiCase({super.key, this.cases, this.fallbackBuilder});

  /// Creates a Conditional widget with multiple cases based on matching values.
  static Conditional multiMatch<T>(T value,
      {List<Value<T>>? values, OptionalWidgetBuilder? fallbackBuilder}) {
    final List<Case> cases = values
            ?.map((v) => Case(value == v.value,
                isActive: v.isActive, builder: v.builder))
            .toList() ??
        [];

    return Conditional.multiCase(
        cases: cases, fallbackBuilder: fallbackBuilder);
  }

  @override
  Widget build(BuildContext context) {
    const defaultWidget = SizedBox.shrink();

    final List<Case> activeCases =
        (cases ?? []).where((c) => c.isActive).toList();
    if (activeCases.isEmpty) return defaultWidget;

    for (Case c in activeCases) {
      if (c.expression) {
        return c.builder?.call(context) ?? defaultWidget;
      }
    }

    return fallbackBuilder?.call(context) ?? defaultWidget;
  }
}
