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
  AppLocalizations(String locale) : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations? of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  static const LocalizationsDelegate<AppLocalizations> delegate = _AppLocalizationsDelegate();

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
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates = <LocalizationsDelegate<dynamic>>[
    delegate,
    GlobalMaterialLocalizations.delegate,
    GlobalCupertinoLocalizations.delegate,
    GlobalWidgetsLocalizations.delegate,
  ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('en'),
    Locale('es')
  ];

  /// No description provided for @appTitle.
  ///
  /// In en, this message translates to:
  /// **'LazyWrap'**
  String get appTitle;

  /// No description provided for @heroTitle.
  ///
  /// In en, this message translates to:
  /// **'A lazy 2D Wrap for Flutter'**
  String get heroTitle;

  /// No description provided for @openPlayground.
  ///
  /// In en, this message translates to:
  /// **'Try the playground'**
  String get openPlayground;

  /// No description provided for @viewPackage.
  ///
  /// In en, this message translates to:
  /// **'pub.dev'**
  String get viewPackage;

  /// No description provided for @chooseModeTitle.
  ///
  /// In en, this message translates to:
  /// **'Choose a layout'**
  String get chooseModeTitle;

  /// No description provided for @fixedModeTitle.
  ///
  /// In en, this message translates to:
  /// **'Fixed'**
  String get fixedModeTitle;

  /// No description provided for @fixedModeDescription.
  ///
  /// In en, this message translates to:
  /// **'Same width and height, set in advance.'**
  String get fixedModeDescription;

  /// No description provided for @dynamicModeTitle.
  ///
  /// In en, this message translates to:
  /// **'Dynamic'**
  String get dynamicModeTitle;

  /// No description provided for @dynamicModeDescription.
  ///
  /// In en, this message translates to:
  /// **'Different item sizes, measured as needed.'**
  String get dynamicModeDescription;

  /// No description provided for @tryMode.
  ///
  /// In en, this message translates to:
  /// **'Try'**
  String get tryMode;

  /// No description provided for @viewOnGitHub.
  ///
  /// In en, this message translates to:
  /// **'GitHub repository'**
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
  /// **'Playground'**
  String get playgroundTitle;

  /// No description provided for @backToOverview.
  ///
  /// In en, this message translates to:
  /// **'Back to overview'**
  String get backToOverview;

  /// No description provided for @controlsTitle.
  ///
  /// In en, this message translates to:
  /// **'Controls'**
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

  /// No description provided for @openControls.
  ///
  /// In en, this message translates to:
  /// **'Open layout controls'**
  String get openControls;

  /// No description provided for @previewTitle.
  ///
  /// In en, this message translates to:
  /// **'Preview'**
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

class _AppLocalizationsDelegate extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) => <String>['en', 'es'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {


  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'en': return AppLocalizationsEn();
    case 'es': return AppLocalizationsEs();
  }

  throw FlutterError(
    'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.'
  );
}
