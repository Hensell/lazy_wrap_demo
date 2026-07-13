import 'package:flutter/material.dart';
import 'package:lazy_wrap_demo/l10n/app_localizations.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../shared/preferences/ui_preferences_controller.dart';
import '../../shared/widgets/lab_backdrop.dart';
import '../../shared/widgets/preferences_actions.dart';
import '../../theme/app_theme.dart';
import '../demo/grid_demo_page.dart';
import 'widgets/mode_card.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key, required this.preferencesController});

  final UiPreferencesController preferencesController;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LabBackdrop(
        child: SafeArea(
          child: LayoutBuilder(
            builder: (context, constraints) {
              final width = constraints.maxWidth;
              final horizontalPadding = switch (width) {
                < 480 => 16.0,
                < 900 => 24.0,
                _ => 40.0,
              };

              return SingleChildScrollView(
                padding: EdgeInsets.fromLTRB(
                  horizontalPadding,
                  18,
                  horizontalPadding,
                  28,
                ),
                child: Center(
                  child: ConstrainedBox(
                    constraints: const BoxConstraints(maxWidth: 1240),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        _Header(
                          preferencesController: preferencesController,
                          compact: width < 820,
                        ),
                        SizedBox(height: width < 700 ? 52 : 80),
                        _Hero(
                          compact: width < 920,
                          onOpenPlayground: () => _openPlayground(
                            context,
                            initialMode: DemoMode.fixed,
                          ),
                          onViewPackage: () => _launch(
                            context,
                            'https://pub.dev/packages/lazy_wrap',
                          ),
                        ),
                        SizedBox(height: width < 700 ? 56 : 88),
                        const _Benefits(),
                        SizedBox(height: width < 700 ? 56 : 88),
                        _ModeSection(
                          stacked: width < 780,
                          onFixed: () => _openPlayground(
                            context,
                            initialMode: DemoMode.fixed,
                          ),
                          onDynamic: () => _openPlayground(
                            context,
                            initialMode: DemoMode.dynamic,
                          ),
                        ),
                        const SizedBox(height: 56),
                        _Footer(
                          onGitHub: () => _launch(
                            context,
                            'https://github.com/Hensell/lazy_wrap',
                          ),
                          onAuthor: () =>
                              _launch(context, 'https://hensell.dev'),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }

  void _openPlayground(BuildContext context, {required DemoMode initialMode}) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (_) => GridDemoPage(
          initialMode: initialMode,
          preferencesController: preferencesController,
        ),
      ),
    );
  }

  Future<void> _launch(BuildContext context, String url) async {
    final uri = Uri.parse(url);
    if (await launchUrl(uri, mode: LaunchMode.externalApplication)) return;
    if (!context.mounted) return;

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(AppLocalizations.of(context)!.openSiteError)),
    );
  }
}

class _Header extends StatelessWidget {
  const _Header({required this.preferencesController, required this.compact});

  final UiPreferencesController preferencesController;
  final bool compact;

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final theme = Theme.of(context);

    return Row(
      children: [
        Container(
          width: 46,
          height: 46,
          decoration: BoxDecoration(
            color: theme.colorScheme.onSurface,
            borderRadius: BorderRadius.circular(14),
            boxShadow: [
              BoxShadow(
                color: theme.colorScheme.shadow.withValues(alpha: 0.12),
                blurRadius: 20,
                offset: const Offset(0, 8),
              ),
            ],
          ),
          child: Center(
            child: Text(
              'LW',
              style: theme.textTheme.labelLarge?.copyWith(
                color: theme.colorScheme.surface,
                fontWeight: FontWeight.w900,
                letterSpacing: -0.8,
              ),
            ),
          ),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                l10n.appTitle,
                style: theme.textTheme.titleMedium?.copyWith(
                  fontWeight: FontWeight.w900,
                ),
              ),
              if (!compact)
                Text(
                  l10n.brandTagline,
                  style: theme.textTheme.bodySmall?.copyWith(
                    color: theme.colorScheme.onSurfaceVariant,
                  ),
                ),
            ],
          ),
        ),
        PreferencesActions(controller: preferencesController, compact: compact),
      ],
    );
  }
}

class _Hero extends StatelessWidget {
  const _Hero({
    required this.compact,
    required this.onOpenPlayground,
    required this.onViewPackage,
  });

  final bool compact;
  final VoidCallback onOpenPlayground;
  final VoidCallback onViewPackage;

  @override
  Widget build(BuildContext context) {
    final children = [
      Expanded(
        flex: 10,
        child: _HeroCopy(
          onOpenPlayground: onOpenPlayground,
          onViewPackage: onViewPackage,
        ),
      ),
      SizedBox(width: compact ? 0 : 64, height: compact ? 42 : 0),
      const Expanded(flex: 9, child: _HeroPreview()),
    ];

    if (compact) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: children
            .map((child) => child is Expanded ? child.child : child)
            .toList(),
      );
    }
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: children,
    );
  }
}

class _HeroCopy extends StatelessWidget {
  const _HeroCopy({
    required this.onOpenPlayground,
    required this.onViewPackage,
  });

