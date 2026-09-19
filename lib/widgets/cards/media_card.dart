import 'package:flutter/material.dart';
import '../../theme/app_colors.dart';
import '../../theme/app_text_styles.dart';
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
    return BaseCard(
      width: width,
      height: height,
      padding: EdgeInsets.zero,
      onTap: onTap,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Cover image
          Expanded(
            child: ClipRRect(
              borderRadius: const BorderRadius.vertical(
                top: Radius.circular(8),
              ),
              child: Stack(
                fit: StackFit.expand,
                children: [
                  _buildCoverImage(),
                  if (badge != null) _buildBadge(),
                ],
              ),
            ),
          ),
          
          // Title and subtitle
          Padding(
            padding: const EdgeInsets.all(12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  title,
                  style: AppTextStyles.titleSmall,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                if (subtitle != null) ...[
                  const SizedBox(height: 4),
                  Text(
                    subtitle!,
                    style: AppTextStyles.bodySmall.copyWith(
                      color: textTertiary,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ],
            ),
          ),
        ],
      ),
    );
  }
  
  Widget _buildCoverImage() {
    if (imageUrl != null) {
      return Image.network(
        imageUrl!,
        fit: BoxFit.cover,
        errorBuilder: (context, error, stackTrace) => _buildFallback(),
      );
    } else if (assetImage != null) {
      return Image.asset(
        assetImage!,
        fit: BoxFit.cover,
        errorBuilder: (context, error, stackTrace) => _buildFallback(),
      );
    } else {
      return _buildFallback();
    }
  }
  
  Widget _buildFallback() {
    return Container(
      color: surfaceDark,
      child: Center(
        child: Icon(
          fallbackIcon ?? Icons.image_outlined,
          size: 48,
          color: textTertiary,
        ),
      ),
    );
  }
  
  Widget _buildBadge() {
    return Positioned(
      top: 8,
      right: 8,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
        decoration: BoxDecoration(
          color: siteAccent,
          borderRadius: BorderRadius.circular(4),
        ),
        child: Text(
          badge!,
          style: AppTextStyles.labelSmall.copyWith(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
