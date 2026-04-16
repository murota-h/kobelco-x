import 'package:flutter_test/flutter_test.dart';
import 'package:kobelco_x/main.dart';

void main() {
  testWidgets('App smoke test', (WidgetTester tester) async {
    await tester.pumpWidget(const KobelcoXApp());
    expect(find.text('KOBELCO-X'), findsWidgets);
  });
}
