import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:lcargo/main.dart';

void main() {
  testWidgets('lCargo smoke test', (WidgetTester tester) async {
    await tester.pumpWidget(const LCApp());
    expect(find.byType(Placeholder), findsOneWidget);
  });
}
