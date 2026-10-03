import 'package:flutter/material.dart';

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
    final theme = Theme.of(context);
    return Container(
      constraints: BoxConstraints(minHeight: height),
      width: double.infinity,
      color: backgroundColor ?? theme.colorScheme.surface,
      child: Stack(
        children: [
          if (backgroundImage != null) ...[
            Positioned.fill(
              child: Image.asset(
                backgroundImage!,
                fit: BoxFit.cover,
                errorBuilder: (_, _, _) => const SizedBox.shrink(),
              ),
            ),
            Positioned.fill(
              child: ColoredBox(color: Colors.black.withValues(alpha: .75)),
            ),
          ],
          Align(
            alignment: alignment,
            child: Padding(
              padding: const EdgeInsets.all(24),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: alignment == Alignment.centerLeft
                    ? CrossAxisAlignment.start
                    : CrossAxisAlignment.center,
                children: [
                  Text(
                    title,
                    style: theme.textTheme.displaySmall?.copyWith(
                      color: backgroundImage == null
                          ? theme.colorScheme.onSurface
                          : Colors.white,
                    ),
                    textAlign: alignment == Alignment.center
                        ? TextAlign.center
                        : TextAlign.left,
                  ),
                  if (subtitle != null) ...[
                    const SizedBox(height: 8),
                    Text(
                      subtitle!,
                      style: theme.textTheme.bodyLarge?.copyWith(
                        color: backgroundImage == null
                            ? theme.colorScheme.onSurfaceVariant
                            : Colors.white,
                      ),
                      textAlign: alignment == Alignment.center
                          ? TextAlign.center
                          : TextAlign.left,
                    ),
                  ],
                  if (actions != null && actions!.isNotEmpty) ...[
                    const SizedBox(height: 16),
                    Wrap(spacing: 12, runSpacing: 12, children: actions!),
                  ],
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
