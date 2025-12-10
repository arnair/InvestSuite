import 'package:flutter/material.dart';

import '../../../../widgets/segmented_text_toggle.dart';
import '../../domain/performance_model.dart';

/// Widget for selecting time range for performance chart
class TimeRangeSelector extends StatelessWidget {
  final TimeRange selectedRange;
  final ValueChanged<TimeRange> onRangeSelected;

  const TimeRangeSelector({
    super.key,
    required this.selectedRange,
    required this.onRangeSelected,
  });

  @override
  Widget build(BuildContext context) {
    return SegmentedTextToggle<TimeRange>(
      value: selectedRange,
      options: TimeRange.values
          .map(
            (range) =>
                SegmentedTextOption(value: range, label: range.displayName),
          )
          .toList(),
      onChanged: onRangeSelected,
    );
  }
}
