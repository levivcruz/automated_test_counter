import 'package:flutter_driver/flutter_driver.dart';

class MyHomePage {
  final counterValue = find.byValueKey('counter-val-key');
  final incrementButton = find.byTooltip('Increment');

  FlutterDriver driver;

  // Construtor MyHomePage
  MyHomePage(this.driver);

  // Criando o objeto getCounterValue
  Future<String> getCounterValue() async => await driver.getText(counterValue);

  // Criando o objeto tapIncrement
  Future<void> tapIncrement() async => await driver.tap(incrementButton);
}
