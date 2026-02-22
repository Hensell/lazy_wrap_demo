import 'package:flutter/material.dart';
import 'package:lazy_wrap_demo/l10n/app_localizations.dart';

class ModeCard extends StatelessWidget {
  const ModeCard({
    super.key,
    required this.icon,
    required this.title,
    required this.description,
    required this.onTap,
    required this.tint,
  });

  final IconData icon;
  final String title;
  final String description;
  final VoidCallback onTap;
  final Color tint;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final l10n = AppLocalizations.of(context)!;
    final width = MediaQuery.sizeOf(context).width;
    final isXs = width < 420;

    return Container(
      decoration: BoxDecoration(
        color: theme.cardTheme.color ?? theme.colorScheme.surfaceContainerHighest,
        borderRadius: BorderRadius.circular(24),
        boxShadow: [
          BoxShadow(
            color: tint.withValues(alpha: 0.05),
            blurRadius: 24,
            offset: const Offset(0, 8),
          ),
        ],
        border: Border.all(
          color: tint.withValues(alpha: 0.1),
          width: 1.5,
        ),
      ),
      clipBehavior: Clip.antiAlias,
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: onTap,
          child: Padding(
            padding: EdgeInsets.all(isXs ? 16 : 24),
            child: isXs
                ? _buildHorizontalLayout(theme, l10n)
                : _buildVerticalLayout(theme, l10n),
          ),
        ),
      ),
    );
  }

  Widget _buildHorizontalLayout(ThemeData theme, AppLocalizations l10n) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildIcon(theme, isXs: true),
        const SizedBox(width: 16),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: theme.textTheme.titleMedium?.copyWith(fontWeight: FontWeight.w800),
              ),
              const SizedBox(height: 4),
              Text(
                description,
                style: theme.textTheme.bodyMedium?.copyWith(
                  color: theme.colorScheme.onSurfaceVariant,
                  height: 1.35,
                ),
              ),
              const SizedBox(height: 12),
              FilledButton.tonalIcon(
                onPressed: onTap,
                icon: const Icon(Icons.arrow_forward_rounded, size: 18),
                label: Text(l10n.startDemo),
                style: FilledButton.styleFrom(
                  visualDensity: VisualDensity.compact,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildVerticalLayout(ThemeData theme, AppLocalizations l10n) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildIcon(theme, isXs: false),
        const SizedBox(height: 16),
        Text(
          title,
          style: theme.textTheme.titleLarge?.copyWith(fontWeight: FontWeight.w800),
        ),
        const SizedBox(height: 8),
        Text(
          description,
          style: theme.textTheme.bodyMedium?.copyWith(
            color: theme.colorScheme.onSurfaceVariant,
            height: 1.35,
          ),
        ),
        const SizedBox(height: 16),
        FilledButton.tonalIcon(
          onPressed: onTap,
          icon: const Icon(Icons.arrow_forward_rounded),
          label: Text(l10n.startDemo),
        ),
      ],
    );
  }

  Widget _buildIcon(ThemeData theme, {required bool isXs}) {
    return Container(
      height: isXs ? 48 : 56,
      width: isXs ? 48 : 56,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            tint.withValues(alpha: 0.25),
            tint.withValues(alpha: 0.05),
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(14),
        border: Border.all(
          color: tint.withValues(alpha: 0.2),
          width: 1,
        ),
      ),
      child: Icon(icon, color: tint, size: isXs ? 24 : 28),
    );
  }
}
