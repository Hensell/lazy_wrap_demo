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
  /// **'Lazy Wrap Demo'**
  String get appTitle;

  /// No description provided for @homeTitle.
  ///
  /// In en, this message translates to:
  /// **'Lazy Wrap Demo'**
  String get homeTitle;

  /// No description provided for @homeSubtitle.
  ///
  /// In en, this message translates to:
  /// **'A high-performance Flutter web demo to render huge grids smoothly. Pick a mode to begin.'**
  String get homeSubtitle;

  /// No description provided for @fixedModeTitle.
  ///
  /// In en, this message translates to:
  /// **'Fixed mode'**
  String get fixedModeTitle;

  /// No description provided for @fixedModeDescription.
  ///
  /// In en, this message translates to:
  /// **'All cards share the same size. Best for maximum scroll speed.'**
  String get fixedModeDescription;

  /// No description provided for @dynamicModeTitle.
  ///
  /// In en, this message translates to:
  /// **'Dynamic mode'**
  String get dynamicModeTitle;

  /// No description provided for @dynamicModeDescription.
  ///
  /// In en, this message translates to:
  /// **'Each card has a unique random size. Great for masonry-like content.'**
  String get dynamicModeDescription;

  /// No description provided for @startDemo.
  ///
  /// In en, this message translates to:
  /// **'Start demo'**
  String get startDemo;

  /// No description provided for @madeBy.
  ///
  /// In en, this message translates to:
  /// **'Made by @Henselldev'**
  String get madeBy;

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

  /// No description provided for @gridFixedTitle.
  ///
  /// In en, this message translates to:
  /// **'Fixed Mode'**
  String get gridFixedTitle;

  /// No description provided for @gridDynamicTitle.
  ///
  /// In en, this message translates to:
  /// **'Dynamic Mode'**
  String get gridDynamicTitle;

  /// No description provided for @gridFixedHeadline.
  ///
  /// In en, this message translates to:
  /// **'Fixed-size cards for top performance'**
  String get gridFixedHeadline;

  /// No description provided for @gridDynamicHeadline.
  ///
  /// In en, this message translates to:
  /// **'Variable-size cards for flexible layouts'**
  String get gridDynamicHeadline;

  /// No description provided for @gridDescription.
  ///
  /// In en, this message translates to:
  /// **'Scroll, switch orientation, and adjust border radius to compare behavior.'**
  String get gridDescription;

  /// No description provided for @toggleDirectionTooltip.
  ///
  /// In en, this message translates to:
  /// **'Toggle scroll direction'**
  String get toggleDirectionTooltip;

  /// No description provided for @directionLabel.
  ///
  /// In en, this message translates to:
  /// **'Direction'**
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

  /// No description provided for @borderRadius.
  ///
  /// In en, this message translates to:
  /// **'Border radius'**
  String get borderRadius;

  /// No description provided for @scrollInstruction.
  ///
  /// In en, this message translates to:
  /// **'Try scrolling {arrow} and switch direction anytime.'**
  String scrollInstruction(String arrow);

  /// No description provided for @switchingLayout.
  ///
  /// In en, this message translates to:
  /// **'Switching layout...'**
  String get switchingLayout;

  /// No description provided for @openSiteError.
  ///
  /// In en, this message translates to:
  /// **'Could not open website.'**
  String get openSiteError;

  /// No description provided for @fixedItemLabel.
  ///
  /// In en, this message translates to:
  /// **'Item {index}'**
  String fixedItemLabel(int index);
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
