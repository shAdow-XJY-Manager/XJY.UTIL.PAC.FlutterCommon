import 'package:flutter/material.dart';

/// A gradient progress bar widget.
///
/// Displays a horizontal progress bar with a colorful gradient fill
/// from red → orange → yellow → green.
///
/// Example:
/// ```dart
/// GradientProgressBar(
///   value: 0.7,  // 70% progress
///   height: 10,
///   borderRadius: BorderRadius.all(Radius.circular(5)),
/// )
/// ```
class GradientProgressBar extends StatelessWidget {
  /// Progress value from 0.0 to 1.0
  final double value;

  /// Height of the progress bar. Defaults to 10.
  final double height;

  /// Border radius of the progress bar. Defaults to 5.
  final BorderRadius borderRadius;

  const GradientProgressBar({
    super.key,
    required this.value,
    this.height = 10,
    this.borderRadius = const BorderRadius.all(Radius.circular(5)),
  });

  @override
  Widget build(BuildContext context) {
    double clampedValue = value.clamp(0.0, 1.0);

    return ClipRRect(
      borderRadius: borderRadius,
      child: Stack(
        children: [
          Container(
            height: height,
            color: Colors.grey.shade800,
          ),
          FractionallySizedBox(
            alignment: Alignment.centerLeft,
            widthFactor: clampedValue,
            child: Container(
              height: height,
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Colors.red,
                    Colors.orange,
                    Colors.yellow,
                    Colors.green,
                  ],
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
