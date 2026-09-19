import 'package:flutter/material.dart';
import '../../theme/app_colors.dart';
import '../../theme/app_text_styles.dart';
import 'base_card.dart';

/// Game card component with scale animation and special styling.
///
/// Features:
/// - Game cover image
/// - Title
/// - Optional tag (Repository/Website)
/// - Scale animation on hover
class GameCard extends StatefulWidget {
  final String? imageUrl;
  final ImageProvider? imageProvider;
  final String title;
  final String? tag;
  final VoidCallback? onTap;
  final double? width;
  final double? height;
  
  const GameCard({
    super.key,
    this.imageUrl,
    this.imageProvider,
    required this.title,
    this.tag,
    this.onTap,
    this.width,
    this.height,
  });
  
  @override
  State<GameCard> createState() => _GameCardState();
}

class _GameCardState extends State<GameCard> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _scaleAnimation;
  bool _isHovered = false;
  
  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 200),
      vsync: this,
    );
    _scaleAnimation = Tween<double>(begin: 1.0, end: 1.05).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeOut),
    );
  }
  
  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
  
  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) {
        setState(() => _isHovered = true);
        _controller.forward();
      },
      onExit: (_) {
        setState(() => _isHovered = false);
        _controller.reverse();
      },
      child: AnimatedBuilder(
        animation: _scaleAnimation,
        builder: (context, child) {
          return Transform.scale(
            scale: _scaleAnimation.value,
            child: child,
          );
        },
        child: BaseCard(
          width: widget.width,
          height: widget.height,
          padding: EdgeInsets.zero,
          onTap: widget.onTap,
          enableHoverEffect: false, // We handle hover animation ourselves
          child: Stack(
            children: [
              // Game image
              Positioned.fill(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: _buildGameImage(),
                ),
              ),
              
              // Gradient overlay
              Positioned.fill(
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        Colors.transparent,
                        Colors.black.withOpacity(0.7),
                      ],
                      stops: const [0.5, 1.0],
                    ),
                  ),
                ),
              ),
              
              // Title and tag
              Positioned(
                left: 12,
                right: 12,
                bottom: 12,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      widget.title,
                      style: AppTextStyles.titleMedium.copyWith(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    if (widget.tag != null) ...[
                      const SizedBox(height: 6),
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 8,
                          vertical: 4,
                        ),
                        decoration: BoxDecoration(
                          color: _getTagColor(),
                          borderRadius: BorderRadius.circular(4),
                        ),
                        child: Text(
                          widget.tag!,
                          style: AppTextStyles.labelSmall.copyWith(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ],
                ),
              ),
              
              // Hover border effect
              if (_isHovered)
                Positioned.fill(
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(
                        color: siteAccent,
                        width: 2,
                      ),
                    ),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
  
  Widget _buildGameImage() {
    if (widget.imageProvider != null) {
      return Image(
        image: widget.imageProvider!,
        fit: BoxFit.cover,
        errorBuilder: (context, error, stackTrace) => _buildFallback(),
      );
    } else if (widget.imageUrl != null) {
      return Image.network(
        widget.imageUrl!,
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
          Icons.videogame_asset,
          size: 64,
          color: textTertiary,
        ),
      ),
    );
  }
  
  Color _getTagColor() {
    if (widget.tag == null) return siteAccent;
    
    switch (widget.tag!.toLowerCase()) {
      case 'repository':
        return const Color(0xFF4CAF50);
      case 'website':
        return const Color(0xFF2196F3);
      default:
        return siteAccent;
    }
  }
}
