import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quick_shopping/presentation/home/widget/home_banner_carousel.dart';
import 'package:quick_shopping/presentation/home/widget/home_skeleton.dart';

import '../../app/routes/app_routes.dart';
import '../responsive/responsive.dart';
import '../theme/theme_x.dart';
import '../widgets/app_card.dart';
import 'home_controller.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  static const Color _tabPurple = Color(0xFF7B61FF);

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<HomeController>();
    final colors = context.colors;
    final spacing = context.spacing;
    final metrics = context.metrics;

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
            title: RichText(
              text: TextSpan(
                style: TextStyle(
                  fontSize: metrics.homeBrandTitle,
                  fontWeight: FontWeight.w900,
                  height: 1.0,
                  color: colors.textPrimary,
                ),
                children: const [
                  TextSpan(
                    text: '퀵',
                    style: TextStyle(color: Color(0xFF2DB400)),
                  ),
                  TextSpan(
                    text: '쇼핑',
                    style: TextStyle(color: _tabPurple),
                  ),
                ],
              ),
            ),
            actions: [
              IconButton(
                onPressed: () {},
                visualDensity: VisualDensity.compact,
                icon: Icon(
                  Icons.notifications_none,
                  color: colors.textPrimary,
                  size: metrics.mediumIcon,
                ),
              ),
              IconButton(
                onPressed: () {},
                visualDensity: VisualDensity.compact,
                icon: Icon(
                  Icons.shopping_bag_outlined,
                  color: colors.textPrimary,
                  size: metrics.mediumIcon,
                ),
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

                      if (ResponsiveLayout.isCompact(context)) {
                        final tileHeight = metrics.homeCompactGridTileHeight;

                        final padding = EdgeInsets.fromLTRB(
                          gridPadX,
                          spacing.itemGap,
                          gridPadX,
                          spacing.sectionGap,
                        );

                        final gridHeight = tileHeight * 2 +
                            gridSpacing +
                            padding.vertical;

                        return SizedBox(
                          height: gridHeight,
                          child: GridView.builder(
                            padding: padding,
                            scrollDirection: Axis.horizontal,
                            physics: const BouncingScrollPhysics(),
                            primary: false,
                            gridDelegate:
                            SliverGridDelegateWithFixedCrossAxisCount(
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
                                onTap: () =>
                                    Get.toNamed('${Routes.detail}/${app.id}'),
                              );
                            },
                          ),
                        );
                      }

                      return Padding(
                        padding: EdgeInsets.fromLTRB(
                          gridPadX,
                          spacing.itemGap,
                          gridPadX,
                          spacing.sectionGap,
                        ),
                        child: LayoutBuilder(
                          builder: (context, constraints) {
                            final count = ResponsiveLayout.autoGridCount(
                              context,
                              width: constraints.maxWidth,
                              minItemWidth:
                              ResponsiveLayout.isExpanded(context)
                                  ? 220
                                  : 200,
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
}