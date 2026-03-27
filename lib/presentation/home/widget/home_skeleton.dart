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

    // 라이트/다크에서 스켈레톤 톤이 달라야 자연스러움
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
                height: ResponsiveLayout.isCompact(context) ? 200 : 220,
                radius: radius.card,
                color: colors.surface,
              ),
            ),
            SizedBox(height: spacing.sectionGap),
          ],

          Padding(
            padding: EdgeInsets.fromLTRB(gridPadX, 0, gridPadX, spacing.itemGap),
            child: Row(
              children: [
                _box(width: 140, height: 18, radius: 6, color: colors.surface),
                const Spacer(),
                _box(width: 40, height: 14, radius: 6, color: colors.surface),
              ],
            ),
          ),

          Padding(
            padding: EdgeInsets.symmetric(horizontal: gridPadX),
            child: SizedBox(
              height: _gridHeight(),
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

  static double _gridHeight() {
    const tileHeight = 150.0;
    const crossSpacing = 12.0;
    const paddingVertical = 8.0 + 12.0;
    return tileHeight * 2 + crossSpacing + paddingVertical;
  }

  Widget _skeletonCard(BuildContext context) {
    final colors = context.colors;
    final spacing = context.spacing;
    final radius = context.radius;

    final img = ResponsiveLayout.isCompact(context) ? 63.0 : 72.0;

    return _box(
      radius: radius.card,
      color: colors.surface,
      child: Padding(
        padding: EdgeInsets.all(spacing.itemGap + 4),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _box(width: img, height: img, radius: radius.image, color: colors.surface),
            SizedBox(height: spacing.itemGap + 4),
            _box(width: double.infinity, height: 16, radius: 6, color: colors.surface),
            SizedBox(height: spacing.itemGap),
            _box(width: 90, height: 14, radius: 6, color: colors.surface),

            Expanded(child: SizedBox(height: spacing.itemGap)),

            Align(
              alignment: Alignment.bottomLeft,
              child: _box(width: 60, height: 12, radius: 6, color: colors.surface),
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