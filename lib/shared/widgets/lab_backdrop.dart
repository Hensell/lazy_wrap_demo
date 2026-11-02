import 'package:flutter/material.dart';

class LabBackdrop extends StatelessWidget {
  const LabBackdrop({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return ColoredBox(
      color: Theme.of(context).colorScheme.surface,
      child: child,
    );
  }
}
