import 'package:flutter/material.dart';
import 'package:lazy_wrap_demo/l10n/app_localizations.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../shared/preferences/ui_preferences_controller.dart';
import '../../shared/widgets/lab_backdrop.dart';
import '../../shared/widgets/preferences_actions.dart';
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
                        _Header(preferencesController: preferencesController),
                        SizedBox(height: width < 700 ? 48 : 72),
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
                        SizedBox(height: width < 700 ? 64 : 88),
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
  const _Header({required this.preferencesController});

  final UiPreferencesController preferencesController;

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final theme = Theme.of(context);

    return Row(
      children: [
        Expanded(
          child: Text(
            l10n.appTitle,
            style: theme.textTheme.titleLarge?.copyWith(
              fontWeight: FontWeight.w800,
              letterSpacing: -0.4,
            ),
          ),
        ),
        PreferencesActions(
          controller: preferencesController,
          compact: MediaQuery.sizeOf(context).width < 820,
        ),
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
    final copy = _HeroCopy(
      onOpenPlayground: onOpenPlayground,
      onViewPackage: onViewPackage,
    );

    if (compact) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [copy, const SizedBox(height: 36), const _HeroPreview()],
      );
    }

    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Expanded(flex: 10, child: copy),
        const SizedBox(width: 64),
        const Expanded(flex: 9, child: _HeroPreview()),
      ],
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
        Text(
          l10n.heroTitle,
          style:
              (width < 520
                      ? theme.textTheme.displayMedium
                      : theme.textTheme.displayLarge)
                  ?.copyWith(fontSize: width < 390 ? 44 : null),
        ),
        const SizedBox(height: 28),
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
    (0.30, 44.0),
    (0.38, 44.0),
    (0.21, 44.0),
    (0.45, 58.0),
    (0.27, 58.0),
    (0.19, 58.0),
    (0.40, 38.0),
    (0.22, 38.0),
    (0.32, 38.0),
  ];

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final scheme = theme.colorScheme;
    final tileColors = [
      scheme.primaryContainer,
      scheme.secondaryContainer,
      scheme.tertiaryContainer,
    ];

    return Container(
      height: 220,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: scheme.surfaceContainerLow,
        borderRadius: BorderRadius.circular(22),
        border: Border.all(color: scheme.outlineVariant),
      ),
      child: LayoutBuilder(
        builder: (context, constraints) {
          return Wrap(
            spacing: 10,
            runSpacing: 10,
            children: [
              for (var index = 0; index < _tiles.length; index++)
                Container(
                  width: constraints.maxWidth * _tiles[index].$1,
                  height: _tiles[index].$2,
                  decoration: BoxDecoration(
                    color: tileColors[index % tileColors.length],
                    borderRadius: BorderRadius.circular(11),
                    border: Border.all(
                      color: scheme.outlineVariant.withValues(alpha: 0.75),
                    ),
                  ),
                ),
            ],
          );
        },
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
          tint: theme.colorScheme.primary,
          onTap: onFixed,
          dynamicPreview: false,
        ),
      ),
      SizedBox(width: stacked ? 0 : 18, height: stacked ? 18 : 0),
      Expanded(
        child: ModeCard(
          key: const Key('mode_dynamic_card'),
          icon: Icons.dashboard_customize_outlined,
          title: l10n.dynamicModeTitle,
          description: l10n.dynamicModeDescription,
          tint: theme.colorScheme.secondary,
          onTap: onDynamic,
          dynamicPreview: true,
        ),
      ),
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(l10n.chooseModeTitle, style: theme.textTheme.headlineLarge),
        const SizedBox(height: 24),
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
  const _Footer({required this.onGitHub});

  final VoidCallback onGitHub;

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
      alignment: Alignment.centerLeft,
      child: TextButton.icon(
        onPressed: onGitHub,
        icon: const Icon(Icons.code_rounded, size: 19),
        label: Text(l10n.viewOnGitHub),
      ),
    );
  }
}
