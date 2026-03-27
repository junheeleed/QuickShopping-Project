import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quick_shopping/presentation/home/widget/home_banner_carousel.dart';
import 'package:quick_shopping/presentation/home/widget/home_skeleton.dart';
import '../../app/routes/app_routes.dart';
import '../responsive/responsive.dart';
import '../theme/theme_x.dart';
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
    final colors = context.colors;
    final spacing = context.spacing;

    final padX = spacing.pagePaddingX;
    final gridPadX = spacing.pagePaddingX;
    final gridSpacing = spacing.gridSpacing;

    return Scaffold(
      backgroundColor: colors.background,
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            pinned: true,
            backgroundColor: colors.background,
            surfaceTintColor: colors.background,
            elevation: 0,
            scrolledUnderElevation: 0,
            titleSpacing: padX,
            toolbarHeight: ResponsiveLayout.appBarHeight(context),
            title: Row(
              children: [
                RichText(
                  text: TextSpan(
                    style: TextStyle(
                      fontSize: ResponsiveLayout.isCompact(context) ? 22 : 24,
                      fontWeight: FontWeight.w900,
                      height: 1.0,
                      color: colors.textPrimary,
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
                visualDensity: VisualDensity.compact,
                icon: Icon(Icons.notifications_none, color: colors.textPrimary),
              ),
              IconButton(
                onPressed: () {},
                visualDensity: VisualDensity.compact,
                icon: Icon(Icons.shopping_bag_outlined, color: colors.textPrimary),
              ),
              SizedBox(width: spacing.itemGap),
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
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const HomeBannerCarousel(),
                    SizedBox(height: spacing.sectionGap),

                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: padX),
                      child: Text(
                        '주목할 만한 상품',
                        style: context.text.titleMedium?.copyWith(
                          fontWeight: FontWeight.w900,
                          color: colors.textPrimary,
                          height: 1.1,
                        ),
                      ),
                    ),
                    SizedBox(height: spacing.itemGap),

                    Obx(() {
                      if (controller.isLoading.value) {
                        return const HomeSkeleton(onlyGrid: true);
                      }

                      final list = controller.products;

                      // 폰: 기존 UX 유지(가로 스크롤 + 2행)
                      if (ResponsiveLayout.isCompact(context)) {
                        const double tileHeight = 170;
                        const double crossSpacing = 12;

                        final padding = EdgeInsets.fromLTRB(
                          gridPadX,
                          8,
                          gridPadX,
                          12,
                        );

                        final gridHeight = tileHeight * 2 + crossSpacing + padding.vertical;

                        return SizedBox(
                          height: gridHeight,
                          child: GridView.builder(
                            padding: padding,
                            scrollDirection: Axis.horizontal,
                            physics: const BouncingScrollPhysics(),
                            primary: false,
                            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              mainAxisSpacing: gridSpacing,
                              crossAxisSpacing: gridSpacing,
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
                          gridPadX,
                          8,
                          gridPadX,
                          spacing.sectionGap,
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
                                mainAxisSpacing: gridSpacing,
                                crossAxisSpacing: gridSpacing,
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