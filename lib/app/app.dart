import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:lazy_wrap_demo/l10n/app_localizations.dart';

import '../features/home/home_page.dart';
import '../l10n/l10n.dart';
import '../shared/preferences/ui_preferences_controller.dart';
import '../theme/app_theme.dart';
import 'custom_scroll_behavior.dart';

class LazyWrapDemoApp extends StatelessWidget {
  const LazyWrapDemoApp({super.key, required this.preferencesController});

  final UiPreferencesController preferencesController;

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: preferencesController,
      builder: (context, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          onGenerateTitle: (context) => AppLocalizations.of(context)!.appTitle,
          locale: preferencesController.value.locale,
          supportedLocales: supportedLocales,
          localizationsDelegates: const [
            AppLocalizations.delegate,
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
          ],
          theme: AppTheme.light(),
          darkTheme: AppTheme.dark(),
          themeMode: preferencesController.value.themeMode,
          scrollBehavior: CustomScrollBehavior(),
          home: HomePage(preferencesController: preferencesController),
        );
      },
    );
  }
}
