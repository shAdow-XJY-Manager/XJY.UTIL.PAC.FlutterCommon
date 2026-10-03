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
    final clampedValue = value.isFinite ? value.clamp(0.0, 1.0) : 0.0;

    return Semantics(
      label: '进度',
      value: '${(clampedValue * 100).round()}%',
      child: ClipRRect(
        borderRadius: borderRadius,
        child: Stack(
          children: [
            Container(
              height: height,
              color: Theme.of(context).colorScheme.surfaceContainerHighest,
            ),
            FractionallySizedBox(
              alignment: Alignment.centerLeft,
              widthFactor: clampedValue,
              child: Container(
                height: height,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      Theme.of(context).colorScheme.secondary,
                      Theme.of(context).colorScheme.primary,
                    ],
                    begin: Alignment.centerLeft,
                    end: Alignment.centerRight,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
