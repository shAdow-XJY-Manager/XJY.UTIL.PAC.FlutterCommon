import 'package:flutter/material.dart';

/// Extended color palette for the Flutter Common design system.
///
/// Includes all colors from site_style.dart plus additional theme colors
/// for Material3 integration.

// Core brand colors (from site_style.dart)
const Color siteBackground = Color(0xFF222236);
const Color siteSurface = Color(0xFF29283F);
const Color siteSelected = Color(0xFF3D375B);
const Color siteAccent = Color(0xFF8060FF);
const Color siteMuted = Color(0xFFB8B5CE);
const Color siteDivider = Color(0xFF3C3A51);

// Primary theme colors
const Color primaryColor = Color(0xFF685BFF);
const Color primaryLight = Color(0xFF8060FF);
const Color primaryDark = Color(0xFF5048D9);

// Background colors
const Color canvasColor = Color(0xFF2E2E48);
const Color scaffoldBackground = Color(0xFF464667);

// Text colors
const Color textPrimary = Color(0xFFF4F1FF);
const Color textSecondary = Color(0xFFB8B5CE);
const Color textTertiary = Color(0xFF8B88A5);
const Color textDisabled = Color(0xFF5C5973);

// Status colors
const Color successColor = Color(0xFF4CAF50);
const Color warningColor = Color(0xFFFFA726);
const Color errorColor = Color(0xFFEF5350);
const Color infoColor = Color(0xFF29B6F6);

// Surface variations
const Color surfaceLight = Color(0xFF353451);
const Color surfaceDark = Color(0xFF1C1B2E);
const Color surfaceHover = Color(0xFF3D3B5A);

// Border and divider
const Color borderColor = Color(0xFF3C3A51);
const Color borderLight = Color(0xFF4A4863);
const Color borderDark = Color(0xFF2D2B3E);

// Overlay colors (for modals, dialogs)
const Color overlayLight = Color(0x33000000);
const Color overlayDark = Color(0x66000000);

// Card colors
const Color cardBackground = Color(0xFF29283F);
const Color cardHover = Color(0xFF353451);
const Color cardPressed = Color(0xFF3D3B5A);

/// Color scheme for dark theme
class AppColors {
  static const brightness = Brightness.dark;
  
  // Primary
  static const primary = primaryColor;
  static const onPrimary = Color(0xFFFFFFFF);
  
  // Secondary
  static const secondary = siteAccent;
  static const onSecondary = Color(0xFFFFFFFF);
  
  // Background
  static const background = siteBackground;
  static const onBackground = textPrimary;
  
  // Surface
  static const surface = siteSurface;
  static const onSurface = textPrimary;
  
  // Error
  static const error = errorColor;
  static const onError = Color(0xFFFFFFFF);
  
  // Variants
  static const surfaceVariant = siteSelected;
  static const onSurfaceVariant = textSecondary;
  static const outline = borderColor;
  static const shadow = Color(0xFF000000);
  static const inverseSurface = Color(0xFFE8E7F0);
  static const onInverseSurface = Color(0xFF1C1B2E);
  static const inversePrimary = Color(0xFF4A42C0);
}
