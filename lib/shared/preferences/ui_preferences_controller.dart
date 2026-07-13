import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'ui_preferences.dart';

class UiPreferencesController extends ChangeNotifier {
  static const _themeKey = 'ui.theme';
  static const _languageKey = 'ui.language';

  UiPreferences _value = const UiPreferences();
  bool _isReady = false;
  SharedPreferences? _preferences;
  Future<void> _pendingWrite = Future<void>.value();

  UiPreferences get value => _value;
  bool get isReady => _isReady;

  Future<void> load() async {
    final prefs = _preferences ??= await SharedPreferences.getInstance();
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
    if (_value.themePreference == next) return;
    _value = _value.copyWith(themePreference: next);
    notifyListeners();
    await _queueWrite((prefs) => prefs.setString(_themeKey, next.name));
  }

  Future<void> setLanguage(AppLanguagePreference next) async {
    if (_value.languagePreference == next) return;
    _value = _value.copyWith(languagePreference: next);
    notifyListeners();
    await _queueWrite((prefs) => prefs.setString(_languageKey, next.name));
  }

  Future<void> _queueWrite(
    Future<bool> Function(SharedPreferences preferences) action,
  ) {
    _pendingWrite = _pendingWrite.then((_) async {
      final preferences = _preferences ??=
          await SharedPreferences.getInstance();
      await action(preferences);
    });
    return _pendingWrite;
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
