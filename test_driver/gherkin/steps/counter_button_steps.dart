import 'package:flutter_driver/flutter_driver.dart';
import 'package:flutter_gherkin/flutter_gherkin.dart';
import 'package:gherkin/gherkin.dart';

class UserIsInDashboardStep extends GivenWithWorld<FlutterWorld> {
  @override
  Future<void> executeStep() async {
    final locator = find.text('voce apertou o botao tantas vezes: ');
    var locatorExists =
        await FlutterDriverUtils.isPresent(world.driver, locator);
    expectMatch(true, locatorExists);
  }

  @override
  RegExp get pattern => RegExp(r"o usuario esta no painel de controle");
}

class CounterValueStep extends And1WithWorld<int, FlutterWorld> {
  @override
  Future<void> executeStep(int expectedVal) async {
    final locator = find.byValueKey('counter-val-key');
    var counterVal = await FlutterDriverUtils.getText(world.driver, locator);

    expectMatch(expectedVal, int.parse(counterVal));
  }

  @override
  RegExp get pattern => RegExp(r"o valor do contador esta em {int}");
}

class UserTapsIncrementButton extends WhenWithWorld<FlutterWorld> {
  @override
  Future<void> executeStep() async {
    final locator = find.byTooltip('Increment');
    await FlutterDriverUtils.tap(world.driver, locator);
  }

  @override
  RegExp get pattern => RegExp(r"o usuario toca no botao de adicao");
}
