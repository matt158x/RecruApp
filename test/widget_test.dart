
import 'package:flutter_test/flutter_test.dart';
import 'package:recruapp/app.dart';
void main() {
  testWidgets('App starts', (WidgetTester tester) async {
    await tester.pumpWidget(const App());

    expect(find.text('Outlier Finder'), findsOneWidget);
  });
}