import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'app_theme.dart';

part 'theme_provider.g.dart';

/// Provider for managing the current app theme type
@riverpod
class ThemeNotifier extends _$ThemeNotifier {
  @override
  AppThemeType build() => AppThemeType.retailBank;

  /// Set a specific theme
  void setTheme(AppThemeType theme) {
    state = theme;
  }
}
