import 'package:flutter/material.dart';
import 'package:lazy_wrap_demo/l10n/app_localizations.dart';

import '../preferences/ui_preferences.dart';
import '../preferences/ui_preferences_controller.dart';

class PreferencesActions extends StatelessWidget {
  const PreferencesActions({
    super.key,
    required this.controller,
    this.compact = false,
  });

  final UiPreferencesController controller;
  final bool compact;

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;

    final children = <Widget>[
      _LanguageMenu(controller: controller, compact: compact, label: l10n.languageLabel),
      const SizedBox(width: 8),
      _ThemeMenu(controller: controller, compact: compact, label: l10n.themeLabel),
    ];

    if (compact) {
      return Wrap(spacing: 8, runSpacing: 8, children: children);
    }

    return Row(mainAxisSize: MainAxisSize.min, children: children);
  }
}

class _LanguageMenu extends StatelessWidget {
  const _LanguageMenu({
    required this.controller,
    required this.compact,
    required this.label,
  });

  final UiPreferencesController controller;
  final bool compact;
  final String label;

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;

    return MenuAnchor(
      menuChildren: [
        MenuItemButton(
          onPressed: () => controller.setLanguage(AppLanguagePreference.system),
          child: Text(l10n.languageSystem),
        ),
        MenuItemButton(
          onPressed: () => controller.setLanguage(AppLanguagePreference.es),
          child: Text(l10n.languageSpanish),
        ),
        MenuItemButton(
          onPressed: () => controller.setLanguage(AppLanguagePreference.en),
          child: Text(l10n.languageEnglish),
        ),
      ],
      builder: (context, menuController, _) {
        return OutlinedButton.icon(
          key: const Key('language_menu_button'),
          onPressed: () {
            if (menuController.isOpen) {
              menuController.close();
            } else {
              menuController.open();
            }
          },
          icon: const Icon(Icons.translate),
          label: Text(_languageLabel(controller.value.languagePreference, l10n, compact, label)),
        );
      },
    );
  }

  String _languageLabel(
    AppLanguagePreference preference,
    AppLocalizations l10n,
    bool compact,
    String base,
  ) {
    final selected = switch (preference) {
      AppLanguagePreference.system => l10n.languageSystem,
      AppLanguagePreference.es => 'ES',
      AppLanguagePreference.en => 'EN',
    };

    if (compact) return selected;
    return '$base: $selected';
  }
}

class _ThemeMenu extends StatelessWidget {
  const _ThemeMenu({
    required this.controller,
    required this.compact,
    required this.label,
  });

  final UiPreferencesController controller;
  final bool compact;
  final String label;

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;

    return MenuAnchor(
      menuChildren: [
        MenuItemButton(
          onPressed: () => controller.setTheme(AppThemePreference.system),
          child: Text(l10n.themeSystem),
        ),
        MenuItemButton(
          onPressed: () => controller.setTheme(AppThemePreference.light),
          child: Text(l10n.themeLight),
        ),
        MenuItemButton(
          onPressed: () => controller.setTheme(AppThemePreference.dark),
          child: Text(l10n.themeDark),
        ),
      ],
      builder: (context, menuController, _) {
        return OutlinedButton.icon(
          key: const Key('theme_menu_button'),
          onPressed: () {
            if (menuController.isOpen) {
              menuController.close();
            } else {
              menuController.open();
            }
          },
          icon: Icon(_themeIcon(controller.value.themePreference)),
          label: Text(_themeLabel(controller.value.themePreference, l10n, compact, label)),
        );
      },
    );
  }

  IconData _themeIcon(AppThemePreference preference) {
    return switch (preference) {
      AppThemePreference.system => Icons.brightness_auto,
      AppThemePreference.light => Icons.light_mode,
      AppThemePreference.dark => Icons.dark_mode,
    };
  }

  String _themeLabel(
    AppThemePreference preference,
    AppLocalizations l10n,
    bool compact,
    String base,
  ) {
    final selected = switch (preference) {
      AppThemePreference.system => l10n.themeSystem,
      AppThemePreference.light => l10n.themeLight,
      AppThemePreference.dark => l10n.themeDark,
    };

    if (compact) return selected;
    return '$base: $selected';
  }
}
