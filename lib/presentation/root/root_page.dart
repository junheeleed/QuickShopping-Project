import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../home/home_page.dart';
import '../search/search_page.dart';
import '../my/my_page.dart';
import '../responsive/responsive.dart';
import '../theme/theme_x.dart';
import 'root_controller.dart';

class RootPage extends StatelessWidget {
  const RootPage({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(RootController());

    return Obx(() {
      final colors = context.colors;

      final tabIndex = controller.tabIndex.value;

      final bottomNavHeight = ResponsiveLayout.isCompact(context) ? 70.0 : 72.0;

      return Scaffold(
        body: IndexedStack(
          index: tabIndex,
          children: const [
            HomePage(),
            SearchPage(),
            MyPage(),
          ],
        ),

        bottomNavigationBar: SafeArea(
          top: false,
          child: Container(
            height: bottomNavHeight,
            decoration: BoxDecoration(
              color: colors.surface,
              border: Border(top: BorderSide(color: colors.divider)),
            ),
            child: Row(
              children: [
                _BottomItem(
                  label: '홈',
                  icon: Icons.home_outlined,
                  selectedIcon: Icons.home,
                  selected: tabIndex == 0,
                  onTap: () => controller.changeTab(0),
                ),
                _BottomItem(
                  label: '검색',
                  icon: Icons.search_outlined,
                  selectedIcon: Icons.search,
                  selected: tabIndex == 1,
                  onTap: () => controller.changeTab(1),
                ),
                _BottomItem(
                  label: '마이',
                  icon: Icons.person_outline,
                  selectedIcon: Icons.person,
                  selected: tabIndex == 2,
                  onTap: () => controller.changeTab(2),
                ),
              ],
            ),
          ),
        ),
      );
    });
  }
}

class _BottomItem extends StatelessWidget {
  final String label;
  final IconData icon;
  final IconData selectedIcon;
  final bool selected;
  final VoidCallback onTap;

  const _BottomItem({
    required this.label,
    required this.icon,
    required this.selectedIcon,
    required this.selected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final spacing = context.spacing;

    final color = selected ? colors.textPrimary : colors.textSecondary;

    final double labelSize = ResponsiveLayout.isCompact(context)
        ? 12
        : (ResponsiveLayout.isMedium(context) ? 13 : 14);

    final double iconSize = ResponsiveLayout.isCompact(context) ? 26 : 28;

    return Expanded(
      child: InkWell(
        onTap: onTap,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              selected ? selectedIcon : icon,
              size: iconSize,
              color: color,
            ),
            SizedBox(height: spacing.itemGap / 2),
            Text(
              label,
              style: TextStyle(
                fontSize: labelSize,
                fontWeight: selected ? FontWeight.w900 : FontWeight.w700,
                color: color,
              ),
            ),
          ],
        ),
      ),
    );
  }
}