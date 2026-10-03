import 'package:flutter/material.dart';
import 'package:flutter_common/flutter_common.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('both theme variants use their expected brightness', () {
    expect(AppTheme.darkTheme().brightness, Brightness.dark);
    expect(AppTheme.lightTheme().brightness, Brightness.light);
  });
  testWidgets('primary button dispatches taps and blocks taps while loading', (tester) async {
    var taps = 0;
    Widget app(bool loading) => MaterialApp(home: Scaffold(body: PrimaryButton(
      text: 'Open', isLoading: loading, onPressed: () => taps++,
    )));
    await tester.pumpWidget(app(false));
    await tester.tap(find.text('Open'));
    expect(taps, 1);
    await tester.pumpWidget(app(true));
    expect(find.byType(CircularProgressIndicator), findsOneWidget);
    expect(tester.widget<ElevatedButton>(find.byType(ElevatedButton)).onPressed, isNull);
  });
}
