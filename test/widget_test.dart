import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:ews_frontend/main.dart';

void main() {
  testWidgets('App smoke test — renders without crashing', (WidgetTester tester) async {
    await tester.pumpWidget(const ProviderScope(child: EwsApp()));
    expect(find.byType(MaterialApp), findsNothing); // MaterialApp.router
    expect(find.byType(Router<Object>), findsOneWidget);
  });
}
