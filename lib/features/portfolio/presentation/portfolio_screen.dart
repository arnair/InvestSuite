import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../widgets/error_widget.dart';
import '../../../widgets/loading_widget.dart';
import 'portfolio_controller.dart';
import 'widgets/asset_list_tile.dart';
import 'widgets/portfolio_header.dart';

@RoutePage()
class PortfolioScreen extends ConsumerWidget {
  const PortfolioScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final portfolioState = ref.watch(portfolioControllerProvider);

    return Scaffold(
      appBar: AppBar(title: const Text('Portfolio')),
      body: portfolioState.when(
        loading: () => const LoadingWidget(message: 'Loading portfolio...'),
        error: (error, _) => AppErrorWidget(
          message: error.toString(),
          onRetry: () {
            ref.read(portfolioControllerProvider.notifier).refresh();
          },
        ),
        data: (portfolio) => RefreshIndicator(
          onRefresh: () async {
            await ref.read(portfolioControllerProvider.notifier).refresh();
          },
          color: Theme.of(context).colorScheme.primary,
          child: CustomScrollView(
            slivers: [
              SliverToBoxAdapter(child: PortfolioHeader(portfolio: portfolio)),
              SliverPadding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                sliver: SliverToBoxAdapter(
                  child: Text(
                    'Assets (${portfolio.assets.length})',
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                ),
              ),
              const SliverToBoxAdapter(child: SizedBox(height: 12)),
              SliverPadding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                sliver: SliverList(
                  delegate: SliverChildBuilderDelegate((context, index) {
                    final asset = portfolio.assets[index];
                    return Padding(
                      padding: const EdgeInsets.only(bottom: 12),
                      child: AssetListTile(asset: asset),
                    );
                  }, childCount: portfolio.assets.length),
                ),
              ),
              const SliverToBoxAdapter(child: SizedBox(height: 100)),
            ],
          ),
        ),
      ),
    );
  }
}
