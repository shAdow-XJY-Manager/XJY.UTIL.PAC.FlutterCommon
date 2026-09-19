import 'package:flutter/material.dart';

/// Site-wide color constants and text styles.
///
/// Provides a consistent design system with dark theme colors
/// and typography definitions.

// Color palette
const Color siteBackground = Color(0xFF222236);
const Color siteSurface = Color(0xFF29283F);
const Color siteSelected = Color(0xFF3D375B);
const Color siteAccent = Color(0xFF8060FF);
const Color siteMuted = Color(0xFFB8B5CE);
const Color siteDivider = Color(0xFF3C3A51);

// Text styles
const TextStyle siteBody = TextStyle(
  fontFamily: 'SiteBody',
  fontFamilyFallback: ['WDXL'],
  color: siteMuted,
  fontSize: 14,
  height: 1.6,
);

const TextStyle siteHeading = TextStyle(
  fontFamily: 'WDXL',
  color: Color(0xFFF4F1FF),
  fontSize: 22,
  height: 1.3,
);
