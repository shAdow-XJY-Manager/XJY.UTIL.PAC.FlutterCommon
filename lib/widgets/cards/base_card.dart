import 'dart:ui';
import 'package:flutter/material.dart';
import '../../theme/app_colors.dart';

/// Base card component with blur glass effect and consistent styling.
///
/// Provides the foundation for all card types in the design system.
class BaseCard extends StatefulWidget {
  final Widget child;
  final double? width;
  final double? height;
  final EdgeInsetsGeometry? padding;
  final EdgeInsetsGeometry? margin;
  final VoidCallback? onTap;
  final bool enableBlur;
  final bool enableHoverEffect;
  final Color? backgroundColor;
  final double borderRadius;
  final Border? border;
  
  const BaseCard({
    super.key,
    required this.child,
    this.width,
    this.height,
    this.padding,
    this.margin,
    this.onTap,
    this.enableBlur = true,
    this.enableHoverEffect = true,
    this.backgroundColor,
    this.borderRadius = 8.0,
    this.border,
  });
  
  @override
  State<BaseCard> createState() => _BaseCardState();
}

class _BaseCardState extends State<BaseCard> {
  bool _isHovered = false;
  
  @override
  Widget build(BuildContext context) {
    Widget cardContent = Container(
      width: widget.width,
      height: widget.height,
      padding: widget.padding ?? const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: widget.backgroundColor ?? cardBackground.withOpacity(0.8),
        borderRadius: BorderRadius.circular(widget.borderRadius),
        border: widget.border ?? Border.all(
          color: _isHovered && widget.enableHoverEffect 
              ? siteAccent.withOpacity(0.5) 
              : borderColor,
          width: 1,
        ),
        boxShadow: _isHovered && widget.enableHoverEffect
            ? [
                BoxShadow(
                  color: siteAccent.withOpacity(0.2),
                  blurRadius: 12,
                  offset: const Offset(0, 4),
                ),
              ]
            : [
                BoxShadow(
                  color: Colors.black.withOpacity(0.2),
                  blurRadius: 8,
                  offset: const Offset(0, 2),
                ),
              ],
      ),
      child: widget.child,
    );
    
    if (widget.enableBlur) {
      cardContent = ClipRRect(
        borderRadius: BorderRadius.circular(widget.borderRadius),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
          child: cardContent,
        ),
      );
    }
    
    if (widget.onTap != null) {
      cardContent = MouseRegion(
        onEnter: (_) => setState(() => _isHovered = true),
        onExit: (_) => setState(() => _isHovered = false),
        child: InkWell(
          onTap: widget.onTap,
          borderRadius: BorderRadius.circular(widget.borderRadius),
          hoverColor: Colors.transparent,
          splashColor: siteAccent.withOpacity(0.1),
          child: cardContent,
        ),
      );
    } else if (widget.enableHoverEffect) {
      cardContent = MouseRegion(
        onEnter: (_) => setState(() => _isHovered = true),
        onExit: (_) => setState(() => _isHovered = false),
        child: cardContent,
      );
    }
    
    return Container(
      margin: widget.margin,
      child: cardContent,
    );
  }
}
