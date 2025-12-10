import 'package:flutter/material.dart';

import '../../../../core/utils/formatters.dart';
import '../../../../widgets/label_chip.dart';
import '../../../../widgets/percent_change_indicator.dart';
import '../../domain/asset_model.dart';

/// Widget that displays a single asset in the portfolio list
class AssetListTile extends StatelessWidget {
  final AssetModel asset;

  const AssetListTile({super.key, required this.asset});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Row(
          children: [
            Container(
              width: 48,
              height: 48,
              decoration: BoxDecoration(
                color: theme.colorScheme.primaryContainer,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Center(
                child: Text(
                  asset.type.icon,
                  style: const TextStyle(fontSize: 24),
                ),
              ),
            ),
            const SizedBox(width: 16),

            // Asset Info
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text(
                        asset.symbol,
                        style: theme.textTheme.titleMedium?.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(width: 8),
                      LabelChip(label: asset.type.displayName),
                    ],
                  ),
                  const SizedBox(height: 2),
                  Text(
                    asset.name,
                    style: theme.textTheme.bodySmall,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 4),
                  Text(
                    asset.formattedQuantity,
                    style: theme.textTheme.bodySmall?.copyWith(
                      color: theme.colorScheme.onSurfaceVariant,
                    ),
                  ),
                ],
              ),
            ),

            // Price and Change
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  asset.currentPrice.asCurrency,
                  style: theme.textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 4),
                PercentChangeIndicator(
                  percentChange: asset.percentChange,
                  iconSize: 16,
                ),
                const SizedBox(height: 4),
                Text(
                  asset.totalValue.asCurrency,
                  style: theme.textTheme.bodySmall?.copyWith(
                    color: theme.colorScheme.onSurfaceVariant,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
