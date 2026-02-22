import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../app/routes/app_routes.dart';
import 'my_controller.dart';

class MyPage extends StatelessWidget {
  const MyPage({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<MyController>();

    return Scaffold(
      backgroundColor: const Color(0xFFF6F7F9),
      body: SafeArea(
        child: Obx(() {
          final profile = controller.profile.value;
          return CustomScrollView(
            slivers: [
              SliverAppBar(
                pinned: true,
                elevation: 0,
                backgroundColor: Colors.white,
                titleSpacing: 16,
                title: const Text(
                  '마이',
                  style: TextStyle(fontWeight: FontWeight.w900, color: Colors.black),
                ),
              ),

              SliverToBoxAdapter(
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(16, 12, 16, 12),
                  child: profile.isLoggedIn
                      ? _ProfileCard(
                    nickname: profile.nickname ?? '사용자',
                    email: profile.email ?? '',
                    onLogout: controller.logoutUser,
                  )
                      : _GuestCard(onLogin: () => Get.toNamed(Routes.login)),
                ),
              ),

              SliverToBoxAdapter(
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
                  child: _MenuCard(
                    isLoggedIn: profile.isLoggedIn,
                    onRequireLogin: () => Get.toNamed(Routes.login),
                  ),
                ),
              ),
            ],
          );
        }),
      ),
    );
  }
}

class _GuestCard extends StatelessWidget {
  final VoidCallback onLogin;
  const _GuestCard({required this.onLogin});

  static const _purple = Color(0xFF7B61FF);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(18),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            '로그인하고\n더 많은 혜택을 받아보세요',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.w900, height: 1.15),
          ),
          const SizedBox(height: 10),
          const Text(
            '주문/배송 조회, 찜, 최근 본 상품을 한 번에.',
            style: TextStyle(color: Colors.black54, fontWeight: FontWeight.w700),
          ),
          const SizedBox(height: 14),
          SizedBox(
            width: double.infinity,
            height: 48,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: _purple,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
              ),
              onPressed: onLogin,
              child: const Text(
                '로그인',
                style: TextStyle(fontWeight: FontWeight.w900, fontSize: 16),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _ProfileCard extends StatelessWidget {
  final String nickname;
  final String email;
  final VoidCallback onLogout;

  const _ProfileCard({
    required this.nickname,
    required this.email,
    required this.onLogout,
  });

  static const _purple = Color(0xFF7B61FF);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(18),
      ),
      child: Row(
        children: [
          Container(
            width: 54,
            height: 54,
            decoration: BoxDecoration(
              color: _purple.withOpacity(0.12),
              borderRadius: BorderRadius.circular(16),
            ),
            child: const Icon(Icons.person, color: _purple),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '$nickname님',
                  style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w900),
                ),
                const SizedBox(height: 4),
                Text(
                  email,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(color: Colors.black54, fontWeight: FontWeight.w700),
                ),
              ],
            ),
          ),
          TextButton(
            onPressed: onLogout,
            child: const Text(
              '로그아웃',
              style: TextStyle(fontWeight: FontWeight.w900),
            ),
          ),
        ],
      ),
    );
  }
}

class _MenuCard extends StatelessWidget {
  final bool isLoggedIn;
  final VoidCallback onRequireLogin;

  const _MenuCard({
    required this.isLoggedIn,
    required this.onRequireLogin,
  });

  void _guard(VoidCallback action) {
    if (!isLoggedIn) {
      onRequireLogin();
      return;
    }
    action();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(18)),
      child: Column(
        children: [
          _MenuTile(
            icon: Icons.local_shipping_outlined,
            title: '주문·배송 조회',
            locked: !isLoggedIn,
            onTap: () => _guard(() {}),
          ),
          _MenuTile(
            icon: Icons.favorite_border,
            title: '찜한 상품',
            locked: !isLoggedIn,
            onTap: () => _guard(() {}),
          ),
          _MenuTile(
            icon: Icons.history,
            title: '최근 본 상품',
            locked: !isLoggedIn,
            onTap: () => _guard(() {}),
          ),
          const Divider(height: 1, color: Color(0xFFF0F0F0)),
          _MenuTile(
            icon: Icons.support_agent,
            title: '고객센터',
            onTap: () {},
          ),
          _MenuTile(
            icon: Icons.settings_outlined,
            title: '설정',
            onTap: () {},
          ),
        ],
      ),
    );
  }
}

class _MenuTile extends StatelessWidget {
  final IconData icon;
  final String title;
  final bool locked;
  final VoidCallback onTap;

  const _MenuTile({
    required this.icon,
    required this.title,
    required this.onTap,
    this.locked = false,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      dense: true,
      contentPadding: const EdgeInsets.symmetric(horizontal: 14),
      leading: Icon(icon, color: Colors.black87),
      title: Text(title, style: const TextStyle(fontWeight: FontWeight.w800)),
      trailing: locked
          ? const Icon(Icons.lock_outline, color: Colors.black38, size: 20)
          : const Icon(Icons.chevron_right, color: Colors.black38),
      onTap: onTap,
    );
  }
}
