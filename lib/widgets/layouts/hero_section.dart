import 'package:flutter/material.dart';
import '../../theme/app_colors.dart';
import '../../theme/app_text_styles.dart';

/// Hero section component for page headers.
///
/// Features:
/// - Large title
/// - Optional subtitle
/// - Optional background image
/// - Gradient overlay
class HeroSection extends StatelessWidget {
  final String title;
  final String? subtitle;
  final String? backgroundImage;
  final Color? backgroundColor;
  final List<Widget>? actions;
  final double height;
  final Alignment alignment;
  
  const HeroSection({
    super.key,
    required this.title,
    this.subtitle,
    this.backgroundImage,
    this.backgroundColor,
    this.actions,
    this.height = 200,
    this.alignment = Alignment.centerLeft,
  });
  
  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: double.infinity,
      decoration: BoxDecoration(
        color: backgroundColor ?? siteSurface,
        image: backgroundImage != null
            ? DecorationImage(
                image: AssetImage(backgroundImage!),
                fit: BoxFit.cover,
              )
            : null,
      ),
      child: Stack(
        children: [
          // Gradient overlay
          if (backgroundImage != null)
            Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Colors.black.withOpacity(0.6),
                    Colors.black.withOpacity(0.8),
                  ],
                ),
              ),
            ),
          
          // Content
          Padding(
            padding: const EdgeInsets.all(24),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: alignment == Alignment.centerLeft
                  ? CrossAxisAlignment.start
                  : CrossAxisAlignment.center,
              children: [
                Text(
                  title,
                  style: AppTextStyles.displaySmall,
                  textAlign: alignment == Alignment.center
                      ? TextAlign.center
                      : TextAlign.left,
                ),
                if (subtitle != null) ...[
                  const SizedBox(height: 8),
                  Text(
                    subtitle!,
                    style: AppTextStyles.bodyLarge.copyWith(
                      color: textSecondary,
                    ),
                    textAlign: alignment == Alignment.center
                        ? TextAlign.center
                        : TextAlign.left,
                  ),
                ],
                if (actions != null && actions!.isNotEmpty) ...[
                  const SizedBox(height: 16),
                  Wrap(
                    spacing: 12,
                    runSpacing: 12,
                    children: actions!,
                  ),
                ],
              ],
            ),
          ),
        ],
      ),
    );
  }
}
