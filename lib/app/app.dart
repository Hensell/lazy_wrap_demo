import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:lazy_wrap_demo/l10n/app_localizations.dart';

import '../features/home/home_page.dart';
import '../l10n/l10n.dart';
import '../shared/preferences/ui_preferences_controller.dart';
import '../theme/app_theme.dart';
import 'custom_scroll_behavior.dart';

class LazyWrapDemoApp extends StatefulWidget {
  const LazyWrapDemoApp({super.key});

  @override
  State<LazyWrapDemoApp> createState() => _LazyWrapDemoAppState();
}

class _LazyWrapDemoAppState extends State<LazyWrapDemoApp> {
  late final UiPreferencesController _controller;

  @override
  void initState() {
    super.initState();
    _controller = UiPreferencesController()..load();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (context, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Lazy Wrap Demo',
          locale: _controller.value.locale,
          supportedLocales: supportedLocales,
          localizationsDelegates: const [
            AppLocalizations.delegate,
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
          ],
          theme: AppTheme.light(),
          darkTheme: AppTheme.dark(),
          themeMode: _controller.value.themeMode,
          scrollBehavior: CustomScrollBehavior(),
          home: HomePage(preferencesController: _controller),
        );
      },
    );
  }
}
