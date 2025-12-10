import 'package:flutter/material.dart';

import '../../../../core/theme/app_theme.dart';
import '../../../../core/utils/formatters.dart';
import '../../domain/portfolio_model.dart';

/// Widget that displays portfolio summary at the top of the portfolio screen
class PortfolioHeader extends StatelessWidget {
  final PortfolioModel portfolio;

  const PortfolioHeader({super.key, required this.portfolio});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final appColors = theme.extension<AppColors>()!;
    final isDark = theme.brightness == Brightness.dark;
    final changeColor = portfolio.isPositive
        ? appColors.positive
        : appColors.negative;
    final primaryColor = theme.colorScheme.primary;

    return Container(
      margin: const EdgeInsets.all(16),
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        gradient: isDark
            ? LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  theme.colorScheme.surfaceContainerHighest,
                  theme.colorScheme.surface,
                  primaryColor.withValues(alpha: 0.1),
                ],
              )
            : LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  primaryColor,
                  primaryColor.withValues(alpha: 0.8),
                  primaryColor.withValues(alpha: 0.6),
                ],
              ),
        borderRadius: BorderRadius.circular(24),
        border: isDark
            ? Border.all(color: primaryColor.withValues(alpha: 0.3), width: 1)
            : null,
        boxShadow: [
          BoxShadow(
            color: primaryColor.withValues(alpha: isDark ? 0.2 : 0.3),
            blurRadius: 20,
            offset: const Offset(0, 10),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            portfolio.name,
            style: theme.textTheme.titleMedium?.copyWith(color: Colors.white70),
          ),
          const SizedBox(height: 8),
          Text(
            portfolio.totalValue.asCurrency,
            style: theme.textTheme.displaySmall?.copyWith(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 12),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
            decoration: BoxDecoration(
              color: isDark
                  ? changeColor.withValues(alpha: 0.2)
                  : Colors.white.withValues(alpha: 0.2),
              borderRadius: BorderRadius.circular(20),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(
                  portfolio.isPositive
                      ? Icons.trending_up
                      : Icons.trending_down,
                  color: isDark ? changeColor : Colors.white,
                  size: 20,
                ),
                const SizedBox(width: 6),
                Text(
                  portfolio.totalPercentChange.asPercentWithSign,
                  style: theme.textTheme.titleSmall?.copyWith(
                    color: isDark ? changeColor : Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(width: 8),
                Text(
                  'Today',
                  style: theme.textTheme.bodySmall?.copyWith(
                    color: isDark ? Colors.white54 : Colors.white70,
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
