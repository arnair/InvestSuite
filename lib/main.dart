import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'router/app_router.dart';
import 'core/theme/app_theme.dart';
import 'core/theme/theme_provider.dart';
import 'features/portfolio/data/portfolio_grpc_client.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const ProviderScope(child: InvestSuiteApp()));
}

class InvestSuiteApp extends ConsumerStatefulWidget {
  const InvestSuiteApp({super.key});

  @override
  ConsumerState<InvestSuiteApp> createState() => _InvestSuiteAppState();
}

class _InvestSuiteAppState extends ConsumerState<InvestSuiteApp>
    with WidgetsBindingObserver {
  final _appRouter = AppRouter();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state == AppLifecycleState.detached) {
      // Clean up gRPC channel when app is terminated
      PortfolioGrpcClient.shutdown();
    }
  }

  @override
  Widget build(BuildContext context) {
    final themeType = ref.watch(themeNotifierProvider);

    return MaterialApp.router(
      title: 'InvestSuite',
      debugShowCheckedModeBanner: false,
      theme: themeType == AppThemeType.retailBank
          ? AppTheme.retailBankTheme
          : AppTheme.neobankTheme,
      routerConfig: _appRouter.config(),
    );
  }
}
