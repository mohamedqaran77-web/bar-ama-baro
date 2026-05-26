import 'package:bar_ama_baro_mobile/main.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('shows Somali-first home labels', (tester) async {
    await tester.pumpWidget(const BarAmaBaroApp());

    expect(find.text('Bar ama Baro'), findsOneWidget);
    expect(find.text('Gal Akoonka'), findsOneWidget);
    expect(find.text('Bilow Barashada'), findsOneWidget);
    expect(find.text('Koorsooyin La Doortay'), findsOneWidget);
  });
}
