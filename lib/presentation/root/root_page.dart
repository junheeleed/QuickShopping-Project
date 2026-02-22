import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../home/home_page.dart';
import '../search/search_page.dart';
import '../my/my_page.dart';
import 'root_controller.dart';

class RootPage extends StatelessWidget {
  const RootPage({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(RootController());

    return Obx(() {
      final tabIndex = controller.tabIndex.value;
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
            height: 70,
            decoration: const BoxDecoration(
              color: Colors.white,
              border: Border(top: BorderSide(color: Color(0xFFEDEDED))),
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
    final color = selected ? Colors.black : Colors.black54;

    return Expanded(
      child: InkWell(
        onTap: onTap,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(selected ? selectedIcon : icon, size: 26, color: color),
            const SizedBox(height: 4),
            Text(
              label,
              style: TextStyle(
                fontSize: 12,
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
