// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Spanish Castilian (`es`).
class AppLocalizationsEs extends AppLocalizations {
  AppLocalizationsEs([String locale = 'es']) : super(locale);

  @override
  String get appTitle => 'LazyWrap Lab';

  @override
  String get brandTagline => 'Laboratorio de rendimiento Flutter';

  @override
  String get heroEyebrow => 'LAZY_WRAP 1.1.1 · LISTO PARA EXPERIMENTAR';

  @override
  String get heroTitle => 'Layouts wrap. Lazy por defecto.';

  @override
  String get heroSubtitle =>
      'Renderiza un millón de elementos sin construir un millón de widgets. Explora layouts fijos y dinámicos en un laboratorio Flutter interactivo.';

  @override
  String get openPlayground => 'Abrir laboratorio';

  @override
  String get viewPackage => 'Ver paquete';

  @override
  String get heroCanvasLabel => 'CANVAS EN VIVO';

  @override
  String get heroCanvasCaption => 'elementos configurados';

  @override
  String get benefitWrapTitle => 'Layouts wrap 2D reales';

  @override
  String get benefitWrapDescription =>
      'Conserva el flujo natural de Wrap para tarjetas, chips y contenido mixto.';

  @override
  String get benefitLazyTitle => 'Construye solo lo necesario';

  @override
  String get benefitLazyDescription =>
      'El renderizado lazy mantiene ágiles las colecciones enormes y cuida la memoria.';

  @override
  String get benefitDirectionTitle => 'Scroll en ambas direcciones';

  @override
  String get benefitDirectionDescription =>
      'Alterna entre layouts verticales y horizontales sin reescribir tu interfaz.';

  @override
  String get chooseModeEyebrow => 'DOS MOTORES, UN LABORATORIO';

  @override
  String get chooseModeTitle => 'Elige tu punto de partida';

  @override
  String get chooseModeSubtitle =>
      'Usa geometría uniforme para máxima velocidad o permite que cada elemento defina su tamaño. Puedes cambiar de modo cuando quieras.';

  @override
  String get fixedModeTitle => 'Geometría fija';

  @override
  String get fixedModeDescription =>
      'Tarjetas uniformes con dimensiones predecibles y la ruta de layout más rápida.';

  @override
  String get fixedModeBadge => 'MÁS RÁPIDO';

  @override
  String get dynamicModeTitle => 'Geometría dinámica';

  @override
  String get dynamicModeDescription =>
      'Elementos de tamaño variable medidos de forma lazy para composiciones flexibles.';

  @override
  String get dynamicModeBadge => 'FLEXIBLE';

  @override
  String get exploreMode => 'Explorar modo';

  @override
  String get madeBy => 'Creado por @Henselldev';

  @override
  String get viewOnGitHub => 'Ver en GitHub';

  @override
  String get openSiteError => 'No se pudo abrir ese enlace.';

  @override
  String get themeLabel => 'Tema';

  @override
  String get themeSystem => 'Sistema';

  @override
  String get themeLight => 'Claro';

  @override
  String get themeDark => 'Oscuro';

  @override
  String get languageLabel => 'Idioma';

  @override
  String get languageSystem => 'Sistema';

  @override
  String get languageSpanish => 'Español';

  @override
  String get languageEnglish => 'Inglés';

  @override
  String get playgroundTitle => 'Laboratorio LazyWrap';

  @override
  String get playgroundSubtitle =>
      'Ajusta el layout y observa cada cambio en vivo.';

  @override
  String get backToOverview => 'Volver al inicio';

  @override
  String get controlsTitle => 'Controles del lab';

  @override
  String get modeLabel => 'Modo de layout';

  @override
  String get fixedModeShort => 'Fijo';

  @override
  String get dynamicModeShort => 'Dinámico';

  @override
  String get directionLabel => 'Dirección del scroll';

  @override
  String get directionVertical => 'Vertical';

  @override
  String get directionHorizontal => 'Horizontal';

  @override
  String get itemCountLabel => 'Tamaño de la colección';

  @override
  String get itemSizeLabel => 'Tamaño del elemento';

  @override
  String get spacingLabel => 'Espaciado';

  @override
  String get borderRadius => 'Radio de esquina';

  @override
  String get reset => 'Restablecer';

  @override
  String get shuffleLayout => 'Variar layout';

  @override
  String get fixedModeTip =>
      'El modo fijo conoce la geometría de cada elemento y calcula las filas con el mínimo trabajo de layout.';

  @override
  String get dynamicModeTip =>
      'El modo dinámico mide elementos variables en lotes controlados y los renderiza de forma lazy.';

  @override
  String get openControls => 'Abrir controles del layout';

  @override
  String get previewTitle => 'Vista previa en vivo';

  @override
  String get copyCode => 'Copiar configuración como código';

  @override
  String get codeCopied => 'Snippet de Flutter copiado al portapapeles.';

  @override
  String itemSemanticLabel(int index) {
    return 'Elemento $index';
  }
}
