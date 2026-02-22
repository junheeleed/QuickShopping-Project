import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class HomeSkeleton extends StatelessWidget {
  const HomeSkeleton({super.key, this.onlyGrid = false});

  final bool onlyGrid;

  @override
  Widget build(BuildContext context) {
    final base = Colors.grey.shade300;
    final highlight = Colors.grey.shade100;

    return Shimmer.fromColors(
      baseColor: base,
      highlightColor: highlight,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          if (!onlyGrid) ...[
            const SizedBox(height: 12),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              child: _box(height: 200, radius: 18),
            ),
            const SizedBox(height: 16),
          ],

          Padding(
            padding: const EdgeInsets.fromLTRB(12, 0, 12, 10),
            child: Row(
              children: [
                _box(width: 140, height: 18, radius: 6),
                const Spacer(),
                _box(width: 40, height: 14, radius: 6),
              ],
            ),
          ),

          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            child: SizedBox(
              height: _gridHeight(),
              child: GridView.builder(
                padding: const EdgeInsets.only(bottom: 12),
                scrollDirection: Axis.horizontal,
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 12,
                  crossAxisSpacing: 12,
                  childAspectRatio: 1.30,
                ),
                itemCount: 6,
                itemBuilder: (_, __) => _skeletonCard(),
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

  Widget _skeletonCard() {
    return _box(
      radius: 16,
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _box(width: 63, height: 63, radius: 20),
            const SizedBox(height: 10),
            _box(width: double.infinity, height: 16, radius: 6),
            const SizedBox(height: 8),
            _box(width: 90, height: 14, radius: 6),
            const Spacer(),
            _box(width: 60, height: 12, radius: 6),
          ],
        ),
      ),
    );
  }

  static Widget _box({
    double? width,
    double? height,
    double radius = 12,
    Widget? child,
  }) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(radius),
      ),
      child: child,
    );
  }
}
