import 'package:flutter/material.dart';

/// Extended color palette for the Flutter Common design system.
///
/// Includes all colors from site_style.dart plus additional theme colors
/// for Material3 integration.

// Frequency Terminal colors (canonical legacy names)
const Color siteBackground = Color(0xFF111315);
const Color siteSurface = Color(0xFF1B1E20);
const Color siteSelected = Color(0xFF303719);
const Color siteAccent = Color(0xFFD6EF36);
const Color siteMuted = Color(0xFFADB1A9);
const Color siteDivider = Color(0xFF41484B);

// Primary theme colors
const Color primaryColor = Color(0xFFD6EF36);
const Color primaryLight = Color(0xFFD6EF36);
const Color primaryDark = Color(0xFFB3CB20);

// Background colors
const Color canvasColor = Color(0xFF1B1E20);
const Color scaffoldBackground = Color(0xFF111315);

// Text colors
const Color textPrimary = Color(0xFFF4F2E9);
const Color textSecondary = Color(0xFFADB1A9);
const Color textTertiary = Color(0xFFADB1A9);
const Color textDisabled = Color(0xFF858B83);

// Status colors
const Color successColor = Color(0xFFA8D978);
const Color warningColor = Color(0xFFFFB23F);
const Color errorColor = Color(0xFFFF9691);
const Color infoColor = Color(0xFFA6DCE3);

// Surface variations
const Color surfaceLight = Color(0xFF25292C);
const Color surfaceDark = Color(0xFF111315);
const Color surfaceHover = Color(0xFF25292C);

// Border and divider
const Color borderColor = Color(0xFF41484B);
const Color borderLight = Color(0xFF41484B);
const Color borderDark = Color(0xFF303638);

// Overlay colors (for modals, dialogs)
const Color overlayLight = Color(0x33000000);
const Color overlayDark = Color(0x66000000);

// Card colors
const Color cardBackground = Color(0xFF1B1E20);
const Color cardHover = Color(0xFF25292C);
const Color cardPressed = Color(0xFF25292C);

/// Color scheme for dark theme
class AppColors {
  static const brightness = Brightness.dark;
  
  // Primary
  static const primary = primaryColor;
  static const onPrimary = siteBackground;
  
  // Secondary
  static const secondary = siteAccent;
  static const onSecondary = siteBackground;
  
  // Background
  static const background = siteBackground;
  static const onBackground = textPrimary;
  
  // Surface
  static const surface = siteSurface;
  static const onSurface = textPrimary;
  
  // Error
  static const error = errorColor;
  static const onError = siteBackground;
  
  // Variants
  static const surfaceVariant = siteSelected;
  static const onSurfaceVariant = textSecondary;
  static const outline = borderColor;
  static const shadow = Color(0xFF000000);
  static const inverseSurface = Color(0xFFE8E7F0);
  static const onInverseSurface = Color(0xFF111315);
  static const inversePrimary = Color(0xFF4A42C0);
}
