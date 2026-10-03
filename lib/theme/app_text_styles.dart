import 'package:flutter/material.dart';
import 'app_colors.dart';

/// Text style definitions for the Flutter Common design system.
///
/// Provides a consistent typography system with Material3 text styles
/// and custom site styles.

class AppTextStyles {
  // Display styles (largest headings)
  static const displayLarge = TextStyle(
    fontFamily: 'WDXL',
    fontSize: 57,
    fontWeight: FontWeight.w300,
    height: 1.12,
    letterSpacing: -0.25,
    color: textPrimary,
  );
  
  static const displayMedium = TextStyle(
    fontFamily: 'WDXL',
    fontSize: 45,
    fontWeight: FontWeight.w300,
    height: 1.16,
    color: textPrimary,
  );
  
  static const displaySmall = TextStyle(
    fontFamily: 'WDXL',
    fontSize: 36,
    fontWeight: FontWeight.w400,
    height: 1.22,
    color: textPrimary,
  );
  
  // Headline styles
  static const headlineLarge = TextStyle(
    fontFamily: 'WDXL',
    fontSize: 32,
    fontWeight: FontWeight.w400,
    height: 1.25,
    color: textPrimary,
  );
  
  static const headlineMedium = TextStyle(
    fontFamily: 'WDXL',
    fontSize: 28,
    fontWeight: FontWeight.w400,
    height: 1.29,
    color: textPrimary,
  );
  
  static const headlineSmall = TextStyle(
    fontFamily: 'WDXL',
    fontSize: 24,
    fontWeight: FontWeight.w400,
    height: 1.33,
    color: textPrimary,
  );
  
  // Title styles
  static const titleLarge = TextStyle(
    fontFamily: 'WDXL',
    fontSize: 22,
    fontWeight: FontWeight.w500,
    height: 1.27,
    color: textPrimary,
  );
  
  static const titleMedium = TextStyle(
    fontFamily: 'SiteBody',
    fontFamilyFallback: ['FrequencySans'],
    fontSize: 16,
    fontWeight: FontWeight.w500,
    height: 1.5,
    letterSpacing: 0.15,
    color: textPrimary,
  );
  
  static const titleSmall = TextStyle(
    fontFamily: 'SiteBody',
    fontFamilyFallback: ['FrequencySans'],
    fontSize: 14,
    fontWeight: FontWeight.w500,
    height: 1.43,
    letterSpacing: 0.1,
    color: textPrimary,
  );
  
  // Body styles
  static const bodyLarge = TextStyle(
    fontFamily: 'SiteBody',
    fontFamilyFallback: ['FrequencySans'],
    fontSize: 16,
    fontWeight: FontWeight.w400,
    height: 1.5,
    letterSpacing: 0.5,
    color: textSecondary,
  );
  
  static const bodyMedium = TextStyle(
    fontFamily: 'SiteBody',
    fontFamilyFallback: ['FrequencySans'],
    fontSize: 14,
    fontWeight: FontWeight.w400,
    height: 1.6,
    letterSpacing: 0.25,
    color: textSecondary,
  );
  
  static const bodySmall = TextStyle(
    fontFamily: 'SiteBody',
    fontFamilyFallback: ['FrequencySans'],
    fontSize: 12,
    fontWeight: FontWeight.w400,
    height: 1.67,
    letterSpacing: 0.4,
    color: textSecondary,
  );
  
  // Label styles
  static const labelLarge = TextStyle(
    fontFamily: 'SiteBody',
    fontFamilyFallback: ['FrequencySans'],
    fontSize: 14,
    fontWeight: FontWeight.w500,
    height: 1.43,
    letterSpacing: 0.1,
    color: textPrimary,
  );
  
  static const labelMedium = TextStyle(
    fontFamily: 'SiteBody',
    fontFamilyFallback: ['FrequencySans'],
    fontSize: 12,
    fontWeight: FontWeight.w500,
    height: 1.33,
    letterSpacing: 0.5,
    color: textPrimary,
  );
  
  static const labelSmall = TextStyle(
    fontFamily: 'SiteBody',
    fontFamilyFallback: ['FrequencySans'],
    fontSize: 11,
    fontWeight: FontWeight.w500,
    height: 1.45,
    letterSpacing: 0.5,
    color: textSecondary,
  );
  
  // Legacy site styles (preserved for compatibility)
  static const siteBody = TextStyle(
    fontFamily: 'SiteBody',
    fontFamilyFallback: ['FrequencySans'],
    color: siteMuted,
    fontSize: 16,
    height: 1.6,
  );
  
  static const siteHeading = TextStyle(
    fontFamily: 'WDXL',
    color: textPrimary,
    fontSize: 22,
    height: 1.3,
  );
  
  // Custom utility styles
  static const caption = TextStyle(
    fontFamily: 'SiteBody',
    fontFamilyFallback: ['FrequencySans'],
    fontSize: 12,
    fontWeight: FontWeight.w400,
    height: 1.5,
    color: textTertiary,
  );
  
  static const overline = TextStyle(
    fontFamily: 'SiteBody',
    fontFamilyFallback: ['FrequencySans'],
    fontSize: 10,
    fontWeight: FontWeight.w500,
    height: 1.6,
    letterSpacing: 1.5,
    color: textTertiary,
  );
  
  static const button = TextStyle(
    fontFamily: 'SiteBody',
    fontFamilyFallback: ['FrequencySans'],
    fontSize: 14,
    fontWeight: FontWeight.w500,
    height: 1.43,
    letterSpacing: 0.1,
    color: textPrimary,
  );
}

// Legacy top-level names remain available through flutter_common.dart.
const TextStyle siteBody = AppTextStyles.siteBody;
const TextStyle siteHeading = AppTextStyles.siteHeading;
