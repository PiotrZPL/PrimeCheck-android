import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:primecheck/main.dart';

void main() {
  testWidgets('checks whether entered numbers are prime', (
    WidgetTester tester,
  ) async {
    await tester.pumpWidget(const MyApp());

    expect(find.text("Let's check!"), findsOneWidget);

    await tester.enterText(find.byType(EditableText), '17');
    await tester.tap(find.text('Check'));
    await tester.pump();

    expect(find.text('is a prime number.'), findsOneWidget);

    await tester.enterText(find.byType(EditableText), '21');
    await tester.tap(find.text('Check'));
    await tester.pump();

    expect(find.text('is not a prime number.'), findsOneWidget);
    expect(find.text('It is divisible by 3.'), findsOneWidget);
  });
}
