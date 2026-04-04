import 'package:flutter/material.dart';

enum ScreenSize {
  compact,
  medium,
  expanded,
}

class AppBreakpoints {
  static const double compact = 600;
  static const double medium = 840;
}

class ResponsiveLayout {
  static ScreenSize screenSizeOf(BuildContext context) {
    final width = MediaQuery.sizeOf(context).width;

    if (width < AppBreakpoints.compact) return ScreenSize.compact;
    if (width < AppBreakpoints.medium) return ScreenSize.medium;
    return ScreenSize.expanded;
  }

  static bool isCompact(BuildContext context) =>
      screenSizeOf(context) == ScreenSize.compact;

  static bool isMedium(BuildContext context) =>
      screenSizeOf(context) == ScreenSize.medium;

  static bool isExpanded(BuildContext context) =>
      screenSizeOf(context) == ScreenSize.expanded;

  static bool useRail(BuildContext context) =>
      MediaQuery.sizeOf(context).width >= AppBreakpoints.compact;

  static double appBarHeight(BuildContext context) {
    switch (screenSizeOf(context)) {
      case ScreenSize.compact:
        return 56;
      case ScreenSize.medium:
        return 60;
      case ScreenSize.expanded:
        return 64;
    }
  }

  static double contentMaxWidth(BuildContext context) {
    final width = MediaQuery.sizeOf(context).width;
    if (width >= 1400) return 1280;
    if (width >= 1100) return 1100;
    if (width >= 840) return 960;
    return width;
  }

  static int autoGridCount(
      BuildContext context, {
        required double width,
        double minItemWidth = 220,
        int min = 2,
        int max = 6,
      }) {
    return (width / minItemWidth).floor().clamp(min, max);
  }

  static double productCardAspectRatio(int count) {
    if (count >= 5) return 0.78;
    if (count == 4) return 0.82;
    if (count == 3) return 0.88;
    return 0.95;
  }
}

class ResponsiveContent extends StatelessWidget {
  final Widget child;

  const ResponsiveContent({
    super.key,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    final maxWidth = ResponsiveLayout.contentMaxWidth(context);

    return Center(
      child: ConstrainedBox(
        constraints: BoxConstraints(maxWidth: maxWidth),
        child: child,
      ),
    );
  }
}