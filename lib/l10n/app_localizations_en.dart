// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get appTitle => 'LazyWrap';

  @override
  String get heroTitle => 'A lazy 2D Wrap for Flutter';

  @override
  String get openPlayground => 'Try the playground';

  @override
  String get viewPackage => 'pub.dev';

  @override
  String get chooseModeTitle => 'Choose a layout';

  @override
  String get fixedModeTitle => 'Fixed';

  @override
  String get fixedModeDescription => 'Same width and height, set in advance.';

  @override
  String get dynamicModeTitle => 'Dynamic';

  @override
  String get dynamicModeDescription => 'Different item sizes, measured as needed.';

  @override
  String get tryMode => 'Try';

  @override
  String get viewOnGitHub => 'GitHub repository';

  @override
  String get openSiteError => 'Could not open that link.';

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
  String get playgroundTitle => 'Playground';

  @override
  String get backToOverview => 'Back to overview';

  @override
  String get controlsTitle => 'Controls';

  @override
  String get modeLabel => 'Layout mode';

  @override
  String get fixedModeShort => 'Fixed';

  @override
  String get dynamicModeShort => 'Dynamic';

  @override
  String get directionLabel => 'Scroll direction';

  @override
  String get directionVertical => 'Vertical';

  @override
  String get directionHorizontal => 'Horizontal';

  @override
  String get itemCountLabel => 'Collection size';

  @override
  String get itemSizeLabel => 'Item size';

  @override
  String get spacingLabel => 'Spacing';

  @override
  String get borderRadius => 'Corner radius';

  @override
  String get reset => 'Reset';

  @override
  String get shuffleLayout => 'Shuffle layout';

  @override
  String get openControls => 'Open layout controls';

  @override
  String get previewTitle => 'Preview';

  @override
  String get copyCode => 'Copy configuration as code';

  @override
  String get codeCopied => 'Flutter snippet copied to the clipboard.';

  @override
  String itemSemanticLabel(int index) {
    return 'Item $index';
  }
}
