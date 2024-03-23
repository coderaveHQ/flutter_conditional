# flutter_conditonal

Conditional rendering made easy! 💎

[![pub package](https://img.shields.io/pub/v/shelf.svg)](https://pub.dev/packages/flutter_conditional)
[![License](https://img.shields.io/badge/License-BSD_3--Clause-blue.svg)](https://opensource.org/licenses/BSD-3-Clause)

Developed with 💙 and maintained by [scial.app](https://scial.app)

[!["Buy Me A Coffee"](https://www.buymeacoffee.com/assets/img/custom_images/orange_img.png)](https://www.buymeacoffee.com/scial.app)

## Migration 🆙

<details>
  <summary>Migrating to 2.0.0</summary>

  - Replace builder functions with named parameters:

  ### Before

  ```dart
  class SomeWidget extends StatelessWidget {

    Widget build(BuildContext context) {

      final bool someCondition = false;

      return Conditional.single(
        someCondition,
        builder: (BuildContext _) => WidgetA(),
        fallbackBuilder: (BuildContext _) => WidgetB()
      );
    }
  }
  ```

  ### After

  ```dart
  class SomeWidget extends StatelessWidget {

    Widget build(BuildContext context) {

      final bool someCondition = false;

      return Conditional.single(
        condition: someCondition,
        widget: WidgetA(),
        fallback: WidgetB()
      );
    }
  }
  ```

</details>

## Quick Start 🚀

### Installation 🧑‍💻

In the `dependencies` section of your `pubspec.yaml`, add the following line:

```yaml
dependencies:
  flutter_conditional: <latest_version>
```

### Usage 👽

Import the package:

```dart
import 'package:flutter_conditional/flutter_conditional.dart';
``````

Make use of the named constructors:

#### `.single(...)`

This constructor aims to be as simple as possible. This constructor lets you pass in a simple boolean expression.

```dart
class TrueOrFalseWidget extends StatelessWidget {

  Widget build(BuildContext context) {

    final bool ideaForName = false;

    return Conditional.single(
      condition: ideaForName,
      widget: TrueWidget(),
      fallback: FalseWidget()
    );
  }
}
```

#### `.multiCase(...)`

This constructor lets you pass multiple cases where every case consists of a boolean expression and a widget builder. 

```dart
class MultiWidget extends StatelessWidget {

  Widget build(BuildContext context) {

    final int randomNumber = 69;
    final String randomOS = 'Linux';
    final bool isSchroedingersCatAlive = true; // Hopefully

    return Conditional.multiCase(
      cases: [
        Case(
          condition: randomNumber == 0,
          widget: NumberWidget()
        ),
        Case(
          condition: randomOS == 'Linux',
          widget: OSWidget() // <-- This is returned
        ),
        Case(
          condition: isSchroedingersCatAlive,
          widget: SchroedingersWidget()
        )
      ],
      fallback: OtherWidget()
    )
  }
}
```

#### `.multiMatch(...)`

This constructor lets you compare objects.

```dart
class CarWidget extends StatelessWidget {

  Widget build(BuildContext context) {

    final String carCompany = 'Tesla';

    return Conditional.multiMatch<String>(
      value: carCompany,
      values: [
        Value(
          value: 'Tesla',
          widget: TeslaWidget() // <-- This is returned
        ),
        Value(
          value: 'Mercedes',
          widget: MercedesWidget()
        ),
        Value(
          value: 'BMW',
          widget: BMWWidget()
        )
      ],
      fallback: OtherWidget()
    );
  }
}
```

or

```dart
enum Seasons {
    summer,
    autumn,
    winter,
    spring
}

class SeasonWidget extends StatelessWidget {

  Widget build(BuildContext context) {

    final Seasons season = Seasons.winter;

    return Conditional.multiMatch<Seasons>(
      value: season,
      values: [
        Value(
          value: Seasons.summer,
          widget: SummerWidget()
        ),
        Value(
          value: Seasons.autumn,
          widget: AutumnWidget()
        ),
        Value(
          value: Seasons.winter,
          widget: WinterWidget() // <-- This is returned
        ),
        Value(
          value: Seasons.spring,
          widget: SpringWidget()
        )
      ],
      fallback: OtherWidget()
    );
  }
}
```

## Additional features ⚜️

### Optional Widgets

In some cases you don't even want to render any widget if a given condition isn't fullfilled.
Therefore we introduced additional functions that can also return `null`.

- `.optionalSingle(...)`
- `.optionalMultiCase(...)`
- `.optionalMultiMatch(...)`

### isActive

Sometimes you even want to make cases conditional. Therefore we introduces `isActive` as a parameter. If you don't want one or more cases to be in considered for the build method, just pass `true` to it like in the following example:

```dart
class ProfileWidget extends StatelessWidget {

  Widget build(BuildContext context) {

    final bool iLoveDart = true;
    final bool possiblyChanging = false;

    return Conditional.multiCase(
      cases: [
        Case(
          condition: iLoveDart,
          isActive: possiblyChanging,
          widget: FirstWidget()
        ),
        Case(
          condition: iLoveDart,
          widget: SecondWidget() // <-- This is returned
        )
      ],
      fallback: OtherWidget()
    )
  }
}
```

## Rules ✅

- Only cases marked as `isActive` will be considered. This is true by default.

- The first widget whose case is true will be returned.

- The default fallback widget is `SizedBox.shrink()` if you're not using one of the functions introduced in version `2.0.0`.

## Contribution 💙

Always open for contribution! Contributors will be listed here.