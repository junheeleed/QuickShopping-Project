import 'dart:async';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../app/routes/app_routes.dart';
import '../../../domain/entities/home_banner_entity.dart';
import '../../../domain/usecases/banner/get_banner_once.dart';
import '../../../domain/usecases/banner/insert_banner_all.dart';
import '../../../domain/usecases/banner/watch_banners.dart';
import '../../responsive/responsive.dart';
import '../../theme/theme_x.dart';

class HomeBannerItem {
  final int id;
  final String title;
  final String subtitle;
  final String targetUrl;
  final String? imageUrl;
  final List<Color> gradient;

  const HomeBannerItem({
    required this.id,
    required this.title,
    required this.subtitle,
    required this.targetUrl,
    required this.gradient,
    this.imageUrl,
  });
}

class HomeBannerController extends GetxController {
  HomeBannerController({
    required this.getBannerOnce,
    required this.insertBannerAll,
    required this.watchBanners,
  });

  final GetBannerOnce getBannerOnce;
  final InsertBannerAll insertBannerAll;
  final WatchBanners watchBanners;

  final pageController = PageController();
  final current = 0.obs;
  final isPlaying = true.obs;
  final banners = <HomeBannerItem>[].obs;

  StreamSubscription? _sub;
  Timer? _timer;

  @override
  void onInit() {
    super.onInit();
    _bindLocal();
    _startAuto();
  }

  void _bindLocal() async {
    final existing = await getBannerOnce();
    if (existing.isEmpty) {
      await insertBannerAll();
    }

    _sub?.cancel();
    _sub = watchBanners().listen((rows) {
      banners.assignAll(rows.map(_mapRow).toList());
    });
  }

  HomeBannerItem _mapRow(HomeBannerEntity row) {
    return HomeBannerItem(
      id: row.id,
      title: row.title,
      subtitle: row.subtitle,
      targetUrl: row.targetUrl,
      imageUrl: row.imageUrl,
      gradient: [Color(row.gradA), Color(row.gradB)],
    );
  }

  void _startAuto() {
    _timer?.cancel();
    _timer = Timer.periodic(const Duration(seconds: 4), (_) {
      if (!isPlaying.value) return;
      if (!pageController.hasClients) return;

      final total = banners.length;
      if (total <= 1) return;

      final next = (current.value + 1) % total;
      pageController.animateToPage(
        next,
        duration: const Duration(milliseconds: 350),
        curve: Curves.easeOut,
      );
    });
  }

  void setCurrent(int i) => current.value = i;
  void togglePlay() => isPlaying.value = !isPlaying.value;

  void goProductDetail(int id) => Get.toNamed('${Routes.detail}/$id');

  @override
  void onClose() {
    _sub?.cancel();
    _timer?.cancel();
    pageController.dispose();
    super.onClose();
  }
}

class HomeBannerCarousel extends StatelessWidget {
  const HomeBannerCarousel({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<HomeBannerController>();

    return Obx(() {
      final spacing = context.spacing;
      final metrics = context.metrics;
      final list = controller.banners;
      final idx = controller.current.value;
      final total = list.length;

      if (list.isEmpty) return const SizedBox.shrink();

      return Padding(
        padding: EdgeInsets.only(bottom: spacing.sectionGap),
        child: SizedBox(
          height: metrics.bannerHeight,
          child: Stack(
            children: [
              PageView.builder(
                controller: controller.pageController,
                itemCount: total,
                onPageChanged: controller.setCurrent,
                itemBuilder: (_, i) => _BannerCard(
                  item: list[i],
                  onTap: (id) => controller.goProductDetail(id),
                ),
              ),
              Positioned(
                right: spacing.cardPadding,
                bottom: spacing.cardPadding,
                child: _PagePill(
                  index: idx + 1,
                  total: total,
                  isPlaying: controller.isPlaying.value,
                  onToggle: controller.togglePlay,
                ),
              ),
            ],
          ),
        ),
      );
    });
  }
}

class _BannerCard extends StatelessWidget {
  final HomeBannerItem item;
  final Function(int id) onTap;

  const _BannerCard({
    required this.item,
    required this.onTap
  });

  @override
  Widget build(BuildContext context) {
    final spacing = context.spacing;
    final type = context.text;
    final metrics = context.metrics;

    final hasImage = item.imageUrl != null && item.imageUrl!.isNotEmpty;

    return LayoutBuilder(
      builder: (context, constraints) {
        final bannerW = constraints.maxWidth;
        final imageFraction = ResponsiveLayout.isExpanded(context) ? 0.34 : 0.36;
        final imageW = hasImage ? bannerW * imageFraction : 0.0;
        final rightGap =
        hasImage ? (imageW + spacing.cardPadding) : spacing.cardPadding;

        return GestureDetector(
          onTap: () {
            onTap(item.id);
          },
          child: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: item.gradient,
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
              ),
            ),
            child: Stack(
              fit: StackFit.expand,
              children: [
                if (hasImage)
                  Positioned(
                    right: spacing.itemGap,
                    top: spacing.itemGap,
                    bottom: spacing.itemGap,
                    child: SizedBox(
                      width: imageW,
                      child: Container(
                        padding: EdgeInsets.all(spacing.itemGap),
                        child: Image.network(
                          item.imageUrl!,
                          fit: BoxFit.contain,
                          alignment: Alignment.centerRight,
                          errorBuilder: (_, __, ___) =>
                          const SizedBox.shrink(),
                        ),
                      ),
                    ),
                  ),
                Padding(
                  padding: EdgeInsets.fromLTRB(
                    spacing.cardPadding,
                    spacing.cardPadding,
                    rightGap,
                    spacing.cardPadding,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        item.title,
                        maxLines: ResponsiveLayout.isCompact(context) ? 2 : 3,
                        overflow: TextOverflow.ellipsis,
                        style: type.titleLarge?.copyWith(
                          color: Colors.white,
                          fontWeight: FontWeight.w900,
                          fontSize: metrics.bannerTitle,
                          height: 1.12,
                        ),
                      ),
                      SizedBox(height: spacing.itemGap / 2),
                      Text(
                        item.subtitle,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: type.bodyMedium?.copyWith(
                          color: Colors.white,
                          fontWeight: FontWeight.w700,
                          fontSize: metrics.bannerSubtitle,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

class _PagePill extends StatelessWidget {
  final int index;
  final int total;
  final bool isPlaying;
  final VoidCallback onToggle;

  const _PagePill({
    required this.index,
    required this.total,
    required this.isPlaying,
    required this.onToggle,
  });

  @override
  Widget build(BuildContext context) {
    final spacing = context.spacing;
    final radius = context.radius;
    final type = context.text;
    final metrics = context.metrics;

    return Material(
      color: Colors.black.withValues(alpha: 0.35),
      borderRadius: BorderRadius.circular(radius.button),
      child: InkWell(
        borderRadius: BorderRadius.circular(radius.button),
        onTap: onToggle,
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: metrics.badgeHorizontalPadding,
            vertical: metrics.badgeVerticalPadding,
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(
                isPlaying ? Icons.pause : Icons.play_arrow,
                size: metrics.smallIcon,
                color: Colors.white,
              ),
              SizedBox(width: spacing.itemGap),
              Text(
                '$index/$total',
                style: type.bodySmall?.copyWith(
                  color: Colors.white,
                  fontWeight: FontWeight.w900,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}