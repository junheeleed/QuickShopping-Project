import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../home/home_page.dart';
import '../my/my_page.dart';
import '../responsive/responsive.dart';
import '../search/search_page.dart';
import '../theme/theme_x.dart';
import 'root_controller.dart';

class RootPage extends StatelessWidget {
  const RootPage({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(RootController());
    const pages = <Widget>[
      HomePage(),
      SearchPage(),
      MyPage(),
    ];

    return Obx(() {
      final colors = context.colors;
      final metrics = context.metrics;
      final index = controller.tabIndex.value;

      if (!ResponsiveLayout.useRail(context)) {
        return Scaffold(
          body: IndexedStack(
            index: index,
            children: pages,
          ),
          bottomNavigationBar: NavigationBar(
            height: metrics.bottomNavHeight,
            selectedIndex: index,
            onDestinationSelected: controller.changeTab,
            destinations: const [
              NavigationDestination(
                icon: Icon(Icons.home_outlined),
                selectedIcon: Icon(Icons.home),
                label: '홈',
              ),
              NavigationDestination(
                icon: Icon(Icons.search_outlined),
                selectedIcon: Icon(Icons.search),
                label: '검색',
              ),
              NavigationDestination(
                icon: Icon(Icons.person_outline),
                selectedIcon: Icon(Icons.person),
                label: '마이',
              ),
            ],
          ),
        );
      }

      return Scaffold(
        backgroundColor: colors.background,
        body: SafeArea(
          child: Row(
            children: [
              NavigationRail(
                selectedIndex: index,
                onDestinationSelected: controller.changeTab,
                labelType: ResponsiveLayout.isExpanded(context)
                    ? NavigationRailLabelType.all
                    : NavigationRailLabelType.selected,
                destinations: const [
                  NavigationRailDestination(
                    icon: Icon(Icons.home_outlined),
                    selectedIcon: Icon(Icons.home),
                    label: Text('홈'),
                  ),
                  NavigationRailDestination(
                    icon: Icon(Icons.search_outlined),
                    selectedIcon: Icon(Icons.search),
                    label: Text('검색'),
                  ),
                  NavigationRailDestination(
                    icon: Icon(Icons.person_outline),
                    selectedIcon: Icon(Icons.person),
                    label: Text('마이'),
                  ),
                ],
              ),
              VerticalDivider(width: 1, color: colors.divider),
              Expanded(
                child: IndexedStack(
                  index: index,
                  children: pages,
                ),
              ),
            ],
          ),
        ),
      );
    });
  }
}