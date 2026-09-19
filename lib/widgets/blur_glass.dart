import 'dart:ui';
import 'package:flutter/material.dart';

/// A glassmorphism container with backdrop blur effect.
///
/// Creates a translucent container with a frosted glass appearance
/// using [BackdropFilter] with blur effect.
///
/// Example:
/// ```dart
/// BlurGlass(
///   child: Text('Content'),
///   marginValue: 20.0,
///   paddingValue: 16.0,
/// )
/// ```
class BlurGlass extends StatefulWidget {
  /// The widget below this widget in the tree.
  final Widget child;

  /// The margin around the blur container. Defaults to 20.0.
  final double? marginValue;

  /// The padding inside the blur container. Defaults to 20.0.
  final double? paddingValue;

  /// Creates a blur glass container.
  const BlurGlass({
    super.key,
    required this.child,
    this.marginValue,
    this.paddingValue,
  });

  @override
  State<BlurGlass> createState() => _BlurGlassState();
}

class _BlurGlassState extends State<BlurGlass> {
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
        child: Container(
          margin: EdgeInsets.all(widget.marginValue ?? 20.0),
          padding: EdgeInsets.all(widget.paddingValue ?? 20.0),
          decoration: BoxDecoration(
            color: Colors.transparent.withOpacity(0.2),
            borderRadius: BorderRadius.circular(30.0),
          ),
          child: widget.child,
        ),
      ),
    );
  }
}
