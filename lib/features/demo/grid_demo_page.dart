import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:lazy_wrap/lazy_wrap.dart';
import 'package:lazy_wrap_demo/l10n/app_localizations.dart';

import '../../shared/preferences/ui_preferences_controller.dart';
import '../../shared/widgets/lab_backdrop.dart';
import '../../shared/widgets/preferences_actions.dart';

enum DemoMode { fixed, dynamic }

class GridDemoPage extends StatefulWidget {
  const GridDemoPage({
    super.key,
    required this.initialMode,
    required this.preferencesController,
  });

  final DemoMode initialMode;
  final UiPreferencesController preferencesController;

  @override
  State<GridDemoPage> createState() => _GridDemoPageState();
}

class _GridDemoPageState extends State<GridDemoPage> {
  late DemoMode _mode = widget.initialMode;
  Axis _direction = Axis.vertical;
  int _itemCount = 1000000;
  double _borderRadius = 16;
  double _spacing = 10;
  double _itemExtent = 86;
  int _seed = 3;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LabBackdrop(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(16, 12, 16, 16),
            child: Column(
              children: [
                _PlaygroundHeader(
                  controller: widget.preferencesController,
                  onBack: () => Navigator.of(context).maybePop(),
                ),
                const SizedBox(height: 14),
                Expanded(
                  child: LayoutBuilder(
                    builder: (context, constraints) {
                      if (constraints.maxWidth >= 980) {
                        return _buildDesktopLayout(context);
                      }
                      return _buildCompactLayout(context);
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildDesktopLayout(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        SizedBox(
          width: 332,
          child: _ControlsPanel(
            mode: _mode,
            direction: _direction,
            itemCount: _itemCount,
            borderRadius: _borderRadius,
            spacing: _spacing,
            itemExtent: _itemExtent,
            seed: _seed,
            onModeChanged: (value) => setState(() => _mode = value),
            onDirectionChanged: (value) => setState(() => _direction = value),
            onItemCountChanged: (value) => setState(() => _itemCount = value),
            onBorderRadiusChanged: (value) =>
                setState(() => _borderRadius = value),
            onSpacingChanged: (value) => setState(() => _spacing = value),
            onItemExtentChanged: (value) => setState(() => _itemExtent = value),
            onShuffle: _shuffle,
            onReset: _reset,
          ),
        ),
        const SizedBox(width: 14),
        Expanded(child: _buildPreview()),
      ],
    );
  }

  Widget _buildCompactLayout(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final theme = Theme.of(context);

    return Column(
      children: [
        Container(
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: theme.colorScheme.surfaceContainerLowest,
            borderRadius: BorderRadius.circular(18),
            border: Border.all(color: theme.colorScheme.outlineVariant),
          ),
          child: Row(
            children: [
              Expanded(
                child: SegmentedButton<DemoMode>(
                  key: const Key('compact_mode_selector'),
                  showSelectedIcon: false,
                  segments: [
                    ButtonSegment(
                      value: DemoMode.fixed,
                      icon: const Icon(Icons.grid_view_rounded, size: 18),
                      label: Text(l10n.fixedModeShort),
                    ),
                    ButtonSegment(
                      value: DemoMode.dynamic,
                      icon: const Icon(
                        Icons.auto_awesome_mosaic_rounded,
                        size: 18,
                      ),
                      label: Text(l10n.dynamicModeShort),
                    ),
                  ],
                  selected: {_mode},
                  onSelectionChanged: (selection) =>
                      setState(() => _mode = selection.first),
                ),
              ),
              const SizedBox(width: 8),
              Tooltip(
                message: l10n.openControls,
                child: IconButton.filledTonal(
                  key: const Key('open_controls_button'),
                  onPressed: _openControls,
                  icon: const Icon(Icons.tune_rounded),
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 10),
        Expanded(child: _buildPreview()),
      ],
    );
  }

  Widget _buildPreview() {
    return _PreviewPanel(
      mode: _mode,
      direction: _direction,
      itemCount: _itemCount,
      borderRadius: _borderRadius,
      spacing: _spacing,
      itemExtent: _itemExtent,
      seed: _seed,
      onCopyCode: _copyCode,
    );
  }

  Future<void> _openControls() async {
    await showModalBottomSheet<void>(
      context: context,
      isScrollControlled: true,
      useSafeArea: true,
      showDragHandle: true,
      backgroundColor: Theme.of(context).colorScheme.surfaceContainerLowest,
      builder: (sheetContext) {
        return StatefulBuilder(
          builder: (context, setSheetState) {
            void update(VoidCallback change) {
              setState(change);
              setSheetState(() {});
            }

            return FractionallySizedBox(
              heightFactor: 0.88,
              child: Padding(
                padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
                child: _ControlsPanel(
                  mode: _mode,
                  direction: _direction,
                  itemCount: _itemCount,
                  borderRadius: _borderRadius,
                  spacing: _spacing,
                  itemExtent: _itemExtent,
                  seed: _seed,
                  inBottomSheet: true,
                  onModeChanged: (value) => update(() => _mode = value),
                  onDirectionChanged: (value) =>
                      update(() => _direction = value),
                  onItemCountChanged: (value) =>
                      update(() => _itemCount = value),
                  onBorderRadiusChanged: (value) =>
                      update(() => _borderRadius = value),
                  onSpacingChanged: (value) => update(() => _spacing = value),
                  onItemExtentChanged: (value) =>
                      update(() => _itemExtent = value),
                  onShuffle: () => update(() => _seed++),
                  onReset: () => update(_resetValues),
                ),
              ),
            );
          },
        );
      },
    );
  }

  void _shuffle() => setState(() => _seed++);

  void _reset() => setState(_resetValues);

  void _resetValues() {
    _direction = Axis.vertical;
    _itemCount = 1000000;
    _borderRadius = 16;
    _spacing = 10;
    _itemExtent = 86;
    _seed = 3;
  }

  Future<void> _copyCode() async {
    final constructor = _mode == DemoMode.fixed ? 'fixed' : 'dynamic';
    final estimates = _mode == DemoMode.fixed
        ? '\n  estimatedItemWidth: ${(_itemExtent * 1.28).round()},'
              '\n  estimatedItemHeight: ${_itemExtent.round()},'
        : '';
    final code =
        '''LazyWrap.$constructor(
  itemCount: $_itemCount,$estimates
  spacing: ${_spacing.round()},
  runSpacing: ${_spacing.round()},
  scrollDirection: Axis.${_direction.name},
  itemBuilder: (context, index) => YourItem(index),
)''';
    await Clipboard.setData(ClipboardData(text: code));
    if (!mounted) return;

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(AppLocalizations.of(context)!.codeCopied),
        duration: const Duration(seconds: 2),
      ),
    );
  }
}

class _PlaygroundHeader extends StatelessWidget {
  const _PlaygroundHeader({required this.controller, required this.onBack});

  final UiPreferencesController controller;
  final VoidCallback onBack;

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final theme = Theme.of(context);
    final compact = MediaQuery.sizeOf(context).width < 760;

    return Row(
      children: [
        Tooltip(
          message: l10n.backToOverview,
          child: IconButton.outlined(
            key: const Key('back_button'),
            onPressed: onBack,
            icon: const Icon(Icons.arrow_back_rounded),
          ),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(l10n.playgroundTitle, style: theme.textTheme.titleLarge),
              if (!compact)
                Text(
                  l10n.playgroundSubtitle,
                  style: theme.textTheme.bodySmall?.copyWith(
                    color: theme.colorScheme.onSurfaceVariant,
                  ),
                ),
            ],
          ),
        ),
        PreferencesActions(controller: controller, compact: true),
      ],
    );
  }
}

class _ControlsPanel extends StatelessWidget {
  const _ControlsPanel({
    required this.mode,
    required this.direction,
    required this.itemCount,
    required this.borderRadius,
    required this.spacing,
    required this.itemExtent,
    required this.seed,
    required this.onModeChanged,
    required this.onDirectionChanged,
    required this.onItemCountChanged,
    required this.onBorderRadiusChanged,
    required this.onSpacingChanged,
    required this.onItemExtentChanged,
    required this.onShuffle,
    required this.onReset,
    this.inBottomSheet = false,
  });

  final DemoMode mode;
  final Axis direction;
  final int itemCount;
  final double borderRadius;
  final double spacing;
  final double itemExtent;
  final int seed;
  final ValueChanged<DemoMode> onModeChanged;
  final ValueChanged<Axis> onDirectionChanged;
  final ValueChanged<int> onItemCountChanged;
  final ValueChanged<double> onBorderRadiusChanged;
  final ValueChanged<double> onSpacingChanged;
  final ValueChanged<double> onItemExtentChanged;
  final VoidCallback onShuffle;
  final VoidCallback onReset;
  final bool inBottomSheet;

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final theme = Theme.of(context);

    return Container(
      decoration: BoxDecoration(
        color: theme.colorScheme.surfaceContainerLowest,
        borderRadius: BorderRadius.circular(22),
        border: Border.all(color: theme.colorScheme.outlineVariant),
        boxShadow: inBottomSheet
            ? null
            : [
                BoxShadow(
                  color: theme.colorScheme.shadow.withValues(alpha: 0.06),
                  blurRadius: 24,
                  offset: const Offset(0, 12),
                ),
              ],
      ),
      child: SingleChildScrollView(
        padding: const EdgeInsets.all(18),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Row(
              children: [
                Container(
                  width: 36,
                  height: 36,
                  decoration: BoxDecoration(
                    color: theme.colorScheme.primaryContainer,
                    borderRadius: BorderRadius.circular(11),
                  ),
                  child: Icon(
                    Icons.tune_rounded,
                    color: theme.colorScheme.onPrimaryContainer,
                    size: 20,
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: Text(
                    l10n.controlsTitle,
                    style: theme.textTheme.titleMedium,
                  ),
                ),
                TextButton(onPressed: onReset, child: Text(l10n.reset)),
              ],
            ),
            const SizedBox(height: 22),
            _ControlLabel(l10n.modeLabel),
            const SizedBox(height: 8),
            SegmentedButton<DemoMode>(
              key: const Key('mode_selector'),
              showSelectedIcon: false,
              segments: [
                ButtonSegment(
                  value: DemoMode.fixed,
                  icon: const Icon(Icons.grid_view_rounded, size: 18),
                  label: Text(l10n.fixedModeShort),
                ),
                ButtonSegment(
                  value: DemoMode.dynamic,
                  icon: const Icon(Icons.auto_awesome_mosaic_rounded, size: 18),
                  label: Text(l10n.dynamicModeShort),
                ),
              ],
              selected: {mode},
              onSelectionChanged: (selection) => onModeChanged(selection.first),
            ),
            const SizedBox(height: 22),
            _ControlLabel(l10n.directionLabel),
            const SizedBox(height: 8),
            SegmentedButton<Axis>(
              showSelectedIcon: false,
              segments: [
                ButtonSegment(
                  value: Axis.vertical,
                  icon: const Icon(Icons.swap_vert_rounded, size: 18),
                  label: Text(l10n.directionVertical),
                ),
                ButtonSegment(
                  value: Axis.horizontal,
                  icon: const Icon(Icons.swap_horiz_rounded, size: 18),
                  label: Text(l10n.directionHorizontal),
                ),
              ],
              selected: {direction},
              onSelectionChanged: (selection) =>
                  onDirectionChanged(selection.first),
            ),
            const SizedBox(height: 22),
            _ControlLabel(l10n.itemCountLabel),
            const SizedBox(height: 8),
            SegmentedButton<int>(
              showSelectedIcon: false,
              segments: const [
                ButtonSegment(value: 1000, label: Text('1K')),
                ButtonSegment(value: 100000, label: Text('100K')),
                ButtonSegment(value: 1000000, label: Text('1M')),
              ],
              selected: {itemCount},
              onSelectionChanged: (selection) =>
                  onItemCountChanged(selection.first),
            ),
            const SizedBox(height: 20),
            _SliderControl(
              label: l10n.itemSizeLabel,
              value: itemExtent,
              min: 64,
              max: 124,
              divisions: 10,
              unit: 'px',
              onChanged: onItemExtentChanged,
            ),
            const SizedBox(height: 14),
            _SliderControl(
              label: l10n.spacingLabel,
              value: spacing,
              min: 4,
              max: 24,
              divisions: 10,
              unit: 'px',
              onChanged: onSpacingChanged,
            ),
            const SizedBox(height: 14),
            _SliderControl(
              label: l10n.borderRadius,
              value: borderRadius,
              min: 0,
              max: 32,
              divisions: 8,
              unit: 'px',
              onChanged: onBorderRadiusChanged,
            ),
            if (mode == DemoMode.dynamic) ...[
              const SizedBox(height: 16),
              OutlinedButton.icon(
                key: const Key('shuffle_button'),
                onPressed: onShuffle,
                icon: const Icon(Icons.shuffle_rounded, size: 19),
                label: Text('${l10n.shuffleLayout} · $seed'),
              ),
            ],
            const SizedBox(height: 20),
            Container(
              padding: const EdgeInsets.all(14),
              decoration: BoxDecoration(
                color: theme.colorScheme.primaryContainer.withValues(
                  alpha: 0.55,
                ),
                borderRadius: BorderRadius.circular(14),
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Icon(
                    Icons.lightbulb_outline_rounded,
                    color: theme.colorScheme.onPrimaryContainer,
                    size: 19,
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: Text(
                      mode == DemoMode.fixed
                          ? l10n.fixedModeTip
                          : l10n.dynamicModeTip,
                      style: theme.textTheme.bodySmall?.copyWith(
                        color: theme.colorScheme.onPrimaryContainer,
                        height: 1.45,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _ControlLabel extends StatelessWidget {
  const _ControlLabel(this.label);

  final String label;

  @override
  Widget build(BuildContext context) {
    return Text(
      label,
      style: Theme.of(context).textTheme.labelLarge?.copyWith(
        color: Theme.of(context).colorScheme.onSurfaceVariant,
      ),
    );
  }
}

class _SliderControl extends StatelessWidget {
  const _SliderControl({
    required this.label,
    required this.value,
    required this.min,
    required this.max,
    required this.divisions,
    required this.unit,
    required this.onChanged,
  });

  final String label;
  final double value;
  final double min;
  final double max;
  final int divisions;
  final String unit;
  final ValueChanged<double> onChanged;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final valueLabel = '${value.round()} $unit';

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Row(
          children: [
            Expanded(child: _ControlLabel(label)),
            Text(
              valueLabel,
              style: theme.textTheme.labelMedium?.copyWith(
                fontFamily: 'monospace',
                color: theme.colorScheme.primary,
                fontWeight: FontWeight.w800,
              ),
            ),
          ],
        ),
        Slider(
          value: value,
          min: min,
          max: max,
          divisions: divisions,
          label: valueLabel,
          semanticFormatterCallback: (_) => '$label: $valueLabel',
          onChanged: onChanged,
        ),
      ],
    );
  }
}

class _PreviewPanel extends StatelessWidget {
  const _PreviewPanel({
    required this.mode,
    required this.direction,
    required this.itemCount,
    required this.borderRadius,
    required this.spacing,
    required this.itemExtent,
    required this.seed,
    required this.onCopyCode,
  });

  final DemoMode mode;
  final Axis direction;
  final int itemCount;
  final double borderRadius;
  final double spacing;
  final double itemExtent;
  final int seed;
  final VoidCallback onCopyCode;

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final theme = Theme.of(context);

    return Container(
      decoration: BoxDecoration(
        color: theme.colorScheme.surfaceContainerLowest,
        borderRadius: BorderRadius.circular(22),
        border: Border.all(color: theme.colorScheme.outlineVariant),
        boxShadow: [
          BoxShadow(
            color: theme.colorScheme.shadow.withValues(alpha: 0.06),
            blurRadius: 24,
            offset: const Offset(0, 12),
          ),
        ],
      ),
      clipBehavior: Clip.antiAlias,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 12, 10, 12),
            child: Row(
              children: [
                Container(
                  width: 9,
                  height: 9,
                  decoration: BoxDecoration(
                    color: theme.colorScheme.primary,
                    shape: BoxShape.circle,
                    boxShadow: [
                      BoxShadow(
                        color: theme.colorScheme.primary.withValues(
                          alpha: 0.45,
                        ),
                        blurRadius: 7,
                      ),
                    ],
                  ),
                ),
                const SizedBox(width: 9),
                Expanded(
                  child: Text(
                    l10n.previewTitle,
                    style: theme.textTheme.titleSmall,
                  ),
                ),
                _MetaChip(
                  label: mode == DemoMode.fixed
                      ? l10n.fixedModeShort
                      : l10n.dynamicModeShort,
                ),
                const SizedBox(width: 6),
                _MetaChip(label: _formatItemCount(itemCount)),
                const SizedBox(width: 4),
                Tooltip(
                  message: l10n.copyCode,
                  child: IconButton(
                    key: const Key('copy_code_button'),
                    onPressed: onCopyCode,
                    icon: const Icon(Icons.content_copy_rounded, size: 20),
                  ),
                ),
              ],
            ),
          ),
          Divider(height: 1, color: theme.colorScheme.outlineVariant),
          Expanded(
            child: ColoredBox(
              color: theme.colorScheme.surfaceContainerLow,
              child: Padding(
                padding: const EdgeInsets.all(12),
                child: _buildLazyWrap(context),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildLazyWrap(BuildContext context) {
    final key = ValueKey(
      '${mode.name}-${direction.name}-$itemCount-'
      '${borderRadius.round()}-${spacing.round()}-'
      '${itemExtent.round()}-$seed',
    );

    if (mode == DemoMode.fixed) {
      final width = itemExtent * 1.28;
      return LazyWrap.fixed(
        key: key,
        itemCount: itemCount,
        estimatedItemWidth: width,
        estimatedItemHeight: itemExtent,
        spacing: spacing,
        runSpacing: spacing,
        padding: const EdgeInsets.all(4),
        cacheExtent: 700,
        scrollDirection: direction,
        itemBuilder: (context, index) => _DemoTile(
          index: index,
          width: width,
          height: itemExtent,
          borderRadius: borderRadius,
          dynamicMode: false,
        ),
      );
    }

    return LazyWrap.dynamic(
      key: key,
      itemCount: itemCount,
      spacing: spacing,
      runSpacing: spacing,
      padding: const EdgeInsets.all(4),
      cacheExtent: 700,
      batchSize: 180,
      measureBatchSize: 24,
      fadeInItems: true,
      fadeInDuration: const Duration(milliseconds: 180),
      fadeInCurve: Curves.easeOutCubic,
      scrollDirection: direction,
      loadingBuilder: (context) => const Center(
        child: Padding(
          padding: EdgeInsets.all(16),
          child: SizedBox(
            width: 20,
            height: 20,
            child: CircularProgressIndicator(strokeWidth: 2.5),
          ),
        ),
      ),
      itemBuilder: (context, index) => _DemoTile(
        index: index,
        width: _dynamicWidth(index),
        height: _dynamicHeight(index),
        borderRadius: borderRadius,
        dynamicMode: true,
      ),
    );
  }

  double _dynamicWidth(int index) {
    final variation = ((index * 37 + seed * 19) % 6) * 0.13;
    return itemExtent * (0.9 + variation);
  }

  double _dynamicHeight(int index) {
    final variation = ((index * 29 + seed * 11) % 5) * 0.12;
    return itemExtent * (0.68 + variation);
  }

  String _formatItemCount(int value) => switch (value) {
    1000 => '1K',
    100000 => '100K',
    1000000 => '1M',
    _ => '$value',
  };
}

class _MetaChip extends StatelessWidget {
  const _MetaChip({required this.label});

  final String label;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 9, vertical: 5),
      decoration: BoxDecoration(
        color: theme.colorScheme.surfaceContainer,
        borderRadius: BorderRadius.circular(99),
        border: Border.all(color: theme.colorScheme.outlineVariant),
      ),
      child: Text(
        label,
        style: theme.textTheme.labelSmall?.copyWith(
          color: theme.colorScheme.onSurfaceVariant,
          fontFamily: 'monospace',
          fontWeight: FontWeight.w800,
        ),
      ),
    );
  }
}

class _DemoTile extends StatelessWidget {
  const _DemoTile({
    required this.index,
    required this.width,
    required this.height,
    required this.borderRadius,
    required this.dynamicMode,
  });

  final int index;
  final double width;
  final double height;
  final double borderRadius;
  final bool dynamicMode;

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final theme = Theme.of(context);
    final palette = [
      (
        theme.colorScheme.primaryContainer,
        theme.colorScheme.onPrimaryContainer,
      ),
      (
        theme.colorScheme.secondaryContainer,
        theme.colorScheme.onSecondaryContainer,
      ),
      (
        theme.colorScheme.tertiaryContainer,
        theme.colorScheme.onTertiaryContainer,
      ),
      (theme.colorScheme.surfaceContainerHighest, theme.colorScheme.onSurface),
    ];
    final colors = palette[index % palette.length];

    return IndexedSemantics(
      index: index,
      child: Semantics(
        label: l10n.itemSemanticLabel(index + 1),
        child: Container(
          width: width,
          height: height,
          padding: EdgeInsets.symmetric(
            horizontal: dynamicMode ? 12 : 10,
            vertical: 8,
          ),
          decoration: BoxDecoration(
            color: colors.$1,
            borderRadius: BorderRadius.circular(borderRadius),
            border: Border.all(color: colors.$2.withValues(alpha: 0.1)),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                dynamicMode
                    ? Icons.auto_awesome_rounded
                    : Icons.widgets_outlined,
                color: colors.$2,
                size: 16,
              ),
              const SizedBox(width: 6),
              Flexible(
                child: Text(
                  '#${index + 1}',
                  maxLines: 1,
                  overflow: TextOverflow.fade,
                  softWrap: false,
                  style: theme.textTheme.labelMedium?.copyWith(
                    color: colors.$2,
                    fontFamily: 'monospace',
                    fontWeight: FontWeight.w900,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
