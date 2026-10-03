import 'package:flutter/material.dart';

/// Responsive grid layout that adapts columns based on screen size.
///
/// Automatically adjusts column count:
/// - Mobile: 1-2 columns
/// - Tablet: 3-4 columns
/// - Desktop: 4-6 columns
class ResponsiveGridLayout extends StatelessWidget {
  final List<Widget> children;
  final double childAspectRatio;
  final double spacing;
  final double runSpacing;
  final EdgeInsetsGeometry? padding;
  final int? mobileColumns;
  final int? tabletColumns;
  final int? desktopColumns;

  const ResponsiveGridLayout({
    super.key,
    required this.children,
    this.childAspectRatio = 0.75,
    this.spacing = 16,
    this.runSpacing = 16,
    this.padding,
    this.mobileColumns,
    this.tabletColumns,
    this.desktopColumns,
  });

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final scale = MediaQuery.textScalerOf(context).scale(16) / 16;
        final int columns = _getColumnCount(
          constraints.maxWidth / scale.clamp(1.0, 2.0),
        ).clamp(1, 6);

        return GridView.builder(
          padding: padding ?? const EdgeInsets.all(16),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: columns,
            crossAxisSpacing: spacing,
            mainAxisSpacing: runSpacing,
            childAspectRatio: childAspectRatio > 0 ? childAspectRatio : .75,
          ),
          itemCount: children.length,
          itemBuilder: (context, index) => children[index],
        );
      },
    );
  }

  int _getColumnCount(double width) {
    if (width >= 1200) {
      return desktopColumns ?? 5;
    } else if (width >= 900) {
      return desktopColumns ?? 4;
    } else if (width >= 600) {
      return tabletColumns ?? 3;
    } else if (width >= 400) {
      return mobileColumns ?? 2;
    } else {
      return 1;
    }
  }
}

/// Responsive list layout with consistent spacing.
class ResponsiveListLayout extends StatelessWidget {
  final List<Widget> children;
  final double spacing;
  final EdgeInsetsGeometry? padding;
  final bool shrinkWrap;
  final ScrollPhysics? physics;

  const ResponsiveListLayout({
    super.key,
    required this.children,
    this.spacing = 12,
    this.padding,
    this.shrinkWrap = false,
    this.physics,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      padding: padding ?? const EdgeInsets.all(16),
      shrinkWrap: shrinkWrap,
      physics: physics,
      itemCount: children.length,
      separatorBuilder: (context, index) => SizedBox(height: spacing),
      itemBuilder: (context, index) => children[index],
    );
  }
}
