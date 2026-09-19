import 'package:flutter/material.dart';
import '../../theme/app_colors.dart';
import '../../theme/app_text_styles.dart';
import 'base_card.dart';

/// Info card component for displaying information, settings, or details.
///
/// Features:
/// - Optional icon
/// - Title and description
/// - Optional action widget
/// - Compact or expanded layout
class InfoCard extends StatelessWidget {
  final IconData? icon;
  final String title;
  final String? description;
  final Widget? trailing;
  final VoidCallback? onTap;
  final bool compact;
  final Color? iconColor;
  final double? width;
  
  const InfoCard({
    super.key,
    this.icon,
    required this.title,
    this.description,
    this.trailing,
    this.onTap,
    this.compact = false,
    this.iconColor,
    this.width,
  });
  
  @override
  Widget build(BuildContext context) {
    return BaseCard(
      width: width,
      padding: compact 
          ? const EdgeInsets.all(12)
          : const EdgeInsets.all(16),
      onTap: onTap,
      child: Row(
        children: [
          if (icon != null) ...[
            Container(
              width: compact ? 36 : 48,
              height: compact ? 36 : 48,
              decoration: BoxDecoration(
                color: (iconColor ?? siteAccent).withOpacity(0.2),
                borderRadius: BorderRadius.circular(compact ? 6 : 8),
              ),
              child: Icon(
                icon,
                color: iconColor ?? siteAccent,
                size: compact ? 20 : 24,
              ),
            ),
            SizedBox(width: compact ? 12 : 16),
          ],
          
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  title,
                  style: compact 
                      ? AppTextStyles.titleSmall
                      : AppTextStyles.titleMedium,
                ),
                if (description != null) ...[
                  SizedBox(height: compact ? 2 : 4),
                  Text(
                    description!,
                    style: compact
                        ? AppTextStyles.bodySmall.copyWith(color: textTertiary)
                        : AppTextStyles.bodyMedium.copyWith(color: textSecondary),
                    maxLines: compact ? 1 : 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ],
            ),
          ),
          
          if (trailing != null) ...[
            SizedBox(width: compact ? 8 : 12),
            trailing!,
          ] else if (onTap != null) ...[
            SizedBox(width: compact ? 8 : 12),
            Icon(
              Icons.chevron_right,
              color: textTertiary,
              size: compact ? 20 : 24,
            ),
          ],
        ],
      ),
    );
  }
}
