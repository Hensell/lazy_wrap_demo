# Lazy Wrap Demo (Flutter Web)

Demo interactivo para mostrar el rendimiento de `lazy_wrap` en dos modos:

- **Fixed mode**: tarjetas de tamaño fijo (máximo rendimiento).
- **Dynamic mode**: tarjetas de tamaño variable (layout flexible).

## Mejoras incluidas

- Localización completa en **Español** e **Inglés**.
- Selector manual de idioma + opción **System** (detecta navegador/sistema).
- Soporte de tema **Light / Dark / System** con persistencia local.
- Rediseño UI/UX responsive para web (desktop/tablet/mobile).
- Mejoras de contraste y legibilidad en ambos temas.

## Ejecutar

```bash
flutter pub get
flutter run -d chrome
```

## Pruebas

```bash
flutter test
```

## Estructura principal

- `lib/app/`: bootstrap de app y configuración global.
- `lib/theme/`: temas light/dark.
- `lib/l10n/`: recursos ARB para localización.
- `lib/features/home/`: pantalla de inicio y selección de modo.
- `lib/features/demo/`: pantalla del demo de grid.
- `lib/shared/preferences/`: estado y persistencia de idioma/tema.
