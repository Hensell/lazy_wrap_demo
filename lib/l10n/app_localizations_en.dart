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
  String get brandTagline => 'Flutter layout playground';

  @override
  String get heroEyebrow => 'INTERACTIVE FLUTTER PLAYGROUND';

  @override
  String get heroTitle => 'Wrap layouts. Lazy by default.';

  @override
  String get heroSubtitle => 'Render a million items without building a million widgets. Explore fixed and dynamic layouts in a hands-on Flutter playground.';

  @override
  String get openPlayground => 'Open playground';

  @override
  String get viewPackage => 'View package';

  @override
  String get heroCanvasLabel => 'WRAP PREVIEW';

  @override
  String get heroCanvasCaption => 'collection size';

  @override
  String get benefitWrapTitle => 'True 2D wrap layouts';

  @override
  String get benefitWrapDescription => 'Keep the natural flow of Wrap for cards, chips, and mixed content.';

  @override
  String get benefitLazyTitle => 'Build only what\'s needed';

  @override
  String get benefitLazyDescription => 'Build items as they are needed instead of creating every widget in a large collection up front.';

  @override
  String get benefitDirectionTitle => 'Scroll both ways';

  @override
  String get benefitDirectionDescription => 'Switch between vertical and horizontal layouts without rewriting your UI.';

  @override
  String get chooseModeEyebrow => 'TWO ENGINES, ONE PLAYGROUND';

  @override
  String get chooseModeTitle => 'Pick your starting point';

  @override
  String get chooseModeSubtitle => 'Use fixed geometry when every item shares known dimensions, or choose dynamic geometry for variable sizes. Switch modes any time.';

  @override
  String get fixedModeTitle => 'Fixed geometry';

  @override
  String get fixedModeDescription => 'Uniform cards with known width and height. LazyWrap places them without measuring each child.';

  @override
  String get fixedModeBadge => 'UNIFORM';

  @override
  String get dynamicModeTitle => 'Dynamic geometry';

  @override
  String get dynamicModeDescription => 'Variable-size items measured lazily for flexible, wrap-like compositions.';

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
  String get fixedModeTip => 'Choose fixed mode when every child shares dimensions you know in advance. Use dynamic mode for mixed or unknown sizes.';

  @override
  String get dynamicModeTip => 'Dynamic mode measures variable items in controlled batches and renders them lazily.';

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