  final VoidCallback onOpenPlayground;
  final VoidCallback onViewPackage;

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final theme = Theme.of(context);
    final width = MediaQuery.sizeOf(context).width;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 7),
          decoration: BoxDecoration(
            color: theme.colorScheme.primaryContainer,
            borderRadius: BorderRadius.circular(99),
            border: Border.all(
              color: theme.colorScheme.primary.withValues(alpha: 0.22),
            ),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                width: 7,
                height: 7,
                decoration: BoxDecoration(
                  color: theme.colorScheme.primary,
                  shape: BoxShape.circle,
                ),
              ),
              const SizedBox(width: 8),
              Flexible(
                child: Text(
                  l10n.heroEyebrow,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: theme.textTheme.labelMedium?.copyWith(
                    color: theme.colorScheme.onPrimaryContainer,
                    fontWeight: FontWeight.w800,
                  ),
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 22),
        Text(
          l10n.heroTitle,
          style:
              (width < 520
                      ? theme.textTheme.displayMedium
                      : theme.textTheme.displayLarge)
                  ?.copyWith(fontSize: width < 390 ? 44 : null),
        ),
        const SizedBox(height: 22),
        ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 600),
          child: Text(
            l10n.heroSubtitle,
            style: theme.textTheme.titleMedium?.copyWith(
              color: theme.colorScheme.onSurfaceVariant,
              fontWeight: FontWeight.w500,
              height: 1.55,
            ),
          ),
        ),
        const SizedBox(height: 30),
        Wrap(
          spacing: 12,
          runSpacing: 12,
          children: [
            FilledButton.icon(
              key: const Key('open_playground_button'),
              onPressed: onOpenPlayground,
              icon: const Icon(Icons.play_arrow_rounded),
              label: Text(l10n.openPlayground),
            ),
            OutlinedButton.icon(
              onPressed: onViewPackage,
              icon: const Icon(Icons.open_in_new_rounded, size: 18),
              label: Text(l10n.viewPackage),
            ),
          ],
        ),
      ],
    );
  }
}

class _HeroPreview extends StatelessWidget {
  const _HeroPreview();

  static const _tiles = [
    (82.0, 66.0, AppTheme.mint),
    (116.0, 66.0, AppTheme.sunshine),
    (72.0, 66.0, AppTheme.violet),
    (132.0, 74.0, AppTheme.violet),
    (88.0, 74.0, AppTheme.mint),
    (106.0, 74.0, AppTheme.sunshine),
    (108.0, 58.0, AppTheme.sunshine),
    (74.0, 58.0, AppTheme.violet),
    (126.0, 58.0, AppTheme.mint),
  ];

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;

