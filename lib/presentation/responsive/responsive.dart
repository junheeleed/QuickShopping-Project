import 'package:flutter/material.dart';

enum ScreenSize { compact, medium, expanded }

class ResponsiveLayout {
  static ScreenSize size(BuildContext context) {
    final w = MediaQuery.sizeOf(context).width;
    if (w < 600) return ScreenSize.compact;
    if (w < 1024) return ScreenSize.medium;
    return ScreenSize.expanded;
  }

  static bool isCompact(BuildContext context) => size(context) == ScreenSize.compact;
  static bool isMedium(BuildContext context) => size(context) == ScreenSize.medium;
  static bool isExpanded(BuildContext context) => size(context) == ScreenSize.expanded;

  static double pagePadding(BuildContext context) {
    switch (size(context)) {
      case ScreenSize.compact:
        return 16;
      case ScreenSize.medium:
        return 20;
      case ScreenSize.expanded:
        return 24;
    }
  }

  static double gridPadding(BuildContext context) {
    switch (size(context)) {
      case ScreenSize.compact:
        return 12;
      case ScreenSize.medium:
        return 20;
      case ScreenSize.expanded:
        return 24;
    }
  }

  static double gridSpacing(BuildContext context) {
    switch (size(context)) {
      case ScreenSize.compact:
        return 12;
      case ScreenSize.medium:
        return 14;
      case ScreenSize.expanded:
        return 16;
    }
  }

  static double maxContentWidth(BuildContext context) {
    switch (size(context)) {
      case ScreenSize.compact:
        return double.infinity;
      case ScreenSize.medium:
        return 960;
      case ScreenSize.expanded:
        return 1200;
    }
  }

  static int autoGridCount(
      BuildContext context, {
        required double width,
        double minItemWidth = 200,
        int min = 2,
        int max = 4,
      }) {
    final spacing = gridSpacing(context);
    final count = ((width + spacing) / (minItemWidth + spacing)).floor();
    if (count < min) return min;
    if (count > max) return max;
    return count;
  }

  static double productCardAspectRatio(int count) {
    if (count >= 4) return 0.88;
    if (count == 3) return 0.92;
    return 0.98;
  }
}

class ResponsiveContent extends StatelessWidget {
  final Widget child;
  const ResponsiveContent({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    final maxW = ResponsiveLayout.maxContentWidth(context);
    if (maxW == double.infinity) return child;

    return Center(
      child: ConstrainedBox(
        constraints: BoxConstraints(maxWidth: maxW),
        child: child,
      ),
    );
  }
}