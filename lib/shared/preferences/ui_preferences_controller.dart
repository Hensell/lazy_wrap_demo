import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'ui_preferences.dart';

class UiPreferencesController extends ChangeNotifier {
  static const _themeKey = 'ui.theme';
  static const _languageKey = 'ui.language';

  UiPreferences _value = const UiPreferences();
  bool _isReady = false;

  UiPreferences get value => _value;
  bool get isReady => _isReady;

  Future<void> load() async {
    final prefs = await SharedPreferences.getInstance();
    final theme = prefs.getString(_themeKey);
    final language = prefs.getString(_languageKey);

    _value = UiPreferences(
      themePreference: _parseTheme(theme),
      languagePreference: _parseLanguage(language),
    );
    _isReady = true;
    notifyListeners();
  }

  Future<void> setTheme(AppThemePreference next) async {
    _value = _value.copyWith(themePreference: next);
    notifyListeners();

    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_themeKey, next.name);
  }

  Future<void> setLanguage(AppLanguagePreference next) async {
    _value = _value.copyWith(languagePreference: next);
    notifyListeners();

    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_languageKey, next.name);
  }

  AppThemePreference _parseTheme(String? raw) {
    return AppThemePreference.values.firstWhere(
      (value) => value.name == raw,
      orElse: () => AppThemePreference.system,
    );
  }

  AppLanguagePreference _parseLanguage(String? raw) {
    return AppLanguagePreference.values.firstWhere(
      (value) => value.name == raw,
      orElse: () => AppLanguagePreference.system,
    );
  }
}
