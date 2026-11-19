import 'package:flutter_test/flutter_test.dart';
import 'package:se380_mobile_app/app/constructly_app.dart';

void main() {
  testWidgets('demo login opens the dashboard', (tester) async {
    await tester.pumpWidget(const ConstructlyApp());

    expect(find.text('Constructly'), findsOneWidget);
    expect(find.text('Demo ile devam et'), findsOneWidget);

    await tester.tap(find.text('Demo ile devam et'));
    await tester.pumpAndSettle();

    expect(find.text('Merhaba, Mert'), findsOneWidget);
    expect(find.text('Daireler'), findsOneWidget);
    expect(find.text('Maliyetler'), findsOneWidget);
  });
}
