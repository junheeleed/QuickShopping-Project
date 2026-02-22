import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quick_shopping/presentation/home/widget/home_banner_carousel.dart';
import 'package:quick_shopping/presentation/home/widget/home_skeleton.dart';
import '../../app/routes/app_routes.dart';
import '../widgets/app_card.dart';
import 'home_controller.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

// TODO 카테고리 관련 로직은 제거하기
class _HomePageState extends State<HomePage> with SingleTickerProviderStateMixin {
  late final HomeController controller = Get.find<HomeController>();
  late final TabController _tab;

  static const Color _tabPurple = Color(0xFF7B61FF);

  @override
  void initState() {
    super.initState();
    _tab = TabController(length: 2, vsync: this);

    _tab.addListener(() {
      if (_tab.indexIsChanging) return;
      controller.onTopTabChanged(_tab.index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            pinned: true,
            backgroundColor: Colors.white,
            elevation: 0,
            titleSpacing: 16,
            title: Row(
              children: [
                RichText(
                  text: const TextSpan(
                    style: TextStyle(fontSize: 22, fontWeight: FontWeight.w900, height: 1.0),
                    children: [
                      TextSpan(text: '퀵', style: TextStyle(color: Color(0xFF2DB400))),
                      TextSpan(text: '쇼핑', style: TextStyle(color: _tabPurple)),
                    ],
                  ),
                ),
              ],
            ),
            actions: [
              IconButton(onPressed: () {}, icon: const Icon(Icons.notifications_none, color: Colors.black87)),
              IconButton(onPressed: () {}, icon: const Icon(Icons.shopping_bag_outlined, color: Colors.black87)),
              const SizedBox(width: 6),
            ],
          ),

          SliverToBoxAdapter(
            child: Obx(() {
              if (controller.isLoading.value) {
                return const HomeSkeleton(onlyGrid: false);
              }

              return Container(
                color: Colors.white,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    HomeBannerCarousel(),
                    const SizedBox(height: 12),

                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 16),
                      child: Text(
                        '주목할 만한 상품',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w900,
                          color: Colors.black,
                          height: 1.1,
                        ),
                      ),
                    ),
                    const SizedBox(height: 10),

                    Obx(() {
                      final loading = controller.isLoading.value;
                      if (loading) {
                        return const HomeSkeleton(onlyGrid: true);
                      }

                      final list = controller.products;

                      const double tileHeight = 170;
                      const double crossSpacing = 12;
                      const EdgeInsets gridPadding = EdgeInsets.fromLTRB(12, 8, 12, 12);

                      final double gridHeight =
                          tileHeight * 2 + crossSpacing + gridPadding.vertical;

                      return SizedBox(
                        height: gridHeight,
                        child: GridView.builder(
                          padding: gridPadding,
                          scrollDirection: Axis.horizontal,
                          physics: const BouncingScrollPhysics(),
                          primary: false,
                          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            mainAxisSpacing: 12,
                            crossAxisSpacing: 12,
                            childAspectRatio: 1.30,
                          ),
                          itemCount: list.length,
                          itemBuilder: (context, i) {
                            final app = list[i];
                            return AppCard(
                              app: app,
                              compact: true,
                              onTap: () => Get.toNamed('${Routes.detail}/${app.id}'),
                            );
                          },
                        ),
                      );
                    }),
                  ],
                ),
              );
            }),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _tab.dispose();
    super.dispose();
  }
}
