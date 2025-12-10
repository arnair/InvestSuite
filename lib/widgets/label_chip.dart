import 'package:flutter/material.dart';

/// A small labeled chip/badge with colored background
class LabelChip extends StatelessWidget {
  final String label;
  final Color? backgroundColor;
  final Color? textColor;
  final TextStyle? textStyle;
  final EdgeInsetsGeometry padding;
  final double borderRadius;

  const LabelChip({
    super.key,
    required this.label,
    this.backgroundColor,
    this.textColor,
    this.textStyle,
    this.padding = const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
    this.borderRadius = 4,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Container(
      padding: padding,
      decoration: BoxDecoration(
        color: backgroundColor ?? theme.colorScheme.surfaceContainerHighest,
        borderRadius: BorderRadius.circular(borderRadius),
      ),
      child: Text(
        label,
        style:
            textStyle ?? theme.textTheme.labelSmall?.copyWith(color: textColor),
      ),
    );
  }
}
