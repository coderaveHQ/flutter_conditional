import 'package:flutter/widgets.dart';

import 'package:flutter_test/flutter_test.dart';

import 'package:flutter_conditional/src/conditional.dart';
import 'package:flutter_conditional/src/case.dart';

void main() {
  group('.single', () {
    testWidgets('Passing `true`to `condition`', (WidgetTester tester) async {
      await tester.pumpWidget(Builder(builder: (BuildContext _) {
        return Conditional.single(true);
      }));

      expect(find.byWidgetPredicate((Widget widget) => widget is SizedBox),
          findsOneWidget,
          reason: 'Should find a widget of type SizedBox');
    });

    testWidgets('Passing `false` to `condition`', (WidgetTester tester) async {
      await tester.pumpWidget(Builder(builder: (BuildContext _) {
        return Conditional.single(false);
      }));

      expect(find.byWidgetPredicate((Widget widget) => widget is SizedBox),
          findsOneWidget,
          reason: 'Should find a widget of type SizedBox');
    });

    testWidgets('Passing `true` to `condition` and a widget to `builder`',
        (WidgetTester tester) async {
      final Widget builderWidget = Container();

      await tester.pumpWidget(Builder(builder: (BuildContext _) {
        return Conditional.single(true,
            builder: (BuildContext _) => builderWidget);
      }));

      expect(find.byWidget(builderWidget), findsOneWidget,
          reason: 'Should find the widget that has been passed to `builder`');
    });

    testWidgets('Passing `false` to `condition` and a widget to `builder`',
        (WidgetTester tester) async {
      final Widget builderWidget = Container();

      await tester.pumpWidget(Builder(builder: (BuildContext _) {
        return Conditional.single(false,
            builder: (BuildContext _) => builderWidget);
      }));

      expect(find.byWidgetPredicate((Widget widget) => widget is SizedBox),
          findsOneWidget,
          reason: 'Should find a widget of type SizedBox');
    });

    testWidgets(
        'Passing `true` to `condition` and a widget to `fallbackBuilder`',
        (WidgetTester tester) async {
      final Widget fallbackBuilderWidget = Container();

      await tester.pumpWidget(Builder(builder: (BuildContext _) {
        return Conditional.single(true,
            fallbackBuilder: (BuildContext _) => fallbackBuilderWidget);
      }));

      expect(find.byWidgetPredicate((Widget widget) => widget is SizedBox),
          findsOneWidget,
          reason: 'Should find a widget of type SizedBox');
    });

    testWidgets(
        'Passing `false` to `condition` and a widget to `fallbackBuilder`',
        (WidgetTester tester) async {
      final Widget fallbackBuilderWidget = Container();

      await tester.pumpWidget(Builder(builder: (BuildContext _) {
        return Conditional.single(false,
            fallbackBuilder: (BuildContext _) => fallbackBuilderWidget);
      }));

      expect(find.byWidget(fallbackBuilderWidget), findsOneWidget,
          reason:
              'Should find the widget that has been passed to `fallbackBuilder`');
    });

    testWidgets(
        'Passing `true` to `condition` and a widget to `builder` and a widget to `fallbackBuilder`',
        (WidgetTester tester) async {
      final Widget builderWidget = Container();
      final Widget fallbackBuilderWidget = Container();

      await tester.pumpWidget(Builder(builder: (BuildContext _) {
        return Conditional.single(true,
            builder: (BuildContext _) => builderWidget,
            fallbackBuilder: (BuildContext _) => fallbackBuilderWidget);
      }));

      expect(find.byWidget(builderWidget), findsOneWidget,
          reason: 'Should find the widget that has been passed to `builder`');
    });

    testWidgets(
        'Passing `false` to `condition` and a widget to `builder` and a widget to `fallbackBuilder`',
        (WidgetTester tester) async {
      final Widget builderWidget = Container();
      final Widget fallbackBuilderWidget = Container();

      await tester.pumpWidget(Builder(builder: (BuildContext _) {
        return Conditional.single(false,
            builder: (BuildContext _) => builderWidget,
            fallbackBuilder: (BuildContext _) => fallbackBuilderWidget);
      }));

      expect(find.byWidget(fallbackBuilderWidget), findsOneWidget,
          reason:
              'Should find the widget that has been passed to `fallbackBuilder`');
    });
  });

  group('.multiCase', () {
    testWidgets('Passing nothing', (WidgetTester tester) async {
      await tester.pumpWidget(Builder(builder: (BuildContext _) {
        return const Conditional.multiCase();
      }));

      expect(find.byWidgetPredicate((Widget widget) => widget is SizedBox),
          findsOneWidget,
          reason: 'Should find a widget of type SizedBox');
    });

    testWidgets('Passing an empty List to `cases`',
        (WidgetTester tester) async {
      await tester.pumpWidget(Builder(builder: (BuildContext _) {
        return const Conditional.multiCase(cases: []);
      }));

      expect(find.byWidgetPredicate((Widget widget) => widget is SizedBox),
          findsOneWidget,
          reason: 'Should find a widget of type SizedBox');
    });

    testWidgets('Passing one `Case` to `cases` where `condition` is `true`',
        (WidgetTester tester) async {
      await tester.pumpWidget(Builder(builder: (BuildContext _) {
        return const Conditional.multiCase(cases: [Case(true)]);
      }));

      expect(find.byWidgetPredicate((Widget widget) => widget is SizedBox),
          findsOneWidget,
          reason: 'Should find a widget of type SizedBox');
    });

    testWidgets('Passing one `Case` to `cases` where `condition` is `false`',
        (WidgetTester tester) async {
      await tester.pumpWidget(Builder(builder: (BuildContext _) {
        return const Conditional.multiCase(cases: [Case(false)]);
      }));

      expect(find.byWidgetPredicate((Widget widget) => widget is SizedBox),
          findsOneWidget,
          reason: 'Should find a widget of type SizedBox');
    });

    testWidgets(
        'Passing one `Case` to `cases` where `condition` is `true` and `builder` is a widget',
        (WidgetTester tester) async {
      final Widget builderWidget = Container();

      await tester.pumpWidget(Builder(builder: (BuildContext _) {
        return Conditional.multiCase(
            cases: [Case(true, builder: (BuildContext _) => builderWidget)]);
      }));

      expect(find.byWidget(builderWidget), findsOneWidget,
          reason: 'Should find the widget that has been passed to `builder`');
    });

    testWidgets(
        'Passing one `Case` to `cases` where `condition` is `true` and `builder` is a widget',
        (WidgetTester tester) async {
      final Widget builderWidget = Container();

      await tester.pumpWidget(Builder(builder: (BuildContext _) {
        return Conditional.multiCase(
            cases: [Case(false, builder: (BuildContext _) => builderWidget)]);
      }));

      expect(find.byWidgetPredicate((Widget widget) => widget is SizedBox),
          findsOneWidget,
          reason: 'Should find a widget of type SizedBox');
    });

    testWidgets(
        'Passing one `Case` to `cases` where `condition` is `true` and `isActive` is `true` and `builder` is a widget',
        (WidgetTester tester) async {
      final Widget builderWidget = Container();

      await tester.pumpWidget(Builder(builder: (BuildContext _) {
        return Conditional.multiCase(cases: [
          Case(true, builder: (BuildContext _) => builderWidget, isActive: true)
        ]);
      }));

      expect(find.byWidget(builderWidget), findsOneWidget,
          reason: 'Should find the widget that has been passed to `builder`');
    });

    testWidgets(
        'Passing one `Case` to `cases` where `condition` is `false` and `isActive` is `true` and `builder` is a widget',
        (WidgetTester tester) async {
      final Widget builderWidget = Container();

      await tester.pumpWidget(Builder(builder: (BuildContext _) {
        return Conditional.multiCase(cases: [
          Case(false,
              builder: (BuildContext _) => builderWidget, isActive: true)
        ]);
      }));

      expect(find.byWidgetPredicate((Widget widget) => widget is SizedBox),
          findsOneWidget,
          reason: 'Should find a widget of type SizedBox');
    });

    testWidgets(
        'Passing one `Case` to `cases` where `condition` is `true` and `isActive` is `false` and `builder` is a widget',
        (WidgetTester tester) async {
      final Widget builderWidget = Container();

      await tester.pumpWidget(Builder(builder: (BuildContext _) {
        return Conditional.multiCase(cases: [
          Case(true,
              builder: (BuildContext _) => builderWidget, isActive: false)
        ]);
      }));

      expect(find.byWidgetPredicate((Widget widget) => widget is SizedBox),
          findsOneWidget,
          reason: 'Should find a widget of type SizedBox');
    });

    testWidgets(
        'Passing one `Case` to `cases` where `condition` is `false` and `isActive` is `false` and `builder` is a widget',
        (WidgetTester tester) async {
      final Widget builderWidget = Container();

      await tester.pumpWidget(Builder(builder: (BuildContext _) {
        return Conditional.multiCase(cases: [
          Case(false,
              builder: (BuildContext _) => builderWidget, isActive: false)
        ]);
      }));

      expect(find.byWidgetPredicate((Widget widget) => widget is SizedBox),
          findsOneWidget,
          reason: 'Should find a widget of type SizedBox');
    });

    testWidgets('Passing a widget to `fallbackBuilder`',
        (WidgetTester tester) async {
      final Widget fallbackBuilderWidget = Container();

      await tester.pumpWidget(Builder(builder: (BuildContext _) {
        return Conditional.multiCase(
            fallbackBuilder: (BuildContext _) => fallbackBuilderWidget);
      }));

      expect(find.byWidgetPredicate((Widget widget) => widget is SizedBox),
          findsOneWidget,
          reason: 'Should find a widget of type SizedBox');
    });

    testWidgets(
        'Passing an empty List to `cases` and a widget to `fallbackBuilder`',
        (WidgetTester tester) async {
      final Widget fallbackBuilderWidget = Container();

      await tester.pumpWidget(Builder(builder: (BuildContext _) {
        return Conditional.multiCase(
            cases: const [],
            fallbackBuilder: (BuildContext _) => fallbackBuilderWidget);
      }));

      expect(find.byWidgetPredicate((Widget widget) => widget is SizedBox),
          findsOneWidget,
          reason: 'Should find a widget of type SizedBox');
    });

    testWidgets(
        'Passing one `Case` to `cases` where `condition` is `true` and a widget to `fallbackBuilder`',
        (WidgetTester tester) async {
      final Widget fallbackBuilderWidget = Container();

      await tester.pumpWidget(Builder(builder: (BuildContext _) {
        return Conditional.multiCase(
            cases: const [Case(true)],
            fallbackBuilder: (BuildContext _) => fallbackBuilderWidget);
      }));

      expect(find.byWidgetPredicate((Widget widget) => widget is SizedBox),
          findsOneWidget,
          reason: 'Should find a widget of type SizedBox');
    });

    testWidgets(
        'Passing one `Case` to `cases` where `condition` is `false` and a widget to `fallbackBuilder`',
        (WidgetTester tester) async {
      final Widget fallbackBuilderWidget = Container();

      await tester.pumpWidget(Builder(builder: (BuildContext _) {
        return Conditional.multiCase(
            cases: const [Case(false)],
            fallbackBuilder: (BuildContext _) => fallbackBuilderWidget);
      }));

      expect(find.byWidget(fallbackBuilderWidget), findsOneWidget,
          reason:
              'Should find the widget that has been passed to `fallbackBuilder`');
    });

    testWidgets(
        'Passing one `Case` to `cases` where `condition` is `true` and `isActive` is `true`',
        (WidgetTester tester) async {
      await tester.pumpWidget(Builder(builder: (BuildContext _) {
        return const Conditional.multiCase(cases: [Case(true, isActive: true)]);
      }));

      expect(find.byWidgetPredicate((Widget widget) => widget is SizedBox),
          findsOneWidget,
          reason: 'Should find a widget of type SizedBox');
    });

    testWidgets(
        'Passing one `Case` to `cases` where `condition` is `false` and `isActive` is `true`',
        (WidgetTester tester) async {
      await tester.pumpWidget(Builder(builder: (BuildContext _) {
        return const Conditional.multiCase(
            cases: [Case(false, isActive: true)]);
      }));

      expect(find.byWidgetPredicate((Widget widget) => widget is SizedBox),
          findsOneWidget,
          reason: 'Should find a widget of type SizedBox');
    });

    testWidgets(
        'Passing one `Case` to `cases` where `condition` is `true` and `isActive` is `false`',
        (WidgetTester tester) async {
      await tester.pumpWidget(Builder(builder: (BuildContext _) {
        return const Conditional.multiCase(
            cases: [Case(true, isActive: false)]);
      }));

      expect(find.byWidgetPredicate((Widget widget) => widget is SizedBox),
          findsOneWidget,
          reason: 'Should find a widget of type SizedBox');
    });

    testWidgets(
        'Passing one `Case` to `cases` where `condition` is `false` and `isActive` is `false`',
        (WidgetTester tester) async {
      await tester.pumpWidget(Builder(builder: (BuildContext _) {
        return const Conditional.multiCase(
            cases: [Case(false, isActive: false)]);
      }));

      expect(find.byWidgetPredicate((Widget widget) => widget is SizedBox),
          findsOneWidget,
          reason: 'Should find a widget of type SizedBox');
    });

    testWidgets(
        'Passing one `Case` to `cases` where `condition` is `true` and `isActive` is `true` and a widget to `fallbackBuilder`',
        (WidgetTester tester) async {
      final Widget fallbackBuilderWidget = Container();

      await tester.pumpWidget(Builder(builder: (BuildContext _) {
        return Conditional.multiCase(
            cases: const [Case(true, isActive: true)],
            fallbackBuilder: (BuildContext _) => fallbackBuilderWidget);
      }));

      expect(find.byWidgetPredicate((Widget widget) => widget is SizedBox),
          findsOneWidget,
          reason: 'Should find a widget of type SizedBox');
    });

    testWidgets(
        'Passing one `Case` to `cases` where `condition` is `false` and `isActive` is `true` and a widget to `fallbackBuilder`',
        (WidgetTester tester) async {
      final Widget fallbackBuilderWidget = Container();

      await tester.pumpWidget(Builder(builder: (BuildContext _) {
        return Conditional.multiCase(
            cases: const [Case(false, isActive: true)],
            fallbackBuilder: (BuildContext _) => fallbackBuilderWidget);
      }));

      expect(find.byWidget(fallbackBuilderWidget), findsOneWidget,
          reason:
              'Should find the widget that has been passed to `fallbackBuilder`');
    });

    testWidgets(
        'Passing one `Case` to `cases` where `condition` is `true` and `isActive` is `false` and a widget to `fallbackBuilder`',
        (WidgetTester tester) async {
      final Widget fallbackBuilderWidget = Container();

      await tester.pumpWidget(Builder(builder: (BuildContext _) {
        return Conditional.multiCase(
            cases: const [Case(true, isActive: false)],
            fallbackBuilder: (BuildContext _) => fallbackBuilderWidget);
      }));

      expect(find.byWidgetPredicate((Widget widget) => widget is SizedBox),
          findsOneWidget,
          reason: 'Should find a widget of type SizedBox');
    });

    testWidgets(
        'Passing one `Case` to `cases` where `condition` is `false` and `isActive` is `false` and a widget to `fallbackBuilder`',
        (WidgetTester tester) async {
      final Widget fallbackBuilderWidget = Container();

      await tester.pumpWidget(Builder(builder: (BuildContext _) {
        return Conditional.multiCase(
            cases: const [Case(false, isActive: false)],
            fallbackBuilder: (BuildContext _) => fallbackBuilderWidget);
      }));

      expect(find.byWidgetPredicate((Widget widget) => widget is SizedBox),
          findsOneWidget,
          reason: 'Should find a widget of type SizedBox');
    });

    testWidgets(
        'Passing one `Case` to `cases` where `condition` is `true` and `builder` is a widget and a widget to `fallbackBuilder`',
        (WidgetTester tester) async {
      final Widget builderWidget = Container();
      final Widget fallbackBuilderWidget = Container();

      await tester.pumpWidget(Builder(builder: (BuildContext _) {
        return Conditional.multiCase(
            cases: [Case(true, builder: (BuildContext _) => builderWidget)],
            fallbackBuilder: (BuildContext _) => fallbackBuilderWidget);
      }));

      expect(find.byWidget(builderWidget), findsOneWidget,
          reason: 'Should find the widget that has been passed to `builder`');
    });

    testWidgets(
        'Passing one `Case` to `cases` where `condition` is `false` and `builder` is a widget and a widget to `fallbackBuilder`',
        (WidgetTester tester) async {
      final Widget builderWidget = Container();
      final Widget fallbackBuilderWidget = Container();

      await tester.pumpWidget(Builder(builder: (BuildContext _) {
        return Conditional.multiCase(
            cases: [Case(false, builder: (BuildContext _) => builderWidget)],
            fallbackBuilder: (BuildContext _) => fallbackBuilderWidget);
      }));

      expect(find.byWidget(fallbackBuilderWidget), findsOneWidget,
          reason:
              'Should find the widget that has been passed to `fallbackBuilder`');
    });

    testWidgets(
        'Passing one `Case` to `cases` where `condition` is `true` and `isActive` is `true` and `builder` is a widget and a widget to `fallbackBuilder`',
        (WidgetTester tester) async {
      final Widget builderWidget = Container();
      final Widget fallbackBuilderWidget = Container();

      await tester.pumpWidget(Builder(builder: (BuildContext _) {
        return Conditional.multiCase(cases: [
          Case(true, builder: (BuildContext _) => builderWidget, isActive: true)
        ], fallbackBuilder: (BuildContext _) => fallbackBuilderWidget);
      }));

      expect(find.byWidget(builderWidget), findsOneWidget,
          reason: 'Should find the widget that has been passed to `builder`');
    });

    testWidgets(
        'Passing one `Case` to `cases` where `condition` is `false` and `isActive` is `true` and `builder` is a widget and a widget to `fallbackBuilder`',
        (WidgetTester tester) async {
      final Widget builderWidget = Container();
      final Widget fallbackBuilderWidget = Container();

      await tester.pumpWidget(Builder(builder: (BuildContext _) {
        return Conditional.multiCase(cases: [
          Case(false,
              builder: (BuildContext _) => builderWidget, isActive: true)
        ], fallbackBuilder: (BuildContext _) => fallbackBuilderWidget);
      }));

      expect(find.byWidget(fallbackBuilderWidget), findsOneWidget,
          reason:
              'Should find the widget that has been passed to `fallbackBuilder`');
    });

    testWidgets(
        'Passing one `Case` to `cases` where `condition` is `true` and `isActive` is `false` and `builder` is a widget and a widget to `fallbackBuilder`',
        (WidgetTester tester) async {
      final Widget builderWidget = Container();
      final Widget fallbackBuilderWidget = Container();

      await tester.pumpWidget(Builder(builder: (BuildContext _) {
        return Conditional.multiCase(cases: [
          Case(true,
              builder: (BuildContext _) => builderWidget, isActive: false)
        ], fallbackBuilder: (BuildContext _) => fallbackBuilderWidget);
      }));

      expect(find.byWidgetPredicate((Widget widget) => widget is SizedBox),
          findsOneWidget,
          reason: 'Should find a widget of type SizedBox');
    });

    testWidgets(
        'Passing one `Case` to `cases` where `condition` is `false` and `isActive` is `false` and `builder` is a widget and a widget to `fallbackBuilder`',
        (WidgetTester tester) async {
      final Widget builderWidget = Container();
      final Widget fallbackBuilderWidget = Container();

      await tester.pumpWidget(Builder(builder: (BuildContext _) {
        return Conditional.multiCase(cases: [
          Case(false,
              builder: (BuildContext _) => builderWidget, isActive: false)
        ], fallbackBuilder: (BuildContext _) => fallbackBuilderWidget);
      }));

      expect(find.byWidgetPredicate((Widget widget) => widget is SizedBox),
          findsOneWidget,
          reason: 'Should find a widget of type SizedBox');
    });
  });

  group('.multiMatch', () {
    testWidgets('Passing an empty String to `value`',
        (WidgetTester tester) async {
      await tester.pumpWidget(Builder(builder: (BuildContext _) {
        return Conditional.multiMatch<String>('');
      }));

      expect(find.byWidgetPredicate((Widget widget) => widget is SizedBox),
          findsOneWidget,
          reason: 'Should find a widget of type SizedBox');
    });

    testWidgets(
        'Passing an empty String to `value` and an empty List to `values`',
        (WidgetTester tester) async {
      await tester.pumpWidget(Builder(builder: (BuildContext _) {
        return Conditional.multiMatch<String>('', values: []);
      }));

      expect(find.byWidgetPredicate((Widget widget) => widget is SizedBox),
          findsOneWidget,
          reason: 'Should find a widget of type SizedBox');
    });

    testWidgets(
        'Passing an empty String to `value` and an empty List to `values` and a widget to `fallbackBuilder`',
        (WidgetTester tester) async {
      final Widget fallbackBuilderWidget = Container();

      await tester.pumpWidget(Builder(builder: (BuildContext _) {
        return Conditional.multiMatch<String>('',
            values: [],
            fallbackBuilder: (BuildContext _) => fallbackBuilderWidget);
      }));

      expect(find.byWidgetPredicate((Widget widget) => widget is SizedBox),
          findsOneWidget,
          reason: 'Should find a widget of type SizedBox');
    });
  });
}
