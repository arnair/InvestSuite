import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

/// Enum representing the available app themes
enum AppThemeType {
  retailBank('Retail Bank'),
  neobank('Neobank');

  const AppThemeType(this.displayName);
  final String displayName;
}

/// App-specific semantic colors available via `Theme.of(context).extension<AppColors>()`
class AppColors extends ThemeExtension<AppColors> {
  final Color positive;
  final Color negative;
  final Color chartLine;
  final Color chartGradientStart;
  final Color chartGradientEnd;

  const AppColors({
    required this.positive,
    required this.negative,
    required this.chartLine,
    required this.chartGradientStart,
    required this.chartGradientEnd,
  });

  @override
  AppColors copyWith({
    Color? positive,
    Color? negative,
    Color? chartLine,
    Color? chartGradientStart,
    Color? chartGradientEnd,
  }) {
    return AppColors(
      positive: positive ?? this.positive,
      negative: negative ?? this.negative,
      chartLine: chartLine ?? this.chartLine,
      chartGradientStart: chartGradientStart ?? this.chartGradientStart,
      chartGradientEnd: chartGradientEnd ?? this.chartGradientEnd,
    );
  }

  @override
  AppColors lerp(ThemeExtension<AppColors>? other, double t) {
    if (other is! AppColors) return this;
    return AppColors(
      positive: Color.lerp(positive, other.positive, t)!,
      negative: Color.lerp(negative, other.negative, t)!,
      chartLine: Color.lerp(chartLine, other.chartLine, t)!,
      chartGradientStart: Color.lerp(
        chartGradientStart,
        other.chartGradientStart,
        t,
      )!,
      chartGradientEnd: Color.lerp(
        chartGradientEnd,
        other.chartGradientEnd,
        t,
      )!,
    );
  }

  // Retail Bank colors
  static const retailBank = AppColors(
    positive: Color(0xFF2E7D32),
    negative: Color(0xFFC62828),
    chartLine: Color(0xFF1565C0),
    chartGradientStart: Color(0x4D1565C0), // 0.3 alpha
    chartGradientEnd: Color(0x001565C0), // 0.0 alpha
  );

  // Neobank colors
  static const neobank = AppColors(
    positive: Color(0xFF00FF94),
    negative: Color(0xFFFF6B6B),
    chartLine: Color(0xFF00FF94),
    chartGradientStart: Color(0x4D00FF94), // 0.3 alpha
    chartGradientEnd: Color(0x0000FF94), // 0.0 alpha
  );
}

/// App theme configuration providing both Retail Bank and Neobank themes
class AppTheme {
  AppTheme._();

  // ==========================================================================
  // SHARED COLOR CONSTANTS
  // ==========================================================================

  /// Neobank accent color (neon green)
  static const neobankAccent = Color(0xFF00FF94);

  /// Neobank background color
  static const neobankBackground = Color(0xFF161B22);

  /// Neobank surface color
  static const neobankSurface = Color(0xFF0D1117);

  /// Retail bank primary color
  static const retailBankPrimary = Color(0xFF1565C0);

  // ==========================================================================
  // RETAIL BANK THEME - Clean, Professional, Blue-based
  // ==========================================================================

