# LazyWrap demo

Flutter demo for [`lazy_wrap`](https://pub.dev/packages/lazy_wrap), with fixed and variable-size 2D layouts.

The playground includes fixed and variable-size modes, controls for item count, scroll direction, size, spacing, and corner radius, and a button to copy the current configuration as a Flutter snippet. It supports English and Spanish, light and dark themes.

## Ejecutar

```bash
flutter pub get
flutter run -d chrome
```

## Checks

```bash
dart format --output=none --set-exit-if-changed lib test
flutter analyze --fatal-infos --fatal-warnings
flutter test
flutter build web
```

## Structure

- `lib/app/`: app configuration.
- `lib/features/home/`: overview and mode selection.
- `lib/features/demo/`: LazyWrap playground.
- `lib/l10n/`: English and Spanish translations.
- `lib/shared/`: preferences and shared widgets.
- `lib/theme/`: light and dark themes.
