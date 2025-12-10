/// Extension methods for formatting [double] values as currency or percentages
extension NumberFormatters on double {
  /// Format as currency with 2 decimal places: `$1,234.56`
  String get asCurrency => '\$${toStringAsFixed(2)}';

  /// Format as whole dollar currency: `$1,234`
  String get asCurrencyWhole => '\$${toStringAsFixed(0)}';

  /// Format as currency with sign: `+$123.45` or `-$123.45`
  String get asCurrencyWithSign {
    final sign = this >= 0 ? '+' : '';
    return '$sign\$${abs().toStringAsFixed(0)}';
  }

  /// Format as compact currency (for charts): `$12.3k`
  String get asCurrencyCompact => '\$${(this / 1000).toStringAsFixed(1)}k';

  /// Format as percentage with sign: `+12.34%` or `-12.34%`
  String get asPercentWithSign {
    final sign = this >= 0 ? '+' : '';
    return '$sign${toStringAsFixed(2)}%';
  }

  /// Check if value represents a positive change
  bool get isPositiveChange => this >= 0;
}
