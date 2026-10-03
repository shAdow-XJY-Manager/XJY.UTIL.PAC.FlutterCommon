import 'dart:ui';
import 'package:flutter/material.dart';

/// Clear Material surface; optional blur remains available for glass accents.
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
    this.enableBlur = false,
    this.enableHoverEffect = true,
    this.backgroundColor,
    this.borderRadius = 8,
    this.border,
  });
  @override
  State<BaseCard> createState() => _BaseCardState();
}

class _BaseCardState extends State<BaseCard> {
  bool _hovered = false;
  bool _focused = false;
  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;
    final active = _focused || (_hovered && widget.enableHoverEffect);
    final radius = BorderRadius.circular(widget.borderRadius);
    Widget content = Material(
      color:
          widget.backgroundColor ??
          (widget.enableBlur
              ? scheme.surface.withValues(alpha: .85)
              : scheme.surface),
      shape: RoundedRectangleBorder(borderRadius: radius),
      clipBehavior: Clip.antiAlias,
      child: Ink(
        decoration: BoxDecoration(
          borderRadius: radius,
          border:
              widget.border ??
              Border.all(
                color: active ? scheme.primary : scheme.outline,
                width: _focused ? 2 : 1,
              ),
        ),
        child: InkWell(
          onTap: widget.onTap,
          canRequestFocus: widget.onTap != null,
          onHover: (value) => setState(() => _hovered = value),
          onFocusChange: (value) => setState(() => _focused = value),
          borderRadius: radius,
          child: Padding(
            padding: widget.padding ?? const EdgeInsets.all(16),
            child: widget.child,
          ),
        ),
      ),
    );
    if (widget.enableBlur)
      content = ClipRRect(
        borderRadius: radius,
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
          child: content,
        ),
      );
    return Container(
      width: widget.width,
      height: widget.height,
      margin: widget.margin,
      child: content,
    );
  }
}
