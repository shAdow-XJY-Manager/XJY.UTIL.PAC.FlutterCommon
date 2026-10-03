import 'package:flutter/material.dart';
import 'base_card.dart';

/// Media card component for displaying music, videos, comics, etc.
///
/// Features:
/// - Cover image with fallback
/// - Title and subtitle
/// - Optional badge/tag
/// - Hover effects
class MediaCard extends StatelessWidget {
  final String? imageUrl;
  final String? assetImage;
  final IconData? fallbackIcon;
  final String title;
  final String? subtitle;
  final String? badge;
  final VoidCallback? onTap;
  final double? width;
  final double? height;
  final double aspectRatio;

  const MediaCard({
    super.key,
    this.imageUrl,
    this.assetImage,
    this.fallbackIcon,
    required this.title,
    this.subtitle,
    this.badge,
    this.onTap,
    this.width,
    this.height,
    this.aspectRatio = 0.75, // Portrait by default
  });

  @override
  Widget build(BuildContext context) {
    final cover = ClipRRect(
      borderRadius: const BorderRadius.vertical(top: Radius.circular(8)),
      child: Stack(
        fit: StackFit.expand,
        children: [
          _buildCoverImage(context),
          if (badge != null) _buildBadge(context),
        ],
      ),
    );
    return BaseCard(
      width: width,
      height: height,
      padding: EdgeInsets.zero,
      onTap: onTap,
      child: LayoutBuilder(builder: (context, constraints) => Column(
        mainAxisSize: constraints.hasBoundedHeight ? MainAxisSize.max : MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (constraints.hasBoundedHeight)
            Expanded(child: cover)
          else
            AspectRatio(aspectRatio: aspectRatio, child: cover),

          // Title and subtitle
          Padding(
            padding: const EdgeInsets.all(12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  title,
                  style: Theme.of(context).textTheme.titleSmall,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                if (subtitle != null) ...[
                  const SizedBox(height: 4),
                  Text(
                    subtitle!,
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      color: Theme.of(context).colorScheme.onSurfaceVariant,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ],
            ),
          ),
        ],
      )),
    );
  }

  Widget _buildCoverImage(BuildContext context) {
    if (imageUrl != null) {
      return Image.network(
        imageUrl!,
        fit: BoxFit.cover,
        errorBuilder: (context, error, stackTrace) => _buildFallback(context),
      );
    } else if (assetImage != null) {
      return Image.asset(
        assetImage!,
        fit: BoxFit.cover,
        errorBuilder: (context, error, stackTrace) => _buildFallback(context),
      );
    } else {
      return _buildFallback(context);
    }
  }

  Widget _buildFallback(BuildContext context) {
    return Container(
      color: Theme.of(context).colorScheme.surfaceContainerHighest,
      child: Center(
        child: Icon(
          fallbackIcon ?? Icons.image_outlined,
          size: 48,
          color: Theme.of(context).colorScheme.onSurfaceVariant,
        ),
      ),
    );
  }

  Widget _buildBadge(BuildContext context) {
    return Positioned(
      top: 8,
      right: 8,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.primary,
          borderRadius: BorderRadius.circular(4),
        ),
        child: Text(
          badge!,
          style: Theme.of(context).textTheme.labelLarge?.copyWith(
            color: Theme.of(context).colorScheme.onPrimary,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
