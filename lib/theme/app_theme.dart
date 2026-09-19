import 'package:flutter/material.dart';
import 'app_colors.dart';
import 'app_text_styles.dart';

/// Material3 theme configuration for Flutter Common apps.
///
/// Provides both dark and light theme variants with consistent
/// color schemes and typography.

class AppTheme {
  /// Dark theme (primary theme for all apps)
  static ThemeData darkTheme() {
    final colorScheme = ColorScheme(
      brightness: Brightness.dark,
      primary: AppColors.primary,
      onPrimary: AppColors.onPrimary,
      secondary: AppColors.secondary,
      onSecondary: AppColors.onSecondary,
      error: AppColors.error,
      onError: AppColors.onError,
      surface: AppColors.surface,
      onSurface: AppColors.onSurface,
      outline: AppColors.outline,
      shadow: AppColors.shadow,
      inverseSurface: AppColors.inverseSurface,
      onInverseSurface: AppColors.onInverseSurface,
      inversePrimary: AppColors.inversePrimary,
    );
    
    return ThemeData(
      useMaterial3: true,
      brightness: Brightness.dark,
      colorScheme: colorScheme,
      
      // Primary colors
      primaryColor: primaryColor,
      canvasColor: canvasColor,
      scaffoldBackgroundColor: scaffoldBackground,
      dividerColor: siteDivider,
      
      // Card theme
      cardTheme: CardThemeData(
        color: cardBackground,
        elevation: 2,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
      ),
      
      // App bar theme
      appBarTheme: AppBarTheme(
        backgroundColor: siteSurface,
        foregroundColor: textPrimary,
        elevation: 0,
        centerTitle: false,
        titleTextStyle: AppTextStyles.titleLarge,
      ),
      
      // Text theme
      textTheme: TextTheme(
        displayLarge: AppTextStyles.displayLarge,
        displayMedium: AppTextStyles.displayMedium,
        displaySmall: AppTextStyles.displaySmall,
        headlineLarge: AppTextStyles.headlineLarge,
        headlineMedium: AppTextStyles.headlineMedium,
        headlineSmall: AppTextStyles.headlineSmall,
        titleLarge: AppTextStyles.titleLarge,
        titleMedium: AppTextStyles.titleMedium,
        titleSmall: AppTextStyles.titleSmall,
        bodyLarge: AppTextStyles.bodyLarge,
        bodyMedium: AppTextStyles.bodyMedium,
        bodySmall: AppTextStyles.bodySmall,
        labelLarge: AppTextStyles.labelLarge,
        labelMedium: AppTextStyles.labelMedium,
        labelSmall: AppTextStyles.labelSmall,
      ),
      
      // Input decoration theme
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: siteSurface,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(color: borderColor),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(color: borderColor),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(color: siteAccent, width: 2),
        ),
        labelStyle: AppTextStyles.bodyMedium,
        hintStyle: AppTextStyles.bodyMedium.copyWith(color: textTertiary),
      ),
      
      // Elevated button theme
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
      
      // Text button theme
      textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(
          foregroundColor: siteAccent,
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          textStyle: AppTextStyles.button,
        ),
      ),
      
      // Outlined button theme
      outlinedButtonTheme: OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
          foregroundColor: textPrimary,
          side: BorderSide(color: borderColor),
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
          textStyle: AppTextStyles.button,
        ),
      ),
      
      // Icon theme
      iconTheme: IconThemeData(
        color: textSecondary,
        size: 24,
      ),
      
      // Divider theme
      dividerTheme: DividerThemeData(
        color: siteDivider,
        thickness: 1,
        space: 1,
      ),
      
      // Dialog theme
      dialogTheme: DialogThemeData(
        backgroundColor: siteSurface,
        elevation: 8,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        titleTextStyle: AppTextStyles.headlineSmall,
        contentTextStyle: AppTextStyles.bodyMedium,
      ),
      
      // Snackbar theme
      snackBarTheme: SnackBarThemeData(
        backgroundColor: surfaceDark,
        contentTextStyle: AppTextStyles.bodyMedium.copyWith(color: Colors.white),
        behavior: SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
      ),
      
      // Bottom navigation bar theme
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        backgroundColor: siteSurface,
        selectedItemColor: siteAccent,
        unselectedItemColor: textSecondary,
        selectedLabelStyle: AppTextStyles.labelSmall,
        unselectedLabelStyle: AppTextStyles.labelSmall,
        type: BottomNavigationBarType.fixed,
        elevation: 8,
      ),
      
      // Navigation rail theme
      navigationRailTheme: NavigationRailThemeData(
        backgroundColor: siteSurface,
        selectedIconTheme: IconThemeData(color: siteAccent),
        unselectedIconTheme: IconThemeData(color: textSecondary),
        selectedLabelTextStyle: AppTextStyles.labelMedium.copyWith(color: siteAccent),
        unselectedLabelTextStyle: AppTextStyles.labelMedium.copyWith(color: textSecondary),
      ),
      
      // Drawer theme
      drawerTheme: DrawerThemeData(
        backgroundColor: siteSurface,
        elevation: 16,
      ),
      
      // List tile theme
      listTileTheme: ListTileThemeData(
        textColor: textPrimary,
        iconColor: textSecondary,
        selectedColor: siteAccent,
        selectedTileColor: siteSelected,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
      ),
    );
  }
  
  /// Light theme (optional, for apps with theme switching)
  static ThemeData lightTheme() {
    final colorScheme = ColorScheme(
      brightness: Brightness.light,
      primary: primaryColor,
      onPrimary: Colors.white,
      secondary: siteAccent,
      onSecondary: Colors.white,
      error: errorColor,
      onError: Colors.white,
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
