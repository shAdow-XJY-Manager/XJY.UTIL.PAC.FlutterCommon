import 'package:flutter/material.dart';
import 'app_colors.dart';
import 'app_text_styles.dart';
import 'frequency_theme.dart';

/// Material3 theme configuration for Flutter Common apps.
///
/// Provides both dark and light theme variants with consistent
/// color schemes and typography.

class AppTheme {
  /// Dark theme (primary theme for all apps)
  static ThemeData darkTheme() => FrequencyTheme.dark(fontFamily: 'SiteBody');
  
  /// Light theme (optional, for apps with theme switching)
  static ThemeData lightTheme() {
    final colorScheme = ColorScheme(
      brightness: Brightness.light,
      primary: primaryColor,
      onPrimary: siteBackground,
      secondary: siteAccent,
      onSecondary: siteBackground,
      error: errorColor,
      onError: siteBackground,
      surface: Colors.white,
      onSurface: Color(0xFF1C1B2E),
      outline: Color(0xFFCAC5D7),
      shadow: Color(0xFF000000),
      inverseSurface: Color(0xFF313042),
      onInverseSurface: Color(0xFFF5F4FA),
      inversePrimary: siteAccent,
    );
    
    return ThemeData(
      useMaterial3: true,
      brightness: Brightness.light,
      colorScheme: colorScheme,
      
      primaryColor: primaryColor,
      canvasColor: Color(0xFFFAFAFC),
      scaffoldBackgroundColor: Color(0xFFF5F5F9),
      dividerColor: Color(0xFFE0DFE7),
      
      cardTheme: CardThemeData(
        color: Colors.white,
        elevation: 2,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
      ),
      
      appBarTheme: AppBarTheme(
        backgroundColor: Colors.white,
        foregroundColor: Color(0xFF1C1B2E),
        elevation: 0,
        centerTitle: false,
        titleTextStyle: AppTextStyles.titleLarge.copyWith(color: Color(0xFF1C1B2E)),
      ),
      
      textTheme: TextTheme(
        displayLarge: AppTextStyles.displayLarge.copyWith(color: Color(0xFF1C1B2E)),
        displayMedium: AppTextStyles.displayMedium.copyWith(color: Color(0xFF1C1B2E)),
        displaySmall: AppTextStyles.displaySmall.copyWith(color: Color(0xFF1C1B2E)),
        headlineLarge: AppTextStyles.headlineLarge.copyWith(color: Color(0xFF1C1B2E)),
        headlineMedium: AppTextStyles.headlineMedium.copyWith(color: Color(0xFF1C1B2E)),
        headlineSmall: AppTextStyles.headlineSmall.copyWith(color: Color(0xFF1C1B2E)),
        titleLarge: AppTextStyles.titleLarge.copyWith(color: Color(0xFF1C1B2E)),
        titleMedium: AppTextStyles.titleMedium.copyWith(color: Color(0xFF1C1B2E)),
        titleSmall: AppTextStyles.titleSmall.copyWith(color: Color(0xFF1C1B2E)),
        bodyLarge: AppTextStyles.bodyLarge.copyWith(color: Color(0xFF48465C)),
        bodyMedium: AppTextStyles.bodyMedium.copyWith(color: Color(0xFF48465C)),
        bodySmall: AppTextStyles.bodySmall.copyWith(color: Color(0xFF5C5A6F)),
        labelLarge: AppTextStyles.labelLarge.copyWith(color: Color(0xFF1C1B2E)),
        labelMedium: AppTextStyles.labelMedium.copyWith(color: Color(0xFF1C1B2E)),
        labelSmall: AppTextStyles.labelSmall.copyWith(color: Color(0xFF48465C)),
      ),
      
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: primaryColor,
          foregroundColor: Colors.white,
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
          textStyle: AppTextStyles.button,
        ),
      ),
      
      textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(
          foregroundColor: primaryColor,
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          textStyle: AppTextStyles.button,
        ),
      ),
    );
  }
}
