import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:myapp/home_screen.dart';

Widget createTestWidget() => const MaterialApp(home: HomeScreen());

void main() {
  testWidgets('deve mostrar saldo inicial como 0.00', (tester) async {
    await tester.pumpWidget(createTestWidget());
    expect(find.text('Saldo: 0.00'), findsOneWidget);
  });

  testWidgets('deve depositar corretamente', (tester) async {
    await tester.pumpWidget(createTestWidget());

    await tester.enterText(find.byKey(const Key('deposit-input')), '100');
    await tester.tap(find.byKey(const Key('deposit-button')));
    await tester.pump();

    expect(find.text('Saldo: 100.00'), findsOneWidget);
  });

  testWidgets('deve sacar corretamente', (tester) async {
    await tester.pumpWidget(createTestWidget());

    // Deposita
    await tester.enterText(find.byKey(const Key('deposit-input')), '100');
    await tester.tap(find.byKey(const Key('deposit-button')));
    await tester.pump();

    // Saca
    await tester.enterText(find.byKey(const Key('withdraw-input')), '30');
    await tester.tap(find.byKey(const Key('withdraw-button')));
    await tester.pump();

    expect(find.text('Saldo: 70.00'), findsOneWidget);
  });
}
