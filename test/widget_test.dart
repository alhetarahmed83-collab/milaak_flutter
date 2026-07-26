import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:milaak_flutter/shared/widgets/metric_card.dart';

void main() {
  testWidgets('MetricCard renders Arabic label and value', (tester) async {
    await tester.pumpWidget(
      const MaterialApp(
        home: Directionality(
          textDirection: TextDirection.rtl,
          child: Scaffold(
            body: MetricCard(
              title: 'العقارات',
              value: '12',
              icon: Icons.apartment_rounded,
            ),
          ),
        ),
      ),
    );

    expect(find.text('العقارات'), findsOneWidget);
    expect(find.text('12'), findsOneWidget);
  });
}
