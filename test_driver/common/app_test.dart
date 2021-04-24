import 'package:flutter_driver/flutter_driver.dart';
import 'package:test/test.dart';

void main() {
  final counterTextFinder = find.byValueKey('counter-val-key');
  final buttonFinder = find.byTooltip('Increment');

  group('App Contador | ', () {
    FlutterDriver driver;

    // Connect to the Flutter driver before running any tests.
    setUpAll(() async {
      driver = await FlutterDriver.connect();
    });

    // Close the connection to the driver after the tests have completed.
    tearDownAll(() async {
      if (driver != null) {
        driver.close();
      }
    });

    test('Incrementar o contador', () async {
      expect(await driver.getText(counterTextFinder), "0");

      // First, tap on the button
      await driver.tap(buttonFinder);

      // Then, verify the counter text has been incremented by 1
      expect(await driver.getText(counterTextFinder), "1");

      // Second, tap on the button
      await driver.tap(buttonFinder);

      // Then, verify the counter text has been incremented by 2
      expect(await driver.getText(counterTextFinder), "2");
    });
  });
}
