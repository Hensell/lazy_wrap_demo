// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get appTitle => 'LazyWrap Lab';

  @override
  String get brandTagline => 'Flutter performance playground';

  @override
  String get heroEyebrow => 'LAZY_WRAP 1.1.1 · READY TO EXPERIMENT';

  @override
  String get heroTitle => 'Wrap layouts. Lazy by default.';

  @override
  String get heroSubtitle =>
      'Render a million items without building a million widgets. Explore fixed and dynamic layouts in a hands-on Flutter playground.';

  @override
  String get openPlayground => 'Open playground';

  @override
  String get viewPackage => 'View package';

  @override
  String get heroCanvasLabel => 'LIVE CANVAS';

  @override
  String get heroCanvasCaption => 'items configured';

  @override
  String get benefitWrapTitle => 'True 2D wrap layouts';

  @override
  String get benefitWrapDescription =>
      'Keep the natural flow of Wrap for cards, chips, and mixed content.';

  @override
  String get benefitLazyTitle => 'Build only what\'s needed';

  @override
  String get benefitLazyDescription =>
      'Lazy rendering keeps huge collections responsive and memory-conscious.';

  @override
  String get benefitDirectionTitle => 'Scroll both ways';

  @override
  String get benefitDirectionDescription =>
      'Switch between vertical and horizontal layouts without rewriting your UI.';

  @override
  String get chooseModeEyebrow => 'TWO ENGINES, ONE PLAYGROUND';

  @override
  String get chooseModeTitle => 'Pick your starting point';

  @override
  String get chooseModeSubtitle =>
      'Start with uniform geometry for maximum speed or let every item define its own size. You can switch modes at any time.';

  @override
  String get fixedModeTitle => 'Fixed geometry';

  @override
  String get fixedModeDescription =>
      'Uniform cards with predictable dimensions and the fastest possible layout path.';

  @override
  String get fixedModeBadge => 'FASTEST';

  @override
  String get dynamicModeTitle => 'Dynamic geometry';

  @override
  String get dynamicModeDescription =>
      'Variable-size items measured lazily for flexible, wrap-like compositions.';

  @override
  String get dynamicModeBadge => 'FLEXIBLE';

  @override
  String get exploreMode => 'Explore mode';

  @override
  String get madeBy => 'Crafted by @Henselldev';

  @override
  String get viewOnGitHub => 'View on GitHub';

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
  String get playgroundTitle => 'LazyWrap Playground';

  @override
  String get playgroundSubtitle => 'Tune the layout and see every change live.';

  @override
  String get backToOverview => 'Back to overview';

  @override
  String get controlsTitle => 'Lab controls';

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
  String get fixedModeTip =>
      'Fixed mode knows each item\'s geometry up front, so it can calculate rows with minimal layout work.';

  @override
  String get dynamicModeTip =>
      'Dynamic mode measures variable items in controlled batches and renders them lazily.';

  @override
  String get openControls => 'Open layout controls';

  @override
  String get previewTitle => 'Live preview';

  @override
  String get copyCode => 'Copy configuration as code';

  @override
  String get codeCopied => 'Flutter snippet copied to the clipboard.';

  @override
  String itemSemanticLabel(int index) {
    return 'Item $index';
  }
}
