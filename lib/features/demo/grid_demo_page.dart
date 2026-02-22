import 'dart:math';

import 'package:flutter/material.dart';
import 'package:lazy_wrap/lazy_wrap.dart';
import 'package:lazy_wrap_demo/l10n/app_localizations.dart';

import '../../shared/preferences/ui_preferences_controller.dart';
import '../../shared/widgets/preferences_actions.dart';

class GridDemoPage extends StatefulWidget {
  const GridDemoPage({
    super.key,
    required this.isDynamic,
    required this.preferencesController,
  });

  final bool isDynamic;
  final UiPreferencesController preferencesController;

  @override
  State<GridDemoPage> createState() => _GridDemoPageState();
}

class _GridDemoPageState extends State<GridDemoPage> {
  final _random = Random();
  final Map<int, double> _widthCache = {};
  final Map<int, double> _heightCache = {};

  double _borderRadius = 18;
  Axis _direction = Axis.vertical;
  bool _isSwitching = false;
  bool? _controlsExpanded;

  double _cachedWidth(int index) =>
      _widthCache.putIfAbsent(index, () => 40 + _random.nextInt(75).toDouble());

  double _cachedHeight(int index) =>
      _heightCache.putIfAbsent(index, () => 30 + _random.nextInt(60).toDouble());

