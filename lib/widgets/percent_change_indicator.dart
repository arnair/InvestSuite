import 'package:flutter/material.dart';

import '../core/theme/app_theme.dart';
import '../core/utils/formatters.dart';

/// Reusable widget to display percent change with icon and color
class PercentChangeIndicator extends StatelessWidget {
  final double percentChange;
  final TextStyle? textStyle;
  final double iconSize;
  final bool showIcon;
  final bool showBackground;
  final String? suffix;

  const PercentChangeIndicator({
    super.key,
    required this.percentChange,
    this.textStyle,
    this.iconSize = 16,
    this.showIcon = true,
    this.showBackground = false,
    this.suffix,
  });

  bool get isPositive => percentChange.isPositiveChange;

  String get formattedChange => percentChange.asPercentWithSign;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final appColors = theme.extension<AppColors>()!;
    final color = isPositive ? appColors.positive : appColors.negative;

    final content = Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        if (showIcon) ...[
          Icon(
            isPositive ? Icons.arrow_upward : Icons.arrow_downward,
            color: color,
            size: iconSize,
          ),
          const SizedBox(width: 2),
        ],
        Text(
          formattedChange,
          style: (textStyle ?? theme.textTheme.bodyMedium)?.copyWith(
            color: color,
            fontWeight: FontWeight.w600,
          ),
        ),
        if (suffix != null) ...[
          const SizedBox(width: 4),
          Text(
            suffix!,
            style: theme.textTheme.bodySmall?.copyWith(
              color: theme.colorScheme.onSurfaceVariant,
            ),
          ),
        ],
      ],
    );

    if (!showBackground) return content;

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: color.withValues(alpha: 0.15),
        borderRadius: BorderRadius.circular(4),
      ),
      child: content,
    );
  }
}