  static final ThemeData retailBankTheme = ThemeData(
    useMaterial3: true,
    brightness: Brightness.light,
    extensions: const [AppColors.retailBank],
    colorScheme: const ColorScheme.light(
      primary: Color(0xFF1565C0), // Deep Blue
      onPrimary: Colors.white,
      primaryContainer: Color(0xFFD1E4FF),
      onPrimaryContainer: Color(0xFF001D36),
      secondary: Color(0xFF535F70),
      onSecondary: Colors.white,
      secondaryContainer: Color(0xFFD7E3F8),
      onSecondaryContainer: Color(0xFF101C2B),
      tertiary: Color(0xFF6B5778),
      onTertiary: Colors.white,
      tertiaryContainer: Color(0xFFF3DAFF),
      onTertiaryContainer: Color(0xFF251432),
      error: Color(0xFFBA1A1A),
      onError: Colors.white,
      errorContainer: Color(0xFFFFDAD6),
      onErrorContainer: Color(0xFF410002),
      surface: Color(0xFFF8FAFF),
      onSurface: Color(0xFF1A1C1E),
      surfaceContainerHighest: Color(0xFFE0E2E8),
      onSurfaceVariant: Color(0xFF43474E),
      outline: Color(0xFF73777F),
      outlineVariant: Color(0xFFC3C6CF),
      shadow: Color(0xFF000000),
      scrim: Color(0xFF000000),
      inverseSurface: Color(0xFF2F3033),
      onInverseSurface: Color(0xFFF1F0F4),
      inversePrimary: Color(0xFF9ECAFF),
    ),
    scaffoldBackgroundColor: const Color(0xFFF8FAFF),
    appBarTheme: AppBarTheme(
      elevation: 0,
      centerTitle: true,
      backgroundColor: const Color(0xFFF8FAFF),
      foregroundColor: const Color(0xFF1A1C1E),
      titleTextStyle: GoogleFonts.inter(
        fontSize: 20,
        fontWeight: FontWeight.w600,
        color: const Color(0xFF1A1C1E),
      ),
    ),
    cardTheme: CardThemeData(
      elevation: 2,
      shadowColor: Colors.black.withValues(alpha: 0.1),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      color: Colors.white,
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        elevation: 2,
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 14),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        textStyle: GoogleFonts.inter(fontSize: 16, fontWeight: FontWeight.w600),
      ),
    ),
    textTheme: _buildTextTheme(Brightness.light),
    iconTheme: const IconThemeData(color: Color(0xFF1565C0)),
    dividerTheme: const DividerThemeData(
      color: Color(0xFFE0E2E8),
      thickness: 1,
    ),
    navigationBarTheme: NavigationBarThemeData(
      backgroundColor: const Color(0xFFF8FAFF),
      indicatorColor: const Color(0xFFD1E4FF),
      iconTheme: WidgetStateProperty.resolveWith((states) {
        if (states.contains(WidgetState.selected)) {
          return const IconThemeData(color: Color(0xFF1565C0));
        }
        return const IconThemeData(color: Color(0xFF43474E));
      }),
    ),
  );

  // ==========================================================================
  // NEOBANK THEME - Dark, Neon, Modern
  // ==========================================================================

  static final ThemeData neobankTheme = ThemeData(
    useMaterial3: true,
    brightness: Brightness.dark,
    extensions: const [AppColors.neobank],
    colorScheme: const ColorScheme.dark(
      primary: Color(0xFF00FF94), // Neon Green
      onPrimary: Color(0xFF003822),
      primaryContainer: Color(0xFF005233),
      onPrimaryContainer: Color(0xFF6AFFB8),
      secondary: Color(0xFFB4CCB9),
      onSecondary: Color(0xFF203527),
      secondaryContainer: Color(0xFF364B3D),
      onSecondaryContainer: Color(0xFFD0E8D5),
      tertiary: Color(0xFFA4CDDC),
      onTertiary: Color(0xFF043541),
      tertiaryContainer: Color(0xFF234C58),
      onTertiaryContainer: Color(0xFFC0E9F9),
      error: Color(0xFFFFB4AB),
      onError: Color(0xFF690005),
      errorContainer: Color(0xFF93000A),
      onErrorContainer: Color(0xFFFFDAD6),
      surface: Color(0xFF0D1117), // GitHub dark background
      onSurface: Color(0xFFE6E1E5),
      surfaceContainerHighest: Color(0xFF1C2128),
      onSurfaceVariant: Color(0xFFC4C7C5),
      outline: Color(0xFF8E918F),
      outlineVariant: Color(0xFF444746),
      shadow: Color(0xFF000000),
      scrim: Color(0xFF000000),
      inverseSurface: Color(0xFFE6E1E5),
      onInverseSurface: Color(0xFF1A1C1E),
      inversePrimary: Color(0xFF006D40),
    ),
    scaffoldBackgroundColor: const Color(0xFF0D1117),
    appBarTheme: AppBarTheme(
      elevation: 0,
      centerTitle: true,
      backgroundColor: const Color(0xFF0D1117),
      foregroundColor: Colors.white,
      titleTextStyle: GoogleFonts.spaceMono(
        fontSize: 20,
        fontWeight: FontWeight.w700,
        color: Colors.white,
      ),
    ),
    cardTheme: CardThemeData(
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
        side: const BorderSide(color: Color(0xFF30363D), width: 1),
      ),
      color: const Color(0xFF161B22),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        elevation: 0,
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 14),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        textStyle: GoogleFonts.spaceMono(
          fontSize: 14,
          fontWeight: FontWeight.w700,
        ),
      ),
    ),
    textTheme: _buildTextTheme(Brightness.dark),
    iconTheme: const IconThemeData(color: Color(0xFF00FF94)),
    dividerTheme: const DividerThemeData(
      color: Color(0xFF30363D),
      thickness: 1,
    ),
    navigationBarTheme: NavigationBarThemeData(
      backgroundColor: neobankBackground,
      indicatorColor: neobankAccent.withValues(alpha: 0.2),
      iconTheme: WidgetStateProperty.resolveWith((states) {
        if (states.contains(WidgetState.selected)) {
          return const IconThemeData(color: neobankAccent);
        }
        return const IconThemeData(color: Color(0xFFC4C7C5));
      }),
    ),
  );

  static TextTheme _buildTextTheme(Brightness brightness) {
    final isLight = brightness == Brightness.light;
    final baseColor = isLight ? const Color(0xFF1A1C1E) : Colors.white;
    final secondaryColor = isLight
        ? const Color(0xFF43474E)
        : const Color(0xFFC4C7C5);

    final fontFamily = isLight ? GoogleFonts.inter : GoogleFonts.spaceMono;

    return TextTheme(
      displayLarge: fontFamily(
        fontSize: 57,
        fontWeight: FontWeight.w400,
        color: baseColor,
      ),
      displayMedium: fontFamily(
        fontSize: 45,
        fontWeight: FontWeight.w400,
        color: baseColor,
      ),
      displaySmall: fontFamily(
        fontSize: 36,
        fontWeight: FontWeight.w400,
        color: baseColor,
      ),
      headlineLarge: fontFamily(
        fontSize: 32,
        fontWeight: FontWeight.w600,
        color: baseColor,
      ),
      headlineMedium: fontFamily(
        fontSize: 28,
        fontWeight: FontWeight.w600,
        color: baseColor,
      ),
      headlineSmall: fontFamily(
        fontSize: 24,
        fontWeight: FontWeight.w600,
        color: baseColor,
      ),
      titleLarge: fontFamily(
        fontSize: 22,
        fontWeight: FontWeight.w600,
        color: baseColor,
      ),
      titleMedium: fontFamily(
        fontSize: 16,
        fontWeight: FontWeight.w600,
        color: baseColor,
      ),
      titleSmall: fontFamily(
        fontSize: 14,
        fontWeight: FontWeight.w600,
        color: baseColor,
      ),
      bodyLarge: fontFamily(
        fontSize: 16,
        fontWeight: FontWeight.w400,
        color: baseColor,
      ),
      bodyMedium: fontFamily(
        fontSize: 14,
        fontWeight: FontWeight.w400,
        color: baseColor,
      ),
      bodySmall: fontFamily(
        fontSize: 12,
        fontWeight: FontWeight.w400,
        color: secondaryColor,
      ),
      labelLarge: fontFamily(
        fontSize: 14,
        fontWeight: FontWeight.w600,
        color: baseColor,
      ),
      labelMedium: fontFamily(
        fontSize: 12,
        fontWeight: FontWeight.w600,
        color: baseColor,
      ),
      labelSmall: fontFamily(
        fontSize: 11,
        fontWeight: FontWeight.w600,
        color: secondaryColor,
      ),
    );
  }

  // Chart colors for each theme
  static Color chartLineColor(AppThemeType theme) {
    return theme == AppThemeType.retailBank
        ? const Color(0xFF1565C0)
        : const Color(0xFF00FF94);
  }

  static Color chartGradientStart(AppThemeType theme) {
    return theme == AppThemeType.retailBank
        ? const Color(0xFF1565C0).withValues(alpha: 0.3)
        : const Color(0xFF00FF94).withValues(alpha: 0.3);
  }

  static Color chartGradientEnd(AppThemeType theme) {
    return theme == AppThemeType.retailBank
        ? const Color(0xFF1565C0).withValues(alpha: 0.0)
        : const Color(0xFF00FF94).withValues(alpha: 0.0);
  }

  static Color positiveColor(AppThemeType theme) {
    return theme == AppThemeType.retailBank
        ? const Color(0xFF2E7D32)
        : const Color(0xFF00FF94);
  }

  static Color negativeColor(AppThemeType theme) {
    return theme == AppThemeType.retailBank
        ? const Color(0xFFC62828)
        : const Color(0xFFFF6B6B);
  }
}
