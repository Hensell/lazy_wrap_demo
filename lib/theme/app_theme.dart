import 'package:flutter/material.dart';

final class AppTheme {
  static const mint = Color(0xFF047D6B);
  static const mintBright = Color(0xFF5DE2C4);
  static const sunshine = Color(0xFFFFC857);
  static const violet = Color(0xFF7367F0);

  static ThemeData light() {
    const scheme = ColorScheme.light(
      primary: mint,
      onPrimary: Colors.white,
      primaryContainer: Color(0xFFD4F5EC),
      onPrimaryContainer: Color(0xFF053F37),
      secondary: violet,
      onSecondary: Colors.white,
      secondaryContainer: Color(0xFFE8E5FF),
      onSecondaryContainer: Color(0xFF29205F),
      tertiary: Color(0xFF9B6500),
      onTertiary: Colors.white,
      tertiaryContainer: Color(0xFFFFE6AE),
      onTertiaryContainer: Color(0xFF412D00),
      error: Color(0xFFBA1A1A),
      onError: Colors.white,
      surface: Color(0xFFF4F8F7),
      onSurface: Color(0xFF14201D),
      surfaceContainerLowest: Colors.white,
      surfaceContainerLow: Color(0xFFF8FBFA),
      surfaceContainer: Color(0xFFEDF3F1),
      surfaceContainerHigh: Color(0xFFE5EDEA),
      surfaceContainerHighest: Color(0xFFDCE6E3),
      onSurfaceVariant: Color(0xFF52615D),
      outline: Color(0xFF71817C),
      outlineVariant: Color(0xFFC6D2CE),
      shadow: Color(0xFF071B16),
    );
    return _theme(scheme);
  }

  static ThemeData dark() {
    const scheme = ColorScheme.dark(
      primary: mintBright,
      onPrimary: Color(0xFF00382F),
      primaryContainer: Color(0xFF075B4E),
      onPrimaryContainer: Color(0xFFB9F7E7),
      secondary: Color(0xFFBDB6FF),
      onSecondary: Color(0xFF29205F),
      secondaryContainer: Color(0xFF3E3576),
      onSecondaryContainer: Color(0xFFE7E3FF),
      tertiary: sunshine,
      onTertiary: Color(0xFF3F2E00),
      tertiaryContainer: Color(0xFF5D4300),
      onTertiaryContainer: Color(0xFFFFE5A3),
      error: Color(0xFFFFB4AB),
      onError: Color(0xFF690005),
      surface: Color(0xFF081412),
      onSurface: Color(0xFFE2ECE8),
      surfaceContainerLowest: Color(0xFF06100E),
      surfaceContainerLow: Color(0xFF0B1916),
      surfaceContainer: Color(0xFF10211D),
      surfaceContainerHigh: Color(0xFF172B26),
      surfaceContainerHighest: Color(0xFF203631),
      onSurfaceVariant: Color(0xFFACBBB6),
      outline: Color(0xFF7C8C87),
      outlineVariant: Color(0xFF354A44),
      shadow: Colors.black,
    );
    return _theme(scheme);
  }

  static ThemeData _theme(ColorScheme scheme) {
    final base = ThemeData(
      useMaterial3: true,
      colorScheme: scheme,
      scaffoldBackgroundColor: scheme.surface,
      visualDensity: VisualDensity.standard,
    );

    final textTheme = base.textTheme.copyWith(
      displayLarge: base.textTheme.displayLarge?.copyWith(
        fontWeight: FontWeight.w900,
        letterSpacing: -2.4,
        height: 0.98,
      ),
      displayMedium: base.textTheme.displayMedium?.copyWith(
        fontWeight: FontWeight.w900,
        letterSpacing: -1.8,
        height: 1,
      ),
      headlineLarge: base.textTheme.headlineLarge?.copyWith(
        fontWeight: FontWeight.w900,
        letterSpacing: -1,
      ),
      headlineMedium: base.textTheme.headlineMedium?.copyWith(
        fontWeight: FontWeight.w800,
        letterSpacing: -0.6,
      ),
      titleLarge: base.textTheme.titleLarge?.copyWith(
        fontWeight: FontWeight.w800,
        letterSpacing: -0.25,
      ),
      titleMedium: base.textTheme.titleMedium?.copyWith(
        fontWeight: FontWeight.w700,
      ),
      labelLarge: base.textTheme.labelLarge?.copyWith(
        fontWeight: FontWeight.w800,
        letterSpacing: 0.1,
      ),
    );

    final rounded = RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(16),
    );

