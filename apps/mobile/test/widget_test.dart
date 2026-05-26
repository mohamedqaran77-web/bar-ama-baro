import 'package:bar_ama_baro_mobile/app/bar_ama_baro_app.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('shows splash then onboarding actions', (tester) async {
    await tester.pumpWidget(const BarAmaBaroApp());

    expect(find.text('Bar ama Baro'), findsOneWidget);
    expect(find.byType(CircularProgressIndicator), findsOneWidget);

    await tester.pump(const Duration(milliseconds: 900));
    await tester.pumpAndSettle();

    expect(find.text('Ku baro aqoon tayo leh'), findsOneWidget);
    expect(find.text('Isdiiwaan Geli'), findsOneWidget);
    expect(find.text('Gal Akoonka'), findsOneWidget);
  });

  testWidgets('navigates from onboarding to login', (tester) async {
    await tester.pumpWidget(const BarAmaBaroApp());
    await tester.pump(const Duration(milliseconds: 900));
    await tester.pumpAndSettle();

    await tester.tap(find.text('Gal Akoonka'));
    await tester.pumpAndSettle();

    expect(find.text('Geli email ama lambarka taleefanka si aad u sii wadato.'), findsOneWidget);
    expect(find.text('Hilmaamay Password'), findsOneWidget);
  });
}
