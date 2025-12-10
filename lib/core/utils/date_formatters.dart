import 'package:intl/intl.dart';

/// Extension for formatting [DateTime] values
extension DateTimeFormatters on DateTime {
  /// Format as "MMM d, HH:mm" (e.g., "Jan 5, 14:30")
  String get asDateTimeShort => DateFormat('MMM d, HH:mm').format(this);

  /// Format as "ha" hour with am/pm (e.g., "2pm")
  String get asHour => DateFormat('ha').format(this);

  /// Format as day of week (e.g., "Mon")
  String get asDayOfWeek => DateFormat('E').format(this);

  /// Format as "MMM d" (e.g., "Jan 5")
  String get asMonthDay => DateFormat('MMM d').format(this);

  /// Format as month only (e.g., "Jan")
  String get asMonth => DateFormat('MMM').format(this);
}
