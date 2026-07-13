# LazyWrap Lab

Laboratorio interactivo y responsive para explorar [`lazy_wrap`](https://pub.dev/packages/lazy_wrap), un widget Flutter que combina layouts 2D tipo `Wrap` con renderizado lazy.

## Experiencia

- Inicio editorial con una explicación clara de los beneficios del paquete.
- Playground unificado para alternar entre geometría fija y dinámica.
- Colecciones configurables de 1K, 100K o 1M de elementos.
- Controles en vivo para dirección, tamaño, espaciado y radio de esquina.
- Geometría dinámica determinista y acción para variar el layout sin cachés crecientes.
- Generación de un snippet Flutter a partir de la configuración actual.
- Diseño responsive para escritorio, tablet y móvil.
- Temas claro, oscuro y del sistema con persistencia local.
- Localización completa en español e inglés.
- Navegación por teclado, targets táctiles amplios y semántica accesible.

## Ejecutar

```bash
flutter pub get
flutter run -d chrome
```

## Calidad

```bash
dart format --output=none --set-exit-if-changed lib test
flutter analyze --fatal-infos --fatal-warnings
flutter test
flutter build web
```

## Estructura

- `lib/app/`: configuración global de la aplicación.
- `lib/features/home/`: overview y selección del punto de partida.
- `lib/features/demo/`: playground interactivo de `LazyWrap`.
- `lib/l10n/`: recursos de localización ES/EN.
- `lib/shared/`: preferencias persistentes y componentes compartidos.
- `lib/theme/`: sistema visual claro y oscuro.
