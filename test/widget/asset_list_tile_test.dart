import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:investsuite/features/portfolio/domain/asset_model.dart';
import 'package:investsuite/features/portfolio/presentation/widgets/asset_list_tile.dart';
import 'package:investsuite/core/theme/app_theme.dart';

void main() {
  const testAsset = AssetModel(
    id: '1',
    symbol: 'AAPL',
    name: 'Apple Inc.',
    type: AssetType.stock,
    currentPrice: 178.52,
    percentChange: 2.34,
    quantity: 25,
    totalValue: 4463.00,
  );

  const negativeAsset = AssetModel(
    id: '2',
    symbol: 'TSLA',
    name: 'Tesla Inc.',
    type: AssetType.stock,
    currentPrice: 248.42,
    percentChange: -1.89,
    quantity: 10,
    totalValue: 2484.20,
  );

  Widget createTestWidget({required AssetModel asset}) {
    return ProviderScope(
      child: MaterialApp(
        theme: AppTheme.retailBankTheme,
        home: Scaffold(
          body: SingleChildScrollView(child: AssetListTile(asset: asset)),
        ),
      ),
    );
  }

  group('AssetListTile', () {
    testWidgets('displays asset symbol correctly', (WidgetTester tester) async {
      await tester.pumpWidget(createTestWidget(asset: testAsset));

      expect(find.text('AAPL'), findsOneWidget);
    });

    testWidgets('displays asset name correctly', (WidgetTester tester) async {
      await tester.pumpWidget(createTestWidget(asset: testAsset));

      expect(find.text('Apple Inc.'), findsOneWidget);
    });

    testWidgets('displays asset type badge correctly', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(createTestWidget(asset: testAsset));

      expect(find.text('Stock'), findsOneWidget);
    });

    testWidgets('displays formatted price correctly', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(createTestWidget(asset: testAsset));

      expect(find.text('\$178.52'), findsOneWidget);
    });

    testWidgets('displays positive percent change with plus sign', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(createTestWidget(asset: testAsset));

      expect(find.text('+2.34%'), findsOneWidget);
    });

    testWidgets('displays negative percent change without plus sign', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(createTestWidget(asset: negativeAsset));

      expect(find.text('-1.89%'), findsOneWidget);
    });

    testWidgets('displays quantity correctly', (WidgetTester tester) async {
      await tester.pumpWidget(createTestWidget(asset: testAsset));

      expect(find.text('25 shares'), findsOneWidget);
    });

    testWidgets('displays total value correctly', (WidgetTester tester) async {
      await tester.pumpWidget(createTestWidget(asset: testAsset));

      expect(find.text('\$4463.00'), findsOneWidget);
    });

    testWidgets('displays upward arrow for positive change', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(createTestWidget(asset: testAsset));

      expect(find.byIcon(Icons.arrow_upward), findsOneWidget);
    });

    testWidgets('displays downward arrow for negative change', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(createTestWidget(asset: negativeAsset));

      expect(find.byIcon(Icons.arrow_downward), findsOneWidget);
    });

    testWidgets('displays asset type emoji icon', (WidgetTester tester) async {
      await tester.pumpWidget(createTestWidget(asset: testAsset));

      // Stock emoji
      expect(find.text('📈'), findsOneWidget);
    });

    testWidgets('renders inside a Card widget', (WidgetTester tester) async {
      await tester.pumpWidget(createTestWidget(asset: testAsset));

      expect(find.byType(Card), findsOneWidget);
    });
  });
}
