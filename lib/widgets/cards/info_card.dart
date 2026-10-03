import 'package:flutter/material.dart';
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
      padding: compact ? const EdgeInsets.all(12) : const EdgeInsets.all(16),
      onTap: onTap,
      child: Row(
        children: [
          if (icon != null) ...[
            Container(
              width: compact ? 36 : 48,
              height: compact ? 36 : 48,
              decoration: BoxDecoration(
                color: (iconColor ?? Theme.of(context).colorScheme.primary)
                    .withOpacity(0.2),
                borderRadius: BorderRadius.circular(compact ? 6 : 8),
              ),
              child: Icon(
                icon,
                color: iconColor ?? Theme.of(context).colorScheme.primary,
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
                      ? Theme.of(context).textTheme.titleSmall
                      : Theme.of(context).textTheme.titleMedium,
                ),
                if (description != null) ...[
                  SizedBox(height: compact ? 2 : 4),
                  Text(
                    description!,
                    style: compact
                        ? Theme.of(context).textTheme.bodyMedium?.copyWith(
                            color: Theme.of(
                              context,
                            ).colorScheme.onSurfaceVariant,
                          )
                        : Theme.of(context).textTheme.bodyLarge?.copyWith(
                            color: Theme.of(
                              context,
                            ).colorScheme.onSurfaceVariant,
                          ),
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
              color: Theme.of(context).colorScheme.onSurfaceVariant,
              size: compact ? 20 : 24,
            ),
          ],
        ],
      ),
    );
  }
}
