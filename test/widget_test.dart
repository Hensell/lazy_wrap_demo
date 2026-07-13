import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:lazy_wrap_demo/app/app.dart';
import 'package:lazy_wrap_demo/shared/preferences/ui_preferences.dart';
import 'package:lazy_wrap_demo/shared/preferences/ui_preferences_controller.dart';

void main() {
  setUp(() {
    SharedPreferences.setMockInitialValues({});
  });

  testWidgets('renders the overview and opens fixed mode', (tester) async {
    await _pumpLab(tester);

    expect(find.text('LazyWrap Lab'), findsOneWidget);
    expect(find.text('Wrap layouts. Lazy by default.'), findsOneWidget);
    expect(find.byKey(const Key('mode_fixed_card')), findsOneWidget);

    final fixedCard = find.byKey(const Key('mode_fixed_card'));
    await tester.ensureVisible(fixedCard);
    await tester.pumpAndSettle();
    await tester.tap(fixedCard);
    await tester.pumpAndSettle();

    expect(find.text('LazyWrap Playground'), findsOneWidget);
    expect(find.text('Live preview'), findsOneWidget);
    expect(find.text('Fixed'), findsWidgets);
  });

  testWidgets('changes language to Spanish with a selected menu state', (
    tester,
  ) async {
    await _pumpLab(tester);

    await tester.tap(find.byKey(const Key('language_menu_button')));
    await tester.pumpAndSettle();
    await tester.tap(find.text('Spanish'));
    await tester.pumpAndSettle();

    expect(find.text('Layouts wrap. Lazy por defecto.'), findsOneWidget);
    expect(find.text('Abrir laboratorio'), findsOneWidget);
  });

  testWidgets('switches modes and reveals dynamic controls', (tester) async {
    await _pumpLab(tester);
    final openButton = find.byKey(const Key('open_playground_button'));
    await tester.ensureVisible(openButton);
    await tester.tap(openButton);
    await tester.pumpAndSettle();

    await tester.tap(find.text('Dynamic').first);
    await tester.pump();

    expect(find.byKey(const Key('shuffle_button')), findsOneWidget);
    expect(find.textContaining('Dynamic mode measures'), findsOneWidget);
  });

  testWidgets('keeps the playground usable on a phone viewport', (
    tester,
  ) async {
    await _pumpLab(tester, size: const Size(390, 844));
    final openButton = find.byKey(const Key('open_playground_button'));
    await tester.ensureVisible(openButton);
    await tester.tap(openButton);
    await tester.pumpAndSettle();

    expect(find.byKey(const Key('open_controls_button')), findsOneWidget);
    await tester.tap(find.byKey(const Key('open_controls_button')));
    await tester.pumpAndSettle();

    expect(find.text('Lab controls'), findsOneWidget);
  });

  test('persists language and theme preferences', () async {
    final controller = UiPreferencesController();
    await controller.load();
    await controller.setLanguage(AppLanguagePreference.es);
    await controller.setTheme(AppThemePreference.dark);

    final restored = UiPreferencesController();
    await restored.load();

    expect(restored.value.languagePreference, AppLanguagePreference.es);
    expect(restored.value.themePreference, AppThemePreference.dark);

    controller.dispose();
    restored.dispose();
  });
}

Future<void> _pumpLab(
  WidgetTester tester, {
  Size size = const Size(1400, 900),
}) async {
  tester.view.devicePixelRatio = 1;
  tester.view.physicalSize = size;
  addTearDown(tester.view.reset);

  final controller = UiPreferencesController();
  await controller.load();
  addTearDown(controller.dispose);

  await tester.pumpWidget(LazyWrapDemoApp(preferencesController: controller));
  await tester.pumpAndSettle();
}
