// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Spanish Castilian (`es`).
class AppLocalizationsEs extends AppLocalizations {
  AppLocalizationsEs([String locale = 'es']) : super(locale);

  @override
  String get appTitle => 'Demo de Lazy Wrap';

  @override
  String get homeTitle => 'Demo de Lazy Wrap';

  @override
  String get homeSubtitle => 'Un demo de Flutter web de alto rendimiento para renderizar grids enormes de forma fluida. Elige un modo para comenzar.';

  @override
  String get fixedModeTitle => 'Modo fijo';

  @override
  String get fixedModeDescription => 'Todas las tarjetas tienen el mismo tamaño. Ideal para máxima velocidad de scroll.';

  @override
  String get dynamicModeTitle => 'Modo dinámico';

  @override
  String get dynamicModeDescription => 'Cada tarjeta tiene un tamaño aleatorio único. Ideal para layouts tipo masonry.';

  @override
  String get startDemo => 'Iniciar demo';

  @override
  String get madeBy => 'Creado por @Henselldev';

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
  String get gridFixedTitle => 'Modo fijo';

  @override
  String get gridDynamicTitle => 'Modo dinámico';

  @override
  String get gridFixedHeadline => 'Tarjetas de tamaño fijo para máximo rendimiento';

  @override
  String get gridDynamicHeadline => 'Tarjetas de tamaño variable para layouts flexibles';

  @override
  String get gridDescription => 'Haz scroll, cambia orientación y ajusta el radio para comparar el comportamiento.';

  @override
  String get toggleDirectionTooltip => 'Cambiar dirección de scroll';

  @override
  String get directionLabel => 'Dirección';

  @override
  String get directionVertical => 'Vertical';

  @override
  String get directionHorizontal => 'Horizontal';

  @override
  String get borderRadius => 'Radio del borde';

  @override
  String scrollInstruction(String arrow) {
    return 'Prueba el scroll $arrow y cambia la dirección cuando quieras.';
  }

  @override
  String get switchingLayout => 'Cambiando layout...';

  @override
  String get openSiteError => 'No se pudo abrir el sitio web.';

  @override
  String fixedItemLabel(int index) {
    return 'Ítem $index';
  }
}
