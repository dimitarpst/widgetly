import 'package:flutter_test/flutter_test.dart';
import 'package:widgetly/main.dart';

void main() {
  testWidgets('Widgetly smoke test', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const WidgetlyApp());

    // Verify that the title appears.
    expect(find.text('UX Pilot Widgets'), findsOneWidget);
  });
}
