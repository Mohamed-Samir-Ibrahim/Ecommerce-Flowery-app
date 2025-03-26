import 'package:flowery/main.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter/material.dart';

void main() {
  testWidgets('Bottom navigation works correctly', (WidgetTester tester) async {
    await tester.pumpWidget(MyApp());

    expect(find.text('Home'), findsOneWidget);

    // Tap on Categories
    await tester.tap(find.byType(Image).at(1));
    await tester.pump();
    expect(find.text('Categories'), findsOneWidget);

    // Tap on Cart
    await tester.tap(find.byType(Image).at(2));
    await tester.pump();
    expect(find.text('Cart'), findsOneWidget);

    // Tap on Profile
    await tester.tap(find.byType(Image).at(3));
    await tester.pump();
    expect(find.text('Profile'), findsOneWidget);
  });
}
