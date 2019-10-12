import 'package:backend/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:shared/shared.dart';

void main() {
  testWidgets('App has a title', (WidgetTester tester) async {
    var services = MockServices();
    await tester.pumpWidget(TodoApp(controller: TodoController(services)));

    final titleFinder = find.text("HTTP Todos");


    expect(titleFinder, findsOneWidget);
  });

  testWidgets('finds and taps the floating action button',
      (WidgetTester tester) async {
    var services = MockServices();
    await tester.pumpWidget(TodoApp(controller: TodoController(services)));
    Finder floatingActionButton = find.byKey(Key('get-todos-button'));
    await tester.tap(floatingActionButton);
    expect(floatingActionButton, findsOneWidget);
    // rebuild the app
    await tester.pumpAndSettle(Duration(seconds: 2));
    final firstTodoFinder = find.text("delectus aut autem");
    expect(firstTodoFinder, findsOneWidget);
  });

  testWidgets('list view scrolls', (WidgetTester tester) async {
    var services = MockServices();
    await tester.pumpWidget(TodoApp(controller: TodoController(services)));
    Finder floatingActionButton = find.byKey(Key('get-todos-button'));
    await tester.tap(floatingActionButton);
    expect(floatingActionButton, findsOneWidget);
    // rebuild the app
    await tester.pumpAndSettle(Duration(seconds: 2));
    Finder listViewFinder = find.byKey(Key('list-view'));
    await tester.tap(listViewFinder);
    expect(listViewFinder, findsOneWidget);
    await tester.drag(listViewFinder, Offset(0.0, -250.0));
    await tester.pump();
    final firstTodoFinder = find.text("delectus aut autem");
    expect(firstTodoFinder, findsNothing);
  });
}
