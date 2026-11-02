// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Spanish Castilian (`es`).
class AppLocalizationsEs extends AppLocalizations {
  AppLocalizationsEs([String locale = 'es']) : super(locale);

  @override
  String get appTitle => 'LazyWrap';

  @override
  String get heroTitle => 'Un Wrap 2D bajo demanda para Flutter';

  @override
  String get openPlayground => 'Probar la demo';

  @override
  String get viewPackage => 'pub.dev';

  @override
  String get chooseModeTitle => 'Elige un layout';

  @override
  String get fixedModeTitle => 'Fijo';

  @override
  String get fixedModeDescription => 'Mismo ancho y alto, definidos de antemano.';

  @override
  String get dynamicModeTitle => 'Dinámico';

  @override
  String get dynamicModeDescription => 'Elementos de distintos tamaños, medidos bajo demanda.';

  @override
  String get tryMode => 'Probar';

  @override
  String get viewOnGitHub => 'Repositorio en GitHub';

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
  String get playgroundTitle => 'Demo';

  @override
  String get backToOverview => 'Volver al inicio';

  @override
  String get controlsTitle => 'Controles';

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
  String get openControls => 'Abrir controles del layout';

  @override
  String get previewTitle => 'Vista previa';

  @override
  String get copyCode => 'Copiar configuración como código';

  @override
  String get codeCopied => 'Snippet de Flutter copiado al portapapeles.';

  @override
  String itemSemanticLabel(int index) {
    return 'Elemento $index';
  }
}
