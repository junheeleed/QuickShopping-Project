import 'dart:async';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quick_shopping/domain/entities/home_banner_entity.dart';
import '../../../domain/usecases/get_banner_once.dart';
import '../../../domain/usecases/upsert_all.dart';
import '../../../domain/usecases/watch_banners.dart';

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
      final list = controller.banners;
      final idx = controller.current.value;
      final total = list.length;

      if (list.isEmpty) return const SizedBox.shrink();

      return Padding(
        padding: const EdgeInsets.fromLTRB(0, 0, 0, 12),
        child: SizedBox(
          height: 200,
          child: Stack(
            children: [
              PageView.builder(
                controller: controller.pageController,
                itemCount: total,
                onPageChanged: controller.setCurrent,
                itemBuilder: (_, i) => _BannerCard(item: list[i]),
              ),

              Positioned(
                right: 14,
                bottom: 14,
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
  const _BannerCard({required this.item});

  @override
  Widget build(BuildContext context) {
    final hasImage = item.imageUrl != null && item.imageUrl!.isNotEmpty;

    return LayoutBuilder(
      builder: (context, constraints) {
        final bannerW = constraints.maxWidth;
        final imageW = hasImage ? (bannerW * 0.36) : 0.0;
        final rightGap = hasImage ? (imageW + 18) : 18.0;

        return Container(
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
                  right: 12,
                  top: 12,
                  bottom: 12,
                  child: SizedBox(
                    width: imageW,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(18),
                      child: Container(
                        // 이미지가 너무 밋밋하면 살짝 유리카드 느낌 배경
                        color: Colors.white.withOpacity(0.12),
                        padding: const EdgeInsets.all(8),
                        child: Image.network(
                          item.imageUrl!,
                          fit: BoxFit.contain,
                          alignment: Alignment.centerRight,
                          errorBuilder: (_, __, ___) => const SizedBox.shrink(),
                        ),
                      ),
                    ),
                  ),
                ),

              Padding(
                padding: EdgeInsets.fromLTRB(18, 18, rightGap, 18),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      item.title,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                        fontSize: 28,
                        fontWeight: FontWeight.w900,
                        color: Colors.white,
                        height: 1.12,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      item.subtitle,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                        color: Colors.white,
                      ),
                    ),
                    const Spacer(),
                  ],
                ),
              ),

              IgnorePointer(
                child: Container(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        Colors.black.withOpacity(0.06),
                        Colors.black.withOpacity(0.02),
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
    return Material(
      color: Colors.black.withOpacity(0.35), // TODO
      borderRadius: BorderRadius.circular(18),
      child: InkWell(
        borderRadius: BorderRadius.circular(18),
        onTap: onToggle,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(
                isPlaying ? Icons.pause : Icons.play_arrow,
                size: 18,
                color: Colors.white,
              ),
              const SizedBox(width: 10),
              Text(
                '$index/$total',
                style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w900,
                  fontSize: 16,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
