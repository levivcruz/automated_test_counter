import 'dart:async';
import 'package:flutter_gherkin/flutter_gherkin.dart';
import 'package:gherkin/gherkin.dart';
import 'package:glob/glob.dart';

import 'steps/counter_button_steps.dart';

Future<void> main() {
  final config = FlutterTestConfiguration()
    ..features = [Glob(r"test_driver/gherkin/features/**.feature")]
    ..reporters = [
      ProgressReporter(),
      TestRunSummaryReporter(),
      //JsonReporter(path: './report.json')
      JsonReporter(path: 'test_driver/gherkin/report.json')
    ]
    ..hooks = []
    ..stepDefinitions = [
      UserIsInDashboardStep(),
      CounterValueStep(),
      UserTapsIncrementButton(),
    ]
    ..customStepParameterDefinitions = []
    ..restartAppBetweenScenarios = true
    ..targetAppPath = "test_driver/gherkin/app.dart"
    ..exitAfterTestRun = true;
  return GherkinRunner().execute(config);
}
