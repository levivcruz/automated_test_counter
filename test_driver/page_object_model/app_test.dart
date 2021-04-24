import 'package:flutter_driver/flutter_driver.dart';
import 'package:test/test.dart';

import 'page_objects/pages/my_home_page.dart';

void main() {
  group('App Contador | ', () {
    FlutterDriver driver;
    MyHomePage myHomePage;

    setUpAll(() async {
      driver = await FlutterDriver.connect();
      myHomePage = MyHomePage(driver);
    });

    tearDownAll(() async {
      if (driver != null) {
        driver.close();
      }
    });

    test('Incrementar o contador', () async {
      expect(await myHomePage.getCounterValue(), "0");

      await myHomePage.tapIncrement();

      expect(await myHomePage.getCounterValue(), "1");

      await myHomePage.tapIncrement();

      expect(await myHomePage.getCounterValue(), "2");
    });
  });
}
