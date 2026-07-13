import 'package:flutter/material.dart';

class LabBackdrop extends StatelessWidget {
  const LabBackdrop({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;

    return ColoredBox(
      color: scheme.surface,
      child: Stack(
        fit: StackFit.expand,
        children: [
          CustomPaint(
            painter: _GridPainter(
              lineColor: scheme.outlineVariant.withValues(alpha: 0.32),
            ),
          ),
          Positioned(
            top: -180,
            right: -120,
            child: _Glow(
              color: scheme.primary.withValues(alpha: 0.13),
              size: 460,
            ),
          ),
          Positioned(
            bottom: -220,
            left: -170,
            child: _Glow(
              color: scheme.secondary.withValues(alpha: 0.1),
              size: 520,
            ),
          ),
          child,
        ],
      ),
    );
  }
}

class _Glow extends StatelessWidget {
  const _Glow({required this.color, required this.size});

  final Color color;
  final double size;

  @override
  Widget build(BuildContext context) {
    return IgnorePointer(
      child: Container(
        width: size,
        height: size,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          gradient: RadialGradient(colors: [color, color.withValues(alpha: 0)]),
        ),
      ),
    );
  }
}

class _GridPainter extends CustomPainter {
  const _GridPainter({required this.lineColor});

  final Color lineColor;

  @override
  void paint(Canvas canvas, Size size) {
    const step = 48.0;
    final paint = Paint()
      ..color = lineColor
      ..strokeWidth = 0.7;

    for (var x = 0.0; x <= size.width; x += step) {
      canvas.drawLine(Offset(x, 0), Offset(x, size.height), paint);
    }
    for (var y = 0.0; y <= size.height; y += step) {
      canvas.drawLine(Offset(0, y), Offset(size.width, y), paint);
    }
  }

  @override
  bool shouldRepaint(covariant _GridPainter oldDelegate) =>
      oldDelegate.lineColor != lineColor;
}
