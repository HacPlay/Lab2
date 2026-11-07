import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:lab2/main.dart';

void main() {
  testWidgets('GemStore application test', (WidgetTester tester) async {
    await tester.pumpWidget(const GemStoreApp());

    expect(find.text('GemStore'), findsOneWidget);
    expect(find.byIcon(Icons.menu), findsOneWidget);
  });

  testWidgets('Product details, favorite, cart message and back navigation', (
    WidgetTester tester,
  ) async {
    tester.view.physicalSize = const Size(390, 844);
    tester.view.devicePixelRatio = 1;
    addTearDown(tester.view.resetPhysicalSize);
    addTearDown(tester.view.resetDevicePixelRatio);

    await tester.pumpWidget(const GemStoreApp());
    await tester.pumpAndSettle();
    await tester.tap(find.text('Turtleneck Sweater'));
    await tester.pumpAndSettle();

    expect(find.text('Add To Cart'), findsOneWidget);
    expect(tester.takeException(), isNull);
    await tester.tap(find.byIcon(Icons.favorite_border));
    await tester.pump();
    expect(find.byIcon(Icons.favorite), findsOneWidget);

    await tester.tap(find.text('Add To Cart'));
    await tester.pump();
    expect(find.text('Turtleneck Sweater added to cart'), findsOneWidget);

    await tester.tap(find.byIcon(Icons.arrow_back_ios_new));
    await tester.pumpAndSettle();
    expect(find.text('GemStore'), findsOneWidget);
    expect(tester.takeException(), isNull);
  });
}
