import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:quick_shopping/presentation/home/widget/home_banner_carousel.dart';
import 'package:quick_shopping/presentation/home/widget/home_skeleton.dart';
import '../../app/routes/app_routes.dart';
import '../responsive/responsive.dart';
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
    final isCompact = ResponsiveLayout.isCompact(context);
    final pagePadding = ResponsiveLayout.pagePadding(context);
    final gridPadding = ResponsiveLayout.gridPadding(context);
    final gridSpacing = ResponsiveLayout.gridSpacing(context);
    final logoFont = isCompact ? 22.sp : 24.sp;
    final sectionTitleFont = isCompact ? 18.sp : 20.sp;
    final appBarHeight = isCompact ? 56.0 : 60.0;
    final iconSize = isCompact ? 22.w : 24.w;

    return Scaffold(
      backgroundColor: Colors.white,
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            pinned: true,
            backgroundColor: Colors.white,
            elevation: 0,
            scrolledUnderElevation: 0,
            titleSpacing: pagePadding.w,
            toolbarHeight: appBarHeight,
            title: Row(
              children: [
                RichText(
                  text: TextSpan(
                    style: TextStyle(
                      fontSize: logoFont,
                      fontWeight: FontWeight.w900,
                      height: 1.0,
                    ),
                    children: const [
                      TextSpan(text: '퀵', style: TextStyle(color: Color(0xFF2DB400))),
                      TextSpan(text: '쇼핑', style: TextStyle(color: _tabPurple)),
                    ],
                  ),
                ),
              ],
            ),
            actions: [
              IconButton(
                onPressed: () {},
                iconSize: iconSize,
                visualDensity: VisualDensity.compact,
                icon: const Icon(Icons.notifications_none, color: Colors.black87),
              ),
              IconButton(
                onPressed: () {},
                iconSize: iconSize,
                visualDensity: VisualDensity.compact,
                icon: const Icon(Icons.shopping_bag_outlined, color: Colors.black87),
              ),
              SizedBox(width: (isCompact ? 6 : 8).w),
            ],
          ),

          SliverToBoxAdapter(
            child: Obx(() {
              if (controller.isLoading.value) {
                return const ResponsiveContent(
                  child: HomeSkeleton(onlyGrid: false),
                );
              }

              return ResponsiveContent(
                child: Container(
                  color: Colors.white,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const HomeBannerCarousel(),
                      SizedBox(height: 12.h),

                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: pagePadding.w),
                        child: Text(
                          '주목할 만한 상품',
                          style: TextStyle(
                            fontSize: sectionTitleFont,
                            fontWeight: FontWeight.w900,
                            color: Colors.black,
                            height: 1.1,
                          ),
                        ),
                      ),
                      SizedBox(height: 10.h),

                      Obx(() {
                        if (controller.isLoading.value) {
                          return const HomeSkeleton(onlyGrid: true);
                        }

                        final list = controller.products;

                        if (isCompact) {
                          final tileHeight = 170.h;
                          final crossSpacing = 12.w;

                          final padding = EdgeInsets.fromLTRB(
                            gridPadding.w,
                            8.h,
                            gridPadding.w,
                            12.h,
                          );

                          final gridHeight =
                              tileHeight * 2 + crossSpacing + padding.vertical;

                          return SizedBox(
                            height: gridHeight,
                            child: GridView.builder(
                              padding: padding,
                              scrollDirection: Axis.horizontal,
                              physics: const BouncingScrollPhysics(),
                              primary: false,
                              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2,
                                mainAxisSpacing: 12.w,
                                crossAxisSpacing: 12.w,
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
                        }

                        return Padding(
                          padding: EdgeInsets.fromLTRB(
                            gridPadding.w,
                            8.h,
                            gridPadding.w,
                            16.h,
                          ),
                          child: LayoutBuilder(
                            builder: (context, constraints) {
                              final count = ResponsiveLayout.autoGridCount(
                                context,
                                width: constraints.maxWidth,
                                minItemWidth: ResponsiveLayout.isExpanded(context) ? 220 : 200,
                                min: 2,
                                max: 4,
                              );

                              final aspect = ResponsiveLayout.productCardAspectRatio(count);
                              return GridView.builder(
                                shrinkWrap: true,
                                primary: false,
                                physics: const NeverScrollableScrollPhysics(),
                                itemCount: list.length,
                                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: count,
                                  mainAxisSpacing: gridSpacing.w,
                                  crossAxisSpacing: gridSpacing.w,
                                  childAspectRatio: aspect,
                                ),
                                itemBuilder: (context, i) {
                                  final app = list[i];
                                  return AppCard(
                                    app: app,
                                    compact: false,
                                    onTap: () => Get.toNamed('${Routes.detail}/${app.id}'),
                                  );
                                },
                              );
                            },
                          ),
                        );
                      }),
                    ],
                  ),
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