  Future<void> _switchDirection(bool horizontal) async {
    setState(() => _isSwitching = true);
    await Future.delayed(const Duration(milliseconds: 350));
    if (!mounted) return;

    setState(() {
      _direction = horizontal ? Axis.horizontal : Axis.vertical;
      _isSwitching = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final theme = Theme.of(context);
    final isHorizontal = _direction == Axis.horizontal;
    final width = MediaQuery.sizeOf(context).width;
    final isXs = width < 420;
    final isSm = width >= 420 && width < 700;
    final isCompact = width < 940;
    final horizontalPadding = isXs ? 10.0 : (isSm ? 12.0 : 16.0);
    final cardInset = isXs ? 12.0 : 16.0;
    final controlsNeedColumn = width < 760;
    final isExpanded = _controlsExpanded ?? !isXs;

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.isDynamic ? l10n.gridDynamicTitle : l10n.gridFixedTitle),
        actions: isCompact
            ? null
            : [
                Padding(
                  padding: const EdgeInsets.only(right: 12),
                  child: Center(
                    child: PreferencesActions(
                      controller: widget.preferencesController,
                      compact: true,
                    ),
                  ),
                ),
              ],
      ),
      body: SafeArea(
        child: Column(
          children: [
            if (isCompact)
              Padding(
                padding: EdgeInsets.fromLTRB(horizontalPadding, 10, horizontalPadding, 0),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: PreferencesActions(
                    controller: widget.preferencesController,
                    compact: true,
                  ),
                ),
              ),
            Padding(
              padding: EdgeInsets.fromLTRB(horizontalPadding, 12, horizontalPadding, 10),
              child: Card(
                clipBehavior: Clip.antiAlias,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    InkWell(
                      onTap: () => setState(() => _controlsExpanded = !isExpanded),
                      child: Padding(
                        padding: EdgeInsets.all(cardInset),
                        child: Row(
                          children: [
                            Expanded(
                              child: Text(
                                widget.isDynamic ? l10n.gridDynamicHeadline : l10n.gridFixedHeadline,
                                style: (isXs ? theme.textTheme.titleMedium : theme.textTheme.titleLarge)
                                    ?.copyWith(fontWeight: FontWeight.w800),
                              ),
                            ),
                            const SizedBox(width: 8),
                            Icon(
                              isExpanded ? Icons.keyboard_arrow_up_rounded : Icons.keyboard_arrow_down_rounded,
                              color: theme.colorScheme.onSurfaceVariant,
                            ),
                          ],
                        ),
                      ),
                    ),
                    AnimatedSize(
                      duration: const Duration(milliseconds: 300),
                      curve: Curves.easeInOut,
                      alignment: Alignment.topCenter,
                      child: isExpanded
                          ? Padding(
                              padding: EdgeInsets.only(
                                left: cardInset,
                                right: cardInset,
                                bottom: cardInset,
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    l10n.gridDescription,
                                    style: (isXs ? theme.textTheme.bodySmall : theme.textTheme.bodyMedium)
                                        ?.copyWith(
                                      color: theme.colorScheme.onSurfaceVariant,
                                    ),
                                  ),
                                  const SizedBox(height: 12),
                                  Wrap(
                        spacing: 14,
                        runSpacing: 10,
                        children: [
                          SizedBox(
                            width: controlsNeedColumn ? double.infinity : null,
                            child: Tooltip(
                              message: l10n.toggleDirectionTooltip,
                              child: Wrap(
                                spacing: 8,
                                runSpacing: 8,
                                crossAxisAlignment: WrapCrossAlignment.center,
                                children: [
                                  Text(
                                    '${l10n.directionLabel}:',
                                    style: theme.textTheme.bodyMedium?.copyWith(
                                      fontWeight: FontWeight.w700,
                                    ),
                                  ),
                                  SegmentedButton<Axis>(
                                    segments: [
                                      ButtonSegment<Axis>(
                                        value: Axis.vertical,
                                        label: Text(l10n.directionVertical),
                                        icon: const Icon(Icons.swap_vert),
                                      ),
                                      ButtonSegment<Axis>(
                                        value: Axis.horizontal,
                                        label: Text(l10n.directionHorizontal),
                                        icon: const Icon(Icons.swap_horiz),
                                      ),
                                    ],
                                    selected: {_direction},
                                    onSelectionChanged: (selection) {
                                      final next = selection.first;
                                      if (next != _direction) {
                                        _switchDirection(next == Axis.horizontal);
                                      }
                                    },
                                  ),
                                ],
                              ),
                            ),
                          ),
                          SizedBox(
                            width: controlsNeedColumn ? double.infinity : 420,
                            child: Row(
                              children: [
                                Text(
                                  '${l10n.borderRadius}:',
                                  style: theme.textTheme.bodyMedium?.copyWith(
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                                Expanded(
                                  child: Slider(
                                    min: 0,
                                    max: 50,
                                    value: _borderRadius,
                                    onChanged: (value) => setState(() => _borderRadius = value),
                                  ),
                                ),
                                SizedBox(
                                  width: 32,
                                  child: Text(
                                    _borderRadius.toStringAsFixed(0),
                                    textAlign: TextAlign.right,
                                    style: theme.textTheme.bodyMedium?.copyWith(
                                      fontWeight: FontWeight.w700,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 12),
                      Text(
                        l10n.scrollInstruction(isHorizontal ? '→' : '↓'),
                        style: (isXs ? theme.textTheme.labelLarge : theme.textTheme.bodySmall)
                            ?.copyWith(
                          color: theme.colorScheme.onSurfaceVariant,
                          fontStyle: FontStyle.italic,
                        ),
                      ),
                    ],
                  ),
                )
              : const SizedBox(width: double.infinity),
            ),
          ],
        ),
      ),
    ),
    Expanded(
              child: Stack(
                children: [
                  Padding(
                    padding: EdgeInsets.fromLTRB(horizontalPadding, 0, horizontalPadding, horizontalPadding),
                    child: DecoratedBox(
                      decoration: BoxDecoration(
                        color: theme.colorScheme.surfaceContainerLowest,
                        borderRadius: BorderRadius.circular(18),
                        border: Border.all(color: theme.colorScheme.outlineVariant),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(12),
                        child: _buildLazyWrap(context),
                      ),
                    ),
                  ),
                  if (_isSwitching)
                    Positioned.fill(
                      child: ColoredBox(
                        color: theme.colorScheme.scrim.withValues(alpha: 0.30),
                        child: Center(
                          child: Card(
                            child: Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 20),
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  const SizedBox(
                                    height: 18,
                                    width: 18,
                                    child: CircularProgressIndicator(strokeWidth: 2.5),
                                  ),
                                  const SizedBox(width: 12),
                                  Text(
                                    l10n.switchingLayout,
                                    style: theme.textTheme.titleSmall?.copyWith(
                                      fontWeight: FontWeight.w700,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
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

  Widget _buildLazyWrap(BuildContext context) {
    return widget.isDynamic ? _buildDynamic(context) : _buildFixed(context);
  }

  Widget _buildDynamic(BuildContext context) {
    return LazyWrap.dynamic(
      key: ValueKey('dynamic_${_direction.name}'),
      rowAlignment: MainAxisAlignment.center,
      itemCount: 999999,
      spacing: 12,
      runSpacing: 12,
      fadeInItems: true,
      fadeInDuration: const Duration(milliseconds: 1000),
      fadeInCurve: Curves.easeOut,
      batchSize: 500,
      cacheExtent: 1000,
      scrollDirection: _direction,
      itemBuilder: (context, index) {
        final baseColor = Colors.primaries[index % Colors.primaries.length].shade400;
        final textColor = _textColorFor(baseColor);

        return Container(
          width: _cachedWidth(index),
          height: _cachedHeight(index),
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: baseColor,
            borderRadius: BorderRadius.circular(_borderRadius),
          ),
          child: Text(
            '${index + 1}',
            style: TextStyle(
              color: textColor,
              fontWeight: FontWeight.w700,
              fontSize: 15,
            ),
          ),
        );
      },
    );
  }

  Widget _buildFixed(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;

    return LazyWrap.fixed(
      key: ValueKey('fixed_${_direction.name}'),
      rowAlignment: MainAxisAlignment.center,
      itemCount: 999999,
      spacing: 12,
      runSpacing: 12,
      estimatedItemWidth: 80,
      estimatedItemHeight: 80,
      scrollDirection: _direction,
      itemBuilder: (context, index) {
        final baseColor = Colors.primaries[index % Colors.primaries.length].shade400;
        final textColor = _textColorFor(baseColor);

        return Container(
          width: 120,
          height: 100,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: baseColor,
            borderRadius: BorderRadius.circular(_borderRadius),
          ),
          child: Text(
            l10n.fixedItemLabel(index + 1),
            textAlign: TextAlign.center,
            style: TextStyle(
              color: textColor,
              fontWeight: FontWeight.w700,
              fontSize: 14,
            ),
          ),
        );
      },
    );
  }

  Color _textColorFor(Color color) {
    return ThemeData.estimateBrightnessForColor(color) == Brightness.dark
        ? Colors.white
        : Colors.black;
  }
}
