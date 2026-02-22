import 'package:flutter/material.dart';

enum AppThemePreference { system, light, dark }

enum AppLanguagePreference { system, es, en }

class UiPreferences {
  const UiPreferences({
    this.themePreference = AppThemePreference.system,
    this.languagePreference = AppLanguagePreference.system,
  });

  final AppThemePreference themePreference;
  final AppLanguagePreference languagePreference;

  ThemeMode get themeMode {
    switch (themePreference) {
      case AppThemePreference.light:
        return ThemeMode.light;
      case AppThemePreference.dark:
        return ThemeMode.dark;
      case AppThemePreference.system:
        return ThemeMode.system;
    }
  }

  Locale? get locale {
    switch (languagePreference) {
      case AppLanguagePreference.es:
        return const Locale('es');
      case AppLanguagePreference.en:
        return const Locale('en');
      case AppLanguagePreference.system:
        return null;
    }
  }

  UiPreferences copyWith({
    AppThemePreference? themePreference,
    AppLanguagePreference? languagePreference,
  }) {
    return UiPreferences(
      themePreference: themePreference ?? this.themePreference,
      languagePreference: languagePreference ?? this.languagePreference,
    );
  }
}
