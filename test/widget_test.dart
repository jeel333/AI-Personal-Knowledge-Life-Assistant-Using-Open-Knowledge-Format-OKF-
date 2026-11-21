
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:life_assistant/main.dart';

void main() {
  testWidgets('Life Assistant app loads successfully', (
    WidgetTester tester,
  ) async {
    // Launch the Life Assistant application.
    await tester.pumpWidget(const LifeAssistantApp());

    // Verify the home dashboard is displayed.
    expect(find.text('Life Assistant'), findsOneWidget);
    expect(find.text('Ask. Plan. Organize.'), findsOneWidget);

    // Verify bottom navigation exists.
    expect(find.byType(NavigationBar), findsOneWidget);
  });

  testWidgets('AI Assistant navigation works', (
    WidgetTester tester,
  ) async {
    await tester.pumpWidget(const LifeAssistantApp());

    // Tap the AI tab in bottom navigation.
    await tester.tap(find.text('AI'));
    await tester.pumpAndSettle();

    // Verify AI Assistant screen appears.
    expect(find.text('How can I help you today?'), findsOneWidget);
  });
}
