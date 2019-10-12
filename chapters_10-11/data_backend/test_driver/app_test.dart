import 'package:flutter_driver/flutter_driver.dart';
import 'package:test/test.dart';

void main() {
  group("Todo App", () {
    final buttonFinder = find.byValueKey("get-todos-button");
    final completedTodoCounter = find.byValueKey("counter");
    final listViewFinder = find.byValueKey("list-view");
    final lastTodoFinder = find.byValueKey("todo-19");
    final lastTodoSubtitleFinder = find.byValueKey('todo-19-subtitle');

    FlutterDriver driver;

    // Connect to the Flutter driver before running any tests
    setUpAll(() async {
      driver = await FlutterDriver.connect();
    });

    // Close the connection to the driver after the tests have completed
    tearDownAll(() async {
      if (driver != null) {
        await driver.close();
      }
    });
    test('taps fab button', () async {
      await driver.tap(buttonFinder);
      expect(await driver.getText(completedTodoCounter), isNot("0"));
    });

    test('can scroll to bottom', () async {
      final timeline = await driver.traceAction(() async {
        await driver.scrollUntilVisible(
          // Scroll through this list
          listViewFinder,
          // Until we find this item
          lastTodoFinder,
          // In order to scroll down the list, we need to provide a negative
          // value to dyScroll. Ensure this value is a small enough increment to
          // scroll the item into view without potentially scrolling past it.
          //
          // If you need to scroll through horizontal lists, provide a dxScroll
          // argument instead
          dyScroll: -150.0,
        );

        expect(await driver.getText(lastTodoSubtitleFinder), "todo num: 19");
      });

      final summary = TimelineSummary.summarize(timeline);
      await summary.writeSummaryToFile("scrolling_summary", pretty: true);
      await summary.writeTimelineToFile("scrolling_timeline", pretty: true);
    });
  });
}
