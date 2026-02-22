import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:lazy_wrap_demo/app/app.dart';

void main() {
  setUp(() {
    SharedPreferences.setMockInitialValues({});
  });

  testWidgets('renders home and navigates to fixed mode', (tester) async {
    await tester.pumpWidget(const LazyWrapDemoApp());
    await tester.pumpAndSettle();

    expect(find.text('Lazy Wrap Demo'), findsWidgets);
    expect(find.text('Fixed mode'), findsOneWidget);

    await tester.tap(find.text('Fixed mode'));
    await tester.pumpAndSettle();

    expect(find.text('Fixed Mode'), findsOneWidget);
  });

  testWidgets('allows changing language to spanish', (tester) async {
    await tester.pumpWidget(const LazyWrapDemoApp());
    await tester.pumpAndSettle();

    await tester.tap(find.byKey(const Key('language_menu_button')));
    await tester.pumpAndSettle();

    await tester.tap(find.text('Spanish'));
    await tester.pumpAndSettle();

    expect(find.text('Demo de Lazy Wrap'), findsWidgets);
  });
}
