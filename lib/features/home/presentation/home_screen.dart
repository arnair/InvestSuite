import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import '../../../router/app_router.dart';

@RoutePage()
class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AutoTabsScaffold(
      routes: const [
        PortfolioRoute(),
        PerformanceChartRoute(),
        SettingsRoute(),
      ],
      transitionBuilder: (context, child, animation) =>
          FadeTransition(opacity: animation, child: child),
      bottomNavigationBuilder: (_, tabsRouter) {
        return NavigationBar(
          selectedIndex: tabsRouter.activeIndex,
          onDestinationSelected: tabsRouter.setActiveIndex,
          destinations: const [
            NavigationDestination(
              icon: Icon(Icons.account_balance_wallet_outlined),
              selectedIcon: Icon(Icons.account_balance_wallet),
              label: 'Portfolio',
            ),
            NavigationDestination(
              icon: Icon(Icons.show_chart_outlined),
              selectedIcon: Icon(Icons.show_chart),
              label: 'Performance',
            ),
            NavigationDestination(
              icon: Icon(Icons.settings_outlined),
              selectedIcon: Icon(Icons.settings),
              label: 'Settings',
            ),
          ],
        );
      },
    );
  }
}
