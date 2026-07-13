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

    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        _LanguageMenu(
          controller: controller,
          compact: compact,
          label: l10n.languageLabel,
        ),
        const SizedBox(width: 8),
        _ThemeMenu(
          controller: controller,
          compact: compact,
          label: l10n.themeLabel,
        ),
      ],
    );
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
    final selected = controller.value.languagePreference;

    return MenuAnchor(
      menuChildren: [
        _menuItem(
          label: l10n.languageSystem,
          selected: selected == AppLanguagePreference.system,
          onPressed: () => controller.setLanguage(AppLanguagePreference.system),
        ),
        _menuItem(
          label: l10n.languageSpanish,
          selected: selected == AppLanguagePreference.es,
          onPressed: () => controller.setLanguage(AppLanguagePreference.es),
        ),
        _menuItem(
          label: l10n.languageEnglish,
          selected: selected == AppLanguagePreference.en,
          onPressed: () => controller.setLanguage(AppLanguagePreference.en),
        ),
      ],
      builder: (context, menuController, _) {
        final selectedLabel = switch (selected) {
          AppLanguagePreference.system => l10n.languageSystem,
          AppLanguagePreference.es => 'ES',
          AppLanguagePreference.en => 'EN',
        };
        void onPressed() => _toggle(menuController);

        if (compact) {
          return Tooltip(
            message: '$label: $selectedLabel',
            child: IconButton.outlined(
              key: const Key('language_menu_button'),
              onPressed: onPressed,
              icon: const Icon(Icons.translate_rounded),
            ),
          );
        }

        return OutlinedButton.icon(
          key: const Key('language_menu_button'),
          onPressed: onPressed,
          icon: const Icon(Icons.translate_rounded, size: 19),
          label: Text('$label: $selectedLabel'),
        );
      },
    );
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
    final selected = controller.value.themePreference;
    final selectedLabel = switch (selected) {
      AppThemePreference.system => l10n.themeSystem,
      AppThemePreference.light => l10n.themeLight,
      AppThemePreference.dark => l10n.themeDark,
    };

    return MenuAnchor(
      menuChildren: [
        _menuItem(
          label: l10n.themeSystem,
          selected: selected == AppThemePreference.system,
          onPressed: () => controller.setTheme(AppThemePreference.system),
        ),
        _menuItem(
          label: l10n.themeLight,
          selected: selected == AppThemePreference.light,
          onPressed: () => controller.setTheme(AppThemePreference.light),
        ),
        _menuItem(
          label: l10n.themeDark,
          selected: selected == AppThemePreference.dark,
          onPressed: () => controller.setTheme(AppThemePreference.dark),
        ),
      ],
      builder: (context, menuController, _) {
        void onPressed() => _toggle(menuController);
        final icon = switch (selected) {
          AppThemePreference.system => Icons.brightness_auto_rounded,
          AppThemePreference.light => Icons.light_mode_rounded,
          AppThemePreference.dark => Icons.dark_mode_rounded,
        };

        if (compact) {
          return Tooltip(
            message: '$label: $selectedLabel',
            child: IconButton.outlined(
              key: const Key('theme_menu_button'),
              onPressed: onPressed,
              icon: Icon(icon),
            ),
          );
        }

        return OutlinedButton.icon(
          key: const Key('theme_menu_button'),
          onPressed: onPressed,
          icon: Icon(icon, size: 19),
          label: Text('$label: $selectedLabel'),
        );
      },
    );
  }
}

MenuItemButton _menuItem({
  required String label,
  required bool selected,
  required VoidCallback onPressed,
}) {
  return MenuItemButton(
    onPressed: onPressed,
    leadingIcon: Icon(selected ? Icons.check_rounded : null, size: 20),
    child: Text(label),
  );
}

void _toggle(MenuController controller) {
  if (controller.isOpen) {
    controller.close();
  } else {
    controller.open();
  }
}
