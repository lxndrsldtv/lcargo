import 'package:flutter_test/flutter_test.dart';
import 'package:lcargo/lc_router.dart';

import 'package:lcargo/main.dart';
import 'package:lcargo/src/widgets/lc_bottom_navigation_bar.dart';

void main() {
  testWidgets('lCargo smoke test', (WidgetTester tester) async {
    await tester.pumpWidget(LCApp(
      lcRouter: LCRouter(),
    ));
    expect(find.byType(LCBottomNavigationBar), findsOneWidget);
  });
}
