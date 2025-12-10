import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../data/portfolio_repository.dart';
import '../domain/performance_model.dart';
import 'portfolio_controller.dart';

part 'performance_controller.g.dart';

/// Provider for the selected time range
@riverpod
class SelectedTimeRange extends _$SelectedTimeRange {
  @override
  TimeRange build() => TimeRange.oneMonth;

  void setTimeRange(TimeRange range) {
    state = range;
  }
}

/// Provider for managing performance history state with smart caching
@riverpod
class PerformanceController extends _$PerformanceController {
  // Cache for instant switching between time ranges
  final Map<TimeRange, PerformanceHistory> _cache = {};
  bool _isInitialLoad = true;

  PortfolioRepository get _repository => ref.read(portfolioRepositoryProvider);

  @override
  AsyncValue<PerformanceHistory> build() {
    // Listen to time range changes
    ref.listen(selectedTimeRangeProvider, (previous, next) {
      if (previous != next && !_isInitialLoad) {
        _switchToTimeRange(next);
      }
    });

    // Listen to portfolio changes - refresh 1D to sync "Today" %
    ref.listen(portfolioControllerProvider, (previous, next) {
      next.whenOrNull(
        data: (portfolio) {
          // When portfolio updates, refresh 1D cache to match "Today" %
          _refreshOneDayCache();
        },
      );
    });

    _prefetchAllTimeRanges();
    return const AsyncValue.loading();
  }

  /// Pre-fetch all 6 time ranges at once (runs only on startup)
  Future<void> _prefetchAllTimeRanges() async {
    try {
      // Fetch all 6 time ranges in parallel
      final futures = TimeRange.values.map((timeRange) async {
        final history = await _repository.getPerformanceHistory(
          timeRange: timeRange,
        );
        _cache[timeRange] = history;
        return history;
      }).toList();

      await Future.wait(futures);

      _isInitialLoad = false;

      // Show the currently selected time range
      final currentRange = ref.read(selectedTimeRangeProvider);
      if (_cache.containsKey(currentRange)) {
        state = AsyncValue.data(_cache[currentRange]!);
      }
    } catch (e, stackTrace) {
      state = AsyncValue.error(e, stackTrace);
    }
  }

  /// Instantly switch to a different time range from cache
  void _switchToTimeRange(TimeRange timeRange) {
    if (_cache.containsKey(timeRange)) {
      // Instant switch from cache - no loading state!
      state = AsyncValue.data(_cache[timeRange]!);
    } else {
      // Fallback: fetch if not cached (shouldn't happen)
      _fetchSingleTimeRange(timeRange);
    }
  }

  /// Fetch a single time range (fallback only)
  Future<void> _fetchSingleTimeRange(TimeRange timeRange) async {
    state = const AsyncValue.loading();

    try {
      final history = await _repository.getPerformanceHistory(
        timeRange: timeRange,
      );
      _cache[timeRange] = history;
      state = AsyncValue.data(history);
    } catch (e, stackTrace) {
      state = AsyncValue.error(e, stackTrace);
    }
  }

  /// Refresh 1D cache to sync with current "Today" percentage
  Future<void> _refreshOneDayCache() async {
    try {
      final history = await _repository.getPerformanceHistory(
        timeRange: TimeRange.oneDay,
      );
      _cache[TimeRange.oneDay] = history;

      // If currently viewing 1D, update the display
      final currentRange = ref.read(selectedTimeRangeProvider);
      if (currentRange == TimeRange.oneDay) {
        state = AsyncValue.data(history);
      }
    } catch (e) {
      // Failed to refresh 1D cache
    }
  }

  /// Refresh all cached data
  Future<void> refresh() async {
    _cache.clear();
    state = const AsyncValue.loading();
    await _prefetchAllTimeRanges();
  }
}
