// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility that Flutter provides. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter_test/flutter_test.dart';

import 'package:rick_morty_challenge/main.dart';

void main() {
  testWidgets('Scroll down test', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const MyApp());

    final gesture = await tester.startGesture(const Offset(0, 0));
    await gesture.moveTo(const Offset(0, 1000));

    await tester.pump();

  });
}
