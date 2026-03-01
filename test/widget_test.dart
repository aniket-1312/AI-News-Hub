import 'package:flutter_test/flutter_test.dart';
import 'package:flutter/material.dart';
import 'package:adf_ala1/main.dart';

void main() {
  testWidgets('App launches', (WidgetTester tester) async {
    await tester.pumpWidget(const MyApp());
    await tester.pump(const Duration(seconds: 3));
    expect(find.text('AI News Hub'), findsWidgets);
  });
}
