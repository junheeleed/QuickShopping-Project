import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

import '../../responsive/responsive.dart';
import '../../theme/theme_x.dart';

class HomeSkeleton extends StatelessWidget {
  const HomeSkeleton({super.key, this.onlyGrid = false});

  final bool onlyGrid;

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final spacing = context.spacing;
    final radius = context.radius;
    final metrics = context.metrics;

    final base = colors.border.withValues(alpha: 0.9);
    final highlight = colors.surfaceAlt.withValues(alpha: 0.9);
    final gridPadX = spacing.pagePaddingX;

    return Shimmer.fromColors(
      baseColor: base,
      highlightColor: highlight,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          if (!onlyGrid) ...[
            SizedBox(height: spacing.sectionGap),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: gridPadX),
              child: _box(
                height: metrics.bannerHeight,
                radius: radius.card,
                color: colors.surface,
              ),
            ),
            SizedBox(height: spacing.sectionGap),
          ],
          Padding(
            padding: EdgeInsets.fromLTRB(
              gridPadX,
              0,
              gridPadX,
              spacing.itemGap,
            ),
            child: Row(
              children: [
                _box(
                  width: ResponsiveLayout.isCompact(context) ? 140 : 180,
                  height: 18,
                  radius: 6,
                  color: colors.surface,
                ),
                const Spacer(),
                _box(
                  width: ResponsiveLayout.isCompact(context) ? 40 : 52,
                  height: 14,
                  radius: 6,
                  color: colors.surface,
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: gridPadX),
            child: SizedBox(
              height: _gridHeight(context),
              child: GridView.builder(
                padding: EdgeInsets.only(bottom: spacing.sectionGap),
                scrollDirection: Axis.horizontal,
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: spacing.gridSpacing,
                  crossAxisSpacing: spacing.gridSpacing,
                  childAspectRatio: 1.30,
                ),
                itemCount: 6,
                itemBuilder: (_, __) => _skeletonCard(context),
              ),
            ),
          ),
        ],
      ),
    );
  }

  double _gridHeight(BuildContext context) {
    final spacing = context.spacing;
    final metrics = context.metrics;

    return metrics.homeCompactGridTileHeight * 2 +
        spacing.gridSpacing +
        spacing.itemGap +
        spacing.sectionGap;
  }

  Widget _skeletonCard(BuildContext context) {
    final colors = context.colors;
    final spacing = context.spacing;
    final radius = context.radius;
    final metrics = context.metrics;

    return _box(
      radius: radius.card,
      color: colors.surface,
      child: Padding(
        padding: EdgeInsets.all(spacing.itemGap + 4),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _box(
              width: metrics.homeSkeletonImageSize,
              height: metrics.homeSkeletonImageSize,
              radius: radius.image,
              color: colors.surface,
            ),
            SizedBox(height: spacing.itemGap + 4),
            _box(
              width: double.infinity,
              height: 16,
              radius: 6,
              color: colors.surface,
            ),
            SizedBox(height: spacing.itemGap),
            _box(
              width: 90,
              height: 14,
              radius: 6,
              color: colors.surface,
            ),
            Expanded(child: SizedBox(height: spacing.itemGap)),
            Align(
              alignment: Alignment.bottomLeft,
              child: _box(
                width: 60,
                height: 12,
                radius: 6,
                color: colors.surface,
              ),
            ),
          ],
        ),
      ),
    );
  }

  static Widget _box({
    double? width,
    double? height,
    double radius = 12,
    required Color color,
    Widget? child,
  }) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(radius),
      ),
      child: child,
    );
  }
}