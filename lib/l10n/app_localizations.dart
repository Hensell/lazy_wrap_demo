import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_en.dart';
import 'app_localizations_es.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of AppLocalizations
/// returned by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'l10n/app_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: AppLocalizations.localizationsDelegates,
///   supportedLocales: AppLocalizations.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the AppLocalizations.supportedLocales
/// property.
abstract class AppLocalizations {
  AppLocalizations(String locale)
    : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations? of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  static const LocalizationsDelegate<AppLocalizations> delegate =
      _AppLocalizationsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates =
      <LocalizationsDelegate<dynamic>>[
        delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('en'),
    Locale('es'),
  ];

  /// No description provided for @appTitle.
  ///
  /// In en, this message translates to:
  /// **'LazyWrap Lab'**
  String get appTitle;

  /// No description provided for @brandTagline.
  ///
  /// In en, this message translates to:
  /// **'Flutter performance playground'**
  String get brandTagline;

  /// No description provided for @heroEyebrow.
  ///
  /// In en, this message translates to:
  /// **'LAZY_WRAP 1.1.1 · READY TO EXPERIMENT'**
  String get heroEyebrow;

  /// No description provided for @heroTitle.
  ///
  /// In en, this message translates to:
  /// **'Wrap layouts. Lazy by default.'**
  String get heroTitle;

  /// No description provided for @heroSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Render a million items without building a million widgets. Explore fixed and dynamic layouts in a hands-on Flutter playground.'**
  String get heroSubtitle;

  /// No description provided for @openPlayground.
  ///
  /// In en, this message translates to:
  /// **'Open playground'**
  String get openPlayground;

  /// No description provided for @viewPackage.
  ///
  /// In en, this message translates to:
  /// **'View package'**
  String get viewPackage;

  /// No description provided for @heroCanvasLabel.
  ///
  /// In en, this message translates to:
  /// **'LIVE CANVAS'**
  String get heroCanvasLabel;

  /// No description provided for @heroCanvasCaption.
  ///
  /// In en, this message translates to:
  /// **'items configured'**
  String get heroCanvasCaption;

  /// No description provided for @benefitWrapTitle.
  ///
  /// In en, this message translates to:
  /// **'True 2D wrap layouts'**
  String get benefitWrapTitle;

  /// No description provided for @benefitWrapDescription.
  ///
  /// In en, this message translates to:
  /// **'Keep the natural flow of Wrap for cards, chips, and mixed content.'**
  String get benefitWrapDescription;

  /// No description provided for @benefitLazyTitle.
  ///
  /// In en, this message translates to:
  /// **'Build only what\'s needed'**
  String get benefitLazyTitle;

  /// No description provided for @benefitLazyDescription.
  ///
  /// In en, this message translates to:
  /// **'Lazy rendering keeps huge collections responsive and memory-conscious.'**
  String get benefitLazyDescription;

  /// No description provided for @benefitDirectionTitle.
  ///
  /// In en, this message translates to:
  /// **'Scroll both ways'**
  String get benefitDirectionTitle;

  /// No description provided for @benefitDirectionDescription.
  ///
  /// In en, this message translates to:
  /// **'Switch between vertical and horizontal layouts without rewriting your UI.'**
  String get benefitDirectionDescription;

  /// No description provided for @chooseModeEyebrow.
  ///
  /// In en, this message translates to:
  /// **'TWO ENGINES, ONE PLAYGROUND'**
  String get chooseModeEyebrow;

  /// No description provided for @chooseModeTitle.
  ///
  /// In en, this message translates to:
  /// **'Pick your starting point'**
  String get chooseModeTitle;

  /// No description provided for @chooseModeSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Start with uniform geometry for maximum speed or let every item define its own size. You can switch modes at any time.'**
  String get chooseModeSubtitle;

  /// No description provided for @fixedModeTitle.
  ///
  /// In en, this message translates to:
  /// **'Fixed geometry'**
  String get fixedModeTitle;

  /// No description provided for @fixedModeDescription.
  ///
  /// In en, this message translates to:
  /// **'Uniform cards with predictable dimensions and the fastest possible layout path.'**
  String get fixedModeDescription;

  /// No description provided for @fixedModeBadge.
  ///
  /// In en, this message translates to:
  /// **'FASTEST'**
  String get fixedModeBadge;

  /// No description provided for @dynamicModeTitle.
  ///
  /// In en, this message translates to:
  /// **'Dynamic geometry'**
  String get dynamicModeTitle;

  /// No description provided for @dynamicModeDescription.
  ///
  /// In en, this message translates to:
  /// **'Variable-size items measured lazily for flexible, wrap-like compositions.'**
  String get dynamicModeDescription;

  /// No description provided for @dynamicModeBadge.
  ///
  /// In en, this message translates to:
  /// **'FLEXIBLE'**
  String get dynamicModeBadge;

  /// No description provided for @exploreMode.
  ///
  /// In en, this message translates to:
  /// **'Explore mode'**
  String get exploreMode;

  /// No description provided for @madeBy.
  ///
  /// In en, this message translates to:
  /// **'Crafted by @Henselldev'**
  String get madeBy;

