// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get appTitle => 'Lazy Wrap Demo';

  @override
  String get homeTitle => 'Lazy Wrap Demo';

  @override
  String get homeSubtitle => 'A high-performance Flutter web demo to render huge grids smoothly. Pick a mode to begin.';

  @override
  String get fixedModeTitle => 'Fixed mode';

  @override
  String get fixedModeDescription => 'All cards share the same size. Best for maximum scroll speed.';

  @override
  String get dynamicModeTitle => 'Dynamic mode';

  @override
  String get dynamicModeDescription => 'Each card has a unique random size. Great for masonry-like content.';

  @override
  String get startDemo => 'Start demo';

  @override
  String get madeBy => 'Made by @Henselldev';

  @override
  String get themeLabel => 'Theme';

  @override
  String get themeSystem => 'System';

  @override
  String get themeLight => 'Light';

  @override
  String get themeDark => 'Dark';

  @override
  String get languageLabel => 'Language';

  @override
  String get languageSystem => 'System';

  @override
  String get languageSpanish => 'Spanish';

  @override
  String get languageEnglish => 'English';

  @override
  String get gridFixedTitle => 'Fixed Mode';

  @override
  String get gridDynamicTitle => 'Dynamic Mode';

  @override
  String get gridFixedHeadline => 'Fixed-size cards for top performance';

  @override
  String get gridDynamicHeadline => 'Variable-size cards for flexible layouts';

  @override
  String get gridDescription => 'Scroll, switch orientation, and adjust border radius to compare behavior.';

  @override
  String get toggleDirectionTooltip => 'Toggle scroll direction';

  @override
  String get directionLabel => 'Direction';

  @override
  String get directionVertical => 'Vertical';

  @override
  String get directionHorizontal => 'Horizontal';

  @override
  String get borderRadius => 'Border radius';

  @override
  String scrollInstruction(String arrow) {
    return 'Try scrolling $arrow and switch direction anytime.';
  }

  @override
  String get switchingLayout => 'Switching layout...';

  @override
  String get openSiteError => 'Could not open website.';

  @override
  String fixedItemLabel(int index) {
    return 'Item $index';
  }
}
