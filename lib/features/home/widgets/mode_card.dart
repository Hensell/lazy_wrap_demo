import 'package:flutter/material.dart';
import 'package:lazy_wrap_demo/l10n/app_localizations.dart';

class ModeCard extends StatefulWidget {
  const ModeCard({
    super.key,
    required this.icon,
    required this.title,
    required this.description,
    required this.badge,
    required this.onTap,
    required this.tint,
    required this.dynamicPreview,
  });

  final IconData icon;
  final String title;
  final String description;
  final String badge;
  final VoidCallback onTap;
  final Color tint;
  final bool dynamicPreview;

  @override
  State<ModeCard> createState() => _ModeCardState();
}

class _ModeCardState extends State<ModeCard> {
  bool _highlighted = false;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final l10n = AppLocalizations.of(context)!;

    return Semantics(
      button: true,
      label: '${widget.title}. ${widget.description}',
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 180),
        decoration: BoxDecoration(
          color: theme.colorScheme.surfaceContainerLowest,
          borderRadius: BorderRadius.circular(26),
          border: Border.all(
            color: _highlighted
                ? widget.tint
                : theme.colorScheme.outlineVariant,
            width: _highlighted ? 2 : 1,
          ),
          boxShadow: [
            BoxShadow(
              color: widget.tint.withValues(alpha: _highlighted ? 0.15 : 0.06),
              blurRadius: _highlighted ? 32 : 20,
              offset: const Offset(0, 12),
            ),
          ],
        ),
        clipBehavior: Clip.antiAlias,
        child: Material(
          color: Colors.transparent,
          child: InkWell(
            onTap: widget.onTap,
            onHover: (value) => setState(() => _highlighted = value),
            onFocusChange: (value) => setState(() => _highlighted = value),
            child: Padding(
              padding: const EdgeInsets.all(24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Container(
                        width: 52,
                        height: 52,
                        decoration: BoxDecoration(
                          color: widget.tint.withValues(alpha: 0.12),
                          borderRadius: BorderRadius.circular(16),
                        ),
                        child: Icon(widget.icon, color: widget.tint, size: 26),
                      ),
                      const Spacer(),
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 10,
                          vertical: 6,
                        ),
                        decoration: BoxDecoration(
                          color: widget.tint.withValues(alpha: 0.1),
                          borderRadius: BorderRadius.circular(99),
                        ),
                        child: Text(
                          widget.badge,
                          style: theme.textTheme.labelSmall?.copyWith(
                            color: widget.tint,
                            fontWeight: FontWeight.w900,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 24),
                  _ModePreview(
                    tint: widget.tint,
                    dynamicPreview: widget.dynamicPreview,
                  ),
                  const SizedBox(height: 24),
                  Text(widget.title, style: theme.textTheme.headlineSmall),
                  const SizedBox(height: 8),
                  Text(
                    widget.description,
                    style: theme.textTheme.bodyMedium?.copyWith(
                      color: theme.colorScheme.onSurfaceVariant,
                      height: 1.5,
                    ),
                  ),
                  const SizedBox(height: 22),
                  Row(
                    children: [
                      Text(
                        l10n.exploreMode,
                        style: theme.textTheme.labelLarge?.copyWith(
                          color: widget.tint,
                        ),
                      ),
                      const SizedBox(width: 8),
                      AnimatedSlide(
                        duration: const Duration(milliseconds: 180),
                        offset: _highlighted
                            ? const Offset(0.18, 0)
                            : Offset.zero,
                        child: Icon(
                          Icons.arrow_forward_rounded,
                          color: widget.tint,
                          size: 20,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _ModePreview extends StatelessWidget {
  const _ModePreview({required this.tint, required this.dynamicPreview});

  final Color tint;
  final bool dynamicPreview;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final widths = dynamicPreview
        ? const [0.34, 0.22, 0.36, 0.25, 0.42, 0.22]
        : const [0.29, 0.29, 0.29, 0.29, 0.29, 0.29];

    return LayoutBuilder(
      builder: (context, constraints) {
        return Container(
          height: 112,
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: theme.colorScheme.surfaceContainerLow,
            borderRadius: BorderRadius.circular(17),
            border: Border.all(color: theme.colorScheme.outlineVariant),
          ),
          child: Wrap(
            spacing: 8,
            runSpacing: 8,
            children: [
              for (var index = 0; index < widths.length; index++)
                Container(
                  width: constraints.maxWidth * widths[index],
                  height: dynamicPreview ? (index.isEven ? 34 : 28) : 34,
                  decoration: BoxDecoration(
                    color: tint.withValues(alpha: 0.12 + index * 0.025),
                    borderRadius: BorderRadius.circular(9),
                    border: Border.all(color: tint.withValues(alpha: 0.22)),
                  ),
                ),
            ],
          ),
        );
      },
    );
  }
}
