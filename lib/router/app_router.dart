import 'package:auto_route/auto_route.dart';

import '../../features/home/presentation/home_screen.dart';
import '../../features/portfolio/presentation/portfolio_screen.dart';
import '../../features/portfolio/presentation/performance_chart_screen.dart';
import '../../features/settings/presentation/settings_screen.dart';

part 'app_router.gr.dart';

/// Main app router configuration using AutoRoute
@AutoRouterConfig(replaceInRouteName: 'Screen,Route')
class AppRouter extends RootStackRouter {
  @override
  List<AutoRoute> get routes => [
    AutoRoute(
      page: HomeRoute.page,
      initial: true,
      children: [
        AutoRoute(page: PortfolioRoute.page),
        AutoRoute(page: PerformanceChartRoute.page),
        AutoRoute(page: SettingsRoute.page),
      ],
    ),
  ];
}
