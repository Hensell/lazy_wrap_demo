import 'package:flutter/material.dart';
import 'package:lazy_wrap_demo/l10n/app_localizations.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../shared/preferences/ui_preferences_controller.dart';
import '../../shared/widgets/preferences_actions.dart';
import '../demo/grid_demo_page.dart';
import 'widgets/mode_card.dart';

class HomePage extends StatelessWidget {
  const HomePage({
    super.key,
    required this.preferencesController,
  });

  final UiPreferencesController preferencesController;

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final theme = Theme.of(context);

    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              theme.colorScheme.surface,
              theme.colorScheme.surfaceContainerHighest.withValues(alpha: 0.3),
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: SafeArea(
          child: LayoutBuilder(
          builder: (context, constraints) {
            final width = constraints.maxWidth;
            final isXs = width < 420;
            final isSm = width >= 420 && width < 700;
            final isMd = width >= 700 && width < 1024;
            final compact = width < 900;
            final horizontalPadding = isXs ? 12.0 : (isSm ? 16.0 : (isMd ? 24.0 : 36.0));
            final verticalPadding = isXs ? 14.0 : 24.0;
            final titleStyle = (isXs ? theme.textTheme.headlineSmall : theme.textTheme.headlineMedium)
                ?.copyWith(fontWeight: FontWeight.w900);
            final subtitleStyle = (isXs ? theme.textTheme.bodyLarge : theme.textTheme.titleMedium)
                ?.copyWith(
                  color: theme.colorScheme.onSurfaceVariant,
                  height: 1.35,
                );

            final contentWidth = width > 1440 ? 1280.0 : (width > 1200 ? 1120.0 : width);
            final cardWidth = compact
                ? contentWidth
                : ((contentWidth - 16) / 2).clamp(360.0, 620.0);

            return Center(
              child: SingleChildScrollView(
                padding: EdgeInsets.symmetric(
                  horizontal: horizontalPadding,
                  vertical: verticalPadding,
                ),
                child: ConstrainedBox(
                  constraints: BoxConstraints(maxWidth: contentWidth),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Wrap(
                        alignment: WrapAlignment.spaceBetween,
                        crossAxisAlignment: WrapCrossAlignment.center,
                        runSpacing: 12,
                        spacing: 12,
                        children: [
                          Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Container(
                                height: isXs ? 44 : 56,
                                width: isXs ? 44 : 56,
                                decoration: BoxDecoration(
                                  gradient: LinearGradient(
                                    colors: [
                                      theme.colorScheme.primary,
                                      theme.colorScheme.tertiary,
                                    ],
                                    begin: Alignment.topLeft,
                                    end: Alignment.bottomRight,
                                  ),
                                  borderRadius: BorderRadius.circular(16),
                                  boxShadow: [
                                    BoxShadow(
                                      color: theme.colorScheme.primary.withValues(alpha: 0.3),
                                      blurRadius: 12,
                                      offset: const Offset(0, 4),
                                    ),
                                  ],
                                ),
                                child: Icon(
                                  Icons.auto_awesome_rounded,
                                  size: isXs ? 22 : 26,
                                  color: theme.colorScheme.onPrimary,
                                ),
                              ),
                              SizedBox(width: isXs ? 8 : 12),
                              ConstrainedBox(
                                constraints: BoxConstraints(maxWidth: isXs ? width - 84 : 440),
                                child: Text(
                                  l10n.homeTitle,
                                  style: titleStyle,
                                ),
                              ),
                            ],
                          ),
                          PreferencesActions(
                            controller: preferencesController,
                            compact: compact,
                          ),
                        ],
                      ),
                      const SizedBox(height: 18),
                      Text(
                        l10n.homeSubtitle,
                        style: subtitleStyle,
                      ),
                      SizedBox(height: isXs ? 16 : 24),
                      Wrap(
                        spacing: 16,
                        runSpacing: 16,
                        children: [
                          SizedBox(
                            width: cardWidth,
                            child: ModeCard(
                              icon: Icons.grid_view_rounded,
                              title: l10n.fixedModeTitle,
                              description: l10n.fixedModeDescription,
                              tint: theme.colorScheme.primary,
                              onTap: () => _openMode(context, isDynamic: false),
                            ),
                          ),
                          SizedBox(
                            width: cardWidth,
                            child: ModeCard(
                              icon: Icons.auto_awesome_mosaic_rounded,
                              title: l10n.dynamicModeTitle,
                              description: l10n.dynamicModeDescription,
                              tint: theme.colorScheme.tertiary,
                              onTap: () => _openMode(context, isDynamic: true),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: isXs ? 16 : 26),
                      TextButton.icon(
                        onPressed: () => _launchCreatorSite(context),
                        icon: const Icon(Icons.open_in_new_rounded),
                        label: Text(l10n.madeBy),
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    ));
  }

  void _openMode(BuildContext context, {required bool isDynamic}) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (_) => GridDemoPage(
          isDynamic: isDynamic,
          preferencesController: preferencesController,
        ),
      ),
    );
  }

  Future<void> _launchCreatorSite(BuildContext context) async {
    final l10n = AppLocalizations.of(context)!;
    final uri = Uri.parse('https://hensell.dev');

    if (!await launchUrl(uri, mode: LaunchMode.externalApplication) && context.mounted) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(l10n.openSiteError)),
      );
    }
  }
}
