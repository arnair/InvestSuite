import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:investsuite/core/theme/app_theme.dart';

/// Extension on WidgetTester for common test patterns
extension PumpApp on WidgetTester {
  /// Pumps a widget wrapped in MaterialApp and ProviderScope
  Future<void> pumpApp(Widget widget, {List<Override>? overrides}) async {
    await pumpWidget(
      ProviderScope(
        overrides: overrides ?? [],
        child: MaterialApp(theme: AppTheme.retailBankTheme, home: widget),
      ),
    );
  }

  /// Pumps a widget wrapped in MaterialApp, ProviderScope, and Scaffold
  Future<void> pumpScaffoldApp(
    Widget widget, {
    List<Override>? overrides,
  }) async {
    await pumpWidget(
      ProviderScope(
        overrides: overrides ?? [],
        child: MaterialApp(
          theme: AppTheme.retailBankTheme,
          home: Scaffold(body: widget),
        ),
      ),
    );
  }
}

/// Creates a ProviderContainer with optional overrides for unit testing
ProviderContainer createContainer({List<Override>? overrides}) {
  final container = ProviderContainer(overrides: overrides ?? []);
  addTearDown(container.dispose);
  return container;
}