  /// No description provided for @viewOnGitHub.
  ///
  /// In en, this message translates to:
  /// **'View on GitHub'**
  String get viewOnGitHub;

  /// No description provided for @openSiteError.
  ///
  /// In en, this message translates to:
  /// **'Could not open that link.'**
  String get openSiteError;

  /// No description provided for @themeLabel.
  ///
  /// In en, this message translates to:
  /// **'Theme'**
  String get themeLabel;

  /// No description provided for @themeSystem.
  ///
  /// In en, this message translates to:
  /// **'System'**
  String get themeSystem;

  /// No description provided for @themeLight.
  ///
  /// In en, this message translates to:
  /// **'Light'**
  String get themeLight;

  /// No description provided for @themeDark.
  ///
  /// In en, this message translates to:
  /// **'Dark'**
  String get themeDark;

  /// No description provided for @languageLabel.
  ///
  /// In en, this message translates to:
  /// **'Language'**
  String get languageLabel;

  /// No description provided for @languageSystem.
  ///
  /// In en, this message translates to:
  /// **'System'**
  String get languageSystem;

  /// No description provided for @languageSpanish.
  ///
  /// In en, this message translates to:
  /// **'Spanish'**
  String get languageSpanish;

  /// No description provided for @languageEnglish.
  ///
  /// In en, this message translates to:
  /// **'English'**
  String get languageEnglish;

  /// No description provided for @playgroundTitle.
  ///
  /// In en, this message translates to:
  /// **'LazyWrap Playground'**
  String get playgroundTitle;

  /// No description provided for @playgroundSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Tune the layout and see every change live.'**
  String get playgroundSubtitle;

  /// No description provided for @backToOverview.
  ///
  /// In en, this message translates to:
  /// **'Back to overview'**
  String get backToOverview;

  /// No description provided for @controlsTitle.
  ///
  /// In en, this message translates to:
  /// **'Lab controls'**
  String get controlsTitle;

  /// No description provided for @modeLabel.
  ///
  /// In en, this message translates to:
  /// **'Layout mode'**
  String get modeLabel;

  /// No description provided for @fixedModeShort.
  ///
  /// In en, this message translates to:
  /// **'Fixed'**
  String get fixedModeShort;

  /// No description provided for @dynamicModeShort.
  ///
  /// In en, this message translates to:
  /// **'Dynamic'**
  String get dynamicModeShort;

  /// No description provided for @directionLabel.
  ///
  /// In en, this message translates to:
  /// **'Scroll direction'**
  String get directionLabel;

  /// No description provided for @directionVertical.
  ///
  /// In en, this message translates to:
  /// **'Vertical'**
  String get directionVertical;

  /// No description provided for @directionHorizontal.
  ///
  /// In en, this message translates to:
  /// **'Horizontal'**
  String get directionHorizontal;

  /// No description provided for @itemCountLabel.
  ///
  /// In en, this message translates to:
  /// **'Collection size'**
  String get itemCountLabel;

  /// No description provided for @itemSizeLabel.
  ///
  /// In en, this message translates to:
  /// **'Item size'**
  String get itemSizeLabel;

  /// No description provided for @spacingLabel.
  ///
  /// In en, this message translates to:
  /// **'Spacing'**
  String get spacingLabel;

  /// No description provided for @borderRadius.
  ///
  /// In en, this message translates to:
  /// **'Corner radius'**
  String get borderRadius;

  /// No description provided for @reset.
  ///
  /// In en, this message translates to:
  /// **'Reset'**
  String get reset;

  /// No description provided for @shuffleLayout.
  ///
  /// In en, this message translates to:
  /// **'Shuffle layout'**
  String get shuffleLayout;

  /// No description provided for @fixedModeTip.
  ///
  /// In en, this message translates to:
  /// **'Fixed mode knows each item\'s geometry up front, so it can calculate rows with minimal layout work.'**
  String get fixedModeTip;

  /// No description provided for @dynamicModeTip.
  ///
  /// In en, this message translates to:
  /// **'Dynamic mode measures variable items in controlled batches and renders them lazily.'**
  String get dynamicModeTip;

  /// No description provided for @openControls.
  ///
  /// In en, this message translates to:
  /// **'Open layout controls'**
  String get openControls;

  /// No description provided for @previewTitle.
  ///
  /// In en, this message translates to:
  /// **'Live preview'**
  String get previewTitle;

  /// No description provided for @copyCode.
  ///
  /// In en, this message translates to:
  /// **'Copy configuration as code'**
  String get copyCode;

  /// No description provided for @codeCopied.
  ///
  /// In en, this message translates to:
  /// **'Flutter snippet copied to the clipboard.'**
  String get codeCopied;

  /// No description provided for @itemSemanticLabel.
  ///
  /// In en, this message translates to:
  /// **'Item {index}'**
  String itemSemanticLabel(int index);
}

class _AppLocalizationsDelegate
    extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) =>
      <String>['en', 'es'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {
  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'en':
      return AppLocalizationsEn();
    case 'es':
      return AppLocalizationsEs();
  }

  throw FlutterError(
    'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.',
  );
}
