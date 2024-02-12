# flutter_conditonal

Conditional rendering made easy! 💎

[![pub package](https://img.shields.io/pub/v/shelf.svg)](https://pub.dev/packages/flutter_conditional)
[![License](https://img.shields.io/badge/License-BSD_3--Clause-blue.svg)](https://opensource.org/licenses/BSD-3-Clause)

Developed with 💙 and maintained by [scial.app](https://scial.app)

[!["Buy Me A Coffee"](https://www.buymeacoffee.com/assets/img/custom_images/orange_img.png)](https://www.buymeacoffee.com/scial.app)

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
      ideaForName,
      builder: (BuildContext _) => TrueWidget(),
      fallbackBuilder: (BuildContext _) => FalseWidget()
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
          randomNumber == 0,
          builder: (BuildContext _) => NumberWidget()
        ),
        Case(
          randomOS == 'Linux',
          builder: (BuildContext _) => OSWidget() // <-- This is returned
        ),
        Case(
          isSchroedingersCatAlive,
          builder: (BuildContext _) => SchroedingersWidget()
        )
      ],
      fallbackBuilder: (BuildContext _) => OtherWidget()
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
      carCompany,
      values: [
        Value(
          'Tesla',
          builder: (BuildContext _) => TeslaWidget() // <-- This is returned
        ),
        Value(
          'Mercedes',
          builder: (BuildContext _) => MercedesWidget()
        ),
        Value(
          'BMW',
          builder: (BuildContext _) => BMWWidget()
        )
      ],
      fallbackBuilder: (BuildContext _) => OtherWidget()
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
      season,
      values: [
        Value(
          Seasons.summer,
          builder: (BuildContext _) => SummerWidget()
        ),
        Value(
          Seasons.autumn,
          builder: (BuildContext _) => AutumnWidget()
        ),
        Value(
          Seasons.winter,
          builder: (BuildContext _) => WinterWidget() // <-- This is returned
        ),
        Value(
          Seasons.spring,
          builder: (BuildContext _) => SpringWidget()
        )
      ],
      fallbackBuilder: (BuildContext _) => OtherWidget()
    );
  }
}
```

## Additional features ⚜️

Sometimes you even want to make cases conditional. Therefore we introduces `isActive` as a parameter. If you don't want one or more cases to be in considered for the build method, just pass `true` to it like in the following example:

```dart
class ProfileWidget extends StatelessWidget {

  Widget build(BuildContext context) {

    final bool iLoveDart = true;
    final bool possiblyChanging = false;

    return Conditional.multiCase(
      cases: [
        Case(
          iLoveDart,
          isActive: possiblyChanging,
          builder: (BuildContext _) => FirstWidget()
        ),
        Case(
          iLoveDart,
          builder: (BuildContext _) => SecondWidget() // <-- This is returned
        )
      ],
      fallbackBuilder: (BuildContext _) => OtherWidget()
    )
  }
}
```

## Rules ✅

- Only cases marked as `isActive` will be considered. This is true by default.

- The first widget whose case is true will be returned.

- The default fallback widget is `SizedBox.shrink()`

## Contribution 💙

Always open for contribution! Contributors will be listed here.