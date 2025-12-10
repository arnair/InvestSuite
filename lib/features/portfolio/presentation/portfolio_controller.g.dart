// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'portfolio_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$portfolioSummaryHash() => r'58a9a2416da26b188df59973f42e44a040b5cb11';

/// Computed provider for portfolio summary statistics
///
/// Copied from [portfolioSummary].
@ProviderFor(portfolioSummary)
final portfolioSummaryProvider =
    AutoDisposeProvider<PortfolioSummary?>.internal(
      portfolioSummary,
      name: r'portfolioSummaryProvider',
      debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
          ? null
          : _$portfolioSummaryHash,
      dependencies: null,
      allTransitiveDependencies: null,
    );

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef PortfolioSummaryRef = AutoDisposeProviderRef<PortfolioSummary?>;
String _$portfolioControllerHash() =>
    r'f012edee20989bba2c67ce4f5929a42ebe3ff46f';

/// Provider for managing portfolio state with auto-refresh
///
/// Copied from [PortfolioController].
@ProviderFor(PortfolioController)
final portfolioControllerProvider =
    AutoDisposeNotifierProvider<
      PortfolioController,
      AsyncValue<PortfolioModel>
    >.internal(
      PortfolioController.new,
      name: r'portfolioControllerProvider',
      debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
          ? null
          : _$portfolioControllerHash,
      dependencies: null,
      allTransitiveDependencies: null,
    );

typedef _$PortfolioController = AutoDisposeNotifier<AsyncValue<PortfolioModel>>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