    return base.copyWith(
      textTheme: textTheme,
      appBarTheme: AppBarTheme(
        centerTitle: false,
        elevation: 0,
        scrolledUnderElevation: 0,
        backgroundColor: Colors.transparent,
        foregroundColor: scheme.onSurface,
      ),
      cardTheme: CardThemeData(
        color: scheme.surfaceContainerLowest,
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(24),
          side: BorderSide(color: scheme.outlineVariant),
        ),
      ),
      dividerTheme: DividerThemeData(color: scheme.outlineVariant),
      filledButtonTheme: FilledButtonThemeData(
        style: FilledButton.styleFrom(
          minimumSize: const Size(48, 50),
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 14),
          shape: rounded,
          textStyle: textTheme.labelLarge,
        ),
      ),
      outlinedButtonTheme: OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
          minimumSize: const Size(48, 48),
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          side: BorderSide(color: scheme.outlineVariant),
          shape: rounded,
          textStyle: textTheme.labelLarge,
        ),
      ),
      textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(
          minimumSize: const Size(48, 48),
          shape: rounded,
          textStyle: textTheme.labelLarge,
        ),
      ),
      iconButtonTheme: IconButtonThemeData(
        style: IconButton.styleFrom(
          minimumSize: const Size(48, 48),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(14),
          ),
        ),
      ),
      segmentedButtonTheme: SegmentedButtonThemeData(
        style: ButtonStyle(
          minimumSize: const WidgetStatePropertyAll(Size(48, 46)),
          shape: WidgetStatePropertyAll(
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
          ),
          side: WidgetStatePropertyAll(
            BorderSide(color: scheme.outlineVariant),
          ),
          textStyle: WidgetStatePropertyAll(textTheme.labelLarge),
        ),
      ),
      sliderTheme: SliderThemeData(
        activeTrackColor: scheme.primary,
        inactiveTrackColor: scheme.surfaceContainerHighest,
        thumbColor: scheme.primary,
        overlayColor: scheme.primary.withValues(alpha: 0.12),
        showValueIndicator: ShowValueIndicator.onlyForDiscrete,
      ),
      snackBarTheme: SnackBarThemeData(
        behavior: SnackBarBehavior.floating,
        backgroundColor: scheme.inverseSurface,
        contentTextStyle: TextStyle(color: scheme.onInverseSurface),
        shape: rounded,
      ),
      menuTheme: MenuThemeData(
        style: MenuStyle(
          backgroundColor: WidgetStatePropertyAll(
            scheme.surfaceContainerLowest,
          ),
          elevation: const WidgetStatePropertyAll(12),
          shape: WidgetStatePropertyAll(rounded),
          side: WidgetStatePropertyAll(
            BorderSide(color: scheme.outlineVariant),
          ),
        ),
      ),
      tooltipTheme: TooltipThemeData(
        decoration: BoxDecoration(
          color: scheme.inverseSurface,
          borderRadius: BorderRadius.circular(8),
        ),
        textStyle: TextStyle(color: scheme.onInverseSurface),
      ),
      pageTransitionsTheme: const PageTransitionsTheme(
        builders: {
          TargetPlatform.android: FadeForwardsPageTransitionsBuilder(),
          TargetPlatform.iOS: CupertinoPageTransitionsBuilder(),
          TargetPlatform.macOS: CupertinoPageTransitionsBuilder(),
          TargetPlatform.linux: FadeForwardsPageTransitionsBuilder(),
          TargetPlatform.windows: FadeForwardsPageTransitionsBuilder(),
          TargetPlatform.fuchsia: FadeForwardsPageTransitionsBuilder(),
        },
      ),
    );
  }
}
