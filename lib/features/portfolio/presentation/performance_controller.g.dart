// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'performance_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$selectedTimeRangeHash() => r'7660c0e99cfa610d308750dddee6b464318d7a3b';

/// Provider for the selected time range
///
/// Copied from [SelectedTimeRange].
@ProviderFor(SelectedTimeRange)
final selectedTimeRangeProvider =
    AutoDisposeNotifierProvider<SelectedTimeRange, TimeRange>.internal(
      SelectedTimeRange.new,
      name: r'selectedTimeRangeProvider',
      debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
          ? null
          : _$selectedTimeRangeHash,
      dependencies: null,
      allTransitiveDependencies: null,
    );

typedef _$SelectedTimeRange = AutoDisposeNotifier<TimeRange>;
String _$performanceControllerHash() =>
    r'eba50854dba26ffd1a29664419dd3364bc6d2c06';

/// Provider for managing performance history state with smart caching
///
/// Copied from [PerformanceController].
@ProviderFor(PerformanceController)
final performanceControllerProvider =
    AutoDisposeNotifierProvider<
      PerformanceController,
      AsyncValue<PerformanceHistory>
    >.internal(
      PerformanceController.new,
      name: r'performanceControllerProvider',
      debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
          ? null
          : _$performanceControllerHash,
      dependencies: null,
      allTransitiveDependencies: null,
    );

typedef _$PerformanceController =
    AutoDisposeNotifier<AsyncValue<PerformanceHistory>>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