    return Container(
      height: 390,
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: isDark ? const Color(0xFF0D1916) : const Color(0xFF10211D),
        borderRadius: BorderRadius.circular(30),
        boxShadow: [
          BoxShadow(
            color: theme.colorScheme.shadow.withValues(alpha: 0.2),
            blurRadius: 44,
            offset: const Offset(0, 24),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(6, 2, 6, 14),
            child: Row(
              children: [
                for (final color in const [
                  Color(0xFFFF6B5E),
                  AppTheme.sunshine,
                  AppTheme.mintBright,
                ]) ...[
                  Container(
                    width: 9,
                    height: 9,
                    margin: const EdgeInsets.only(right: 7),
                    decoration: BoxDecoration(
                      color: color,
                      shape: BoxShape.circle,
                    ),
                  ),
                ],
                const Spacer(),
                Text(
                  l10n.heroCanvasLabel,
                  style: theme.textTheme.labelSmall?.copyWith(
                    color: Colors.white70,
                    fontFamily: 'monospace',
                    letterSpacing: 0.8,
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Container(
              padding: const EdgeInsets.all(18),
              decoration: BoxDecoration(
                color: const Color(0xFF172A25),
                borderRadius: BorderRadius.circular(20),
                border: Border.all(color: Colors.white12),
              ),
              child: Wrap(
                spacing: 10,
                runSpacing: 10,
                children: [
                  for (var index = 0; index < _tiles.length; index++)
                    Container(
                      width: _tiles[index].$1,
                      height: _tiles[index].$2,
                      decoration: BoxDecoration(
                        color: _tiles[index].$3,
                        borderRadius: BorderRadius.circular(14),
                      ),
                      alignment: Alignment.center,
                      child: Text(
                        '#${index + 1}',
                        style: const TextStyle(
                          color: Color(0xFF10211D),
                          fontWeight: FontWeight.w900,
                          fontFamily: 'monospace',
                        ),
                      ),
                    ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(8, 16, 8, 6),
            child: Row(
              children: [
                const Icon(
                  Icons.bolt_rounded,
                  color: AppTheme.mintBright,
                  size: 19,
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: Text(
                    l10n.heroCanvasCaption,
                    style: theme.textTheme.bodySmall?.copyWith(
                      color: Colors.white70,
                    ),
                  ),
                ),
                Text(
                  '1,000,000',
                  style: theme.textTheme.labelLarge?.copyWith(
                    color: Colors.white,
                    fontFamily: 'monospace',
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _Benefits extends StatelessWidget {
  const _Benefits();

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final items = [
      (
        Icons.dashboard_customize_outlined,
        l10n.benefitWrapTitle,
        l10n.benefitWrapDescription,
      ),
      (
        Icons.visibility_outlined,
        l10n.benefitLazyTitle,
        l10n.benefitLazyDescription,
      ),
      (
        Icons.swap_horiz_rounded,
        l10n.benefitDirectionTitle,
        l10n.benefitDirectionDescription,
      ),
    ];
    return LayoutBuilder(
      builder: (context, constraints) {
        final columnCount = switch (constraints.maxWidth) {
          >= 900 => 3,
          >= 600 => 2,
          _ => 1,
        };
        final itemWidth =
            (constraints.maxWidth - (columnCount - 1) * 16) / columnCount;

        return Wrap(
          spacing: 16,
          runSpacing: 16,
          children: [
            for (final item in items)
              SizedBox(
                width: itemWidth,
                child: _BenefitItem(
                  icon: item.$1,
                  title: item.$2,
                  description: item.$3,
                ),
              ),
          ],
        );
      },
    );
  }
}

class _BenefitItem extends StatelessWidget {
  const _BenefitItem({
    required this.icon,
    required this.title,
    required this.description,
  });

  final IconData icon;
  final String title;
  final String description;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 46,
            height: 46,
            decoration: BoxDecoration(
              color: theme.colorScheme.surfaceContainerLowest,
              borderRadius: BorderRadius.circular(14),
              border: Border.all(color: theme.colorScheme.outlineVariant),
            ),
            child: Icon(icon, color: theme.colorScheme.primary, size: 22),
          ),
          const SizedBox(width: 14),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title, style: theme.textTheme.titleSmall),
                const SizedBox(height: 4),
                Text(
                  description,
                  style: theme.textTheme.bodySmall?.copyWith(
                    color: theme.colorScheme.onSurfaceVariant,
                    height: 1.45,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _ModeSection extends StatelessWidget {
  const _ModeSection({
    required this.stacked,
    required this.onFixed,
    required this.onDynamic,
  });

  final bool stacked;
  final VoidCallback onFixed;
  final VoidCallback onDynamic;

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final theme = Theme.of(context);

    final cards = [
      Expanded(
        child: ModeCard(
          key: const Key('mode_fixed_card'),
          icon: Icons.grid_view_rounded,
          title: l10n.fixedModeTitle,
          description: l10n.fixedModeDescription,
          badge: l10n.fixedModeBadge,
          tint: AppTheme.mint,
          onTap: onFixed,
          dynamicPreview: false,
        ),
      ),
      SizedBox(width: stacked ? 0 : 18, height: stacked ? 18 : 0),
      Expanded(
        child: ModeCard(
          key: const Key('mode_dynamic_card'),
          icon: Icons.auto_awesome_mosaic_rounded,
          title: l10n.dynamicModeTitle,
          description: l10n.dynamicModeDescription,
          badge: l10n.dynamicModeBadge,
          tint: AppTheme.violet,
          onTap: onDynamic,
          dynamicPreview: true,
        ),
      ),
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          l10n.chooseModeEyebrow,
          style: theme.textTheme.labelLarge?.copyWith(
            color: theme.colorScheme.primary,
          ),
        ),
        const SizedBox(height: 10),
        Text(l10n.chooseModeTitle, style: theme.textTheme.headlineLarge),
        const SizedBox(height: 10),
        ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 680),
          child: Text(
            l10n.chooseModeSubtitle,
            style: theme.textTheme.bodyLarge?.copyWith(
              color: theme.colorScheme.onSurfaceVariant,
              height: 1.5,
            ),
          ),
        ),
        const SizedBox(height: 28),
        if (stacked)
          Column(
            children: cards
                .map((child) => child is Expanded ? child.child : child)
                .toList(),
          )
        else
          Row(crossAxisAlignment: CrossAxisAlignment.start, children: cards),
      ],
    );
  }
}

class _Footer extends StatelessWidget {
  const _Footer({required this.onGitHub, required this.onAuthor});

  final VoidCallback onGitHub;
  final VoidCallback onAuthor;

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final theme = Theme.of(context);

    return Container(
      padding: const EdgeInsets.only(top: 24),
      decoration: BoxDecoration(
        border: Border(
          top: BorderSide(color: theme.colorScheme.outlineVariant),
        ),
      ),
      child: Wrap(
        alignment: WrapAlignment.spaceBetween,
        crossAxisAlignment: WrapCrossAlignment.center,
        runSpacing: 8,
        children: [
          TextButton.icon(
            onPressed: onAuthor,
            icon: const Icon(Icons.favorite_rounded, size: 18),
            label: Text(l10n.madeBy),
          ),
          TextButton.icon(
            onPressed: onGitHub,
            icon: const Icon(Icons.code_rounded, size: 19),
            label: Text(l10n.viewOnGitHub),
          ),
        ],
      ),
    );
  }
}
