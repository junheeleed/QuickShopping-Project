import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../app/routes/app_routes.dart';
import '../responsive/responsive.dart';
import '../theme/theme_x.dart';
import 'my_controller.dart';

class MyPage extends StatelessWidget {
  const MyPage({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<MyController>();

    final colors = context.colors;
    final spacing = context.spacing;

    final padX = spacing.pagePaddingX;

    return Scaffold(
      backgroundColor: colors.surfaceAlt,
      body: SafeArea(
        child: Obx(() {
          final profile = controller.profile.value;

          return CustomScrollView(
            slivers: [
              SliverAppBar(
                pinned: true,
                elevation: 0,
                backgroundColor: colors.background,
                surfaceTintColor: colors.background,
                titleSpacing: padX,
                toolbarHeight: ResponsiveLayout.appBarHeight(context),
                title: Text(
                  '마이',
                  style: context.text.titleLarge?.copyWith(
                      fontWeight: FontWeight.w900
                  ),
                ),
              ),

              SliverToBoxAdapter(
                child: Padding(
                  padding: EdgeInsets.fromLTRB(
                    padX,
                    spacing.sectionGap,
                    padX,
                    spacing.sectionGap,
                  ),
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
                  padding: EdgeInsets.fromLTRB(
                    padX,
                    0,
                    padX,
                    spacing.sectionGap,
                  ),
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

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final spacing = context.spacing;
    final radius = context.radius;

    return Container(
      padding: EdgeInsets.all(spacing.cardPadding),
      decoration: BoxDecoration(
        color: colors.surface,
        borderRadius: BorderRadius.circular(radius.card),
        border: Border.all(color: colors.border),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '로그인하고\n더 많은 혜택을 받아보세요',
            style: context.text.titleLarge?.copyWith(
              fontWeight: FontWeight.w900,
              height: 1.15,
            ),
          ),
          SizedBox(height: spacing.itemGap),
          Text(
            '주문/배송 조회, 찜, 최근 본 상품을 한 번에.',
            style: context.text.bodyMedium?.copyWith(
              color: colors.textSecondary,
              fontWeight: FontWeight.w700,
            ),
          ),
          SizedBox(height: spacing.sectionGap),

          SizedBox(
            width: double.infinity,
            height: context.fields.height,
            child: ElevatedButton(
              onPressed: onLogin,
              child: Text(
                '로그인',
                style: context.text.labelLarge?.copyWith(color: colors.brandOn),
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

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final spacing = context.spacing;
    final radius = context.radius;

    final avatarSize = ResponsiveLayout.isCompact(context) ? 54.0 : 60.0;

    return Container(
      padding: EdgeInsets.all(spacing.cardPadding),
      decoration: BoxDecoration(
        color: colors.surface,
        borderRadius: BorderRadius.circular(radius.card),
        border: Border.all(color: colors.border),
      ),
      child: Row(
        children: [
          Container(
            width: avatarSize,
            height: avatarSize,
            decoration: BoxDecoration(
              color: colors.brand.withValues(alpha: 0.12),
              borderRadius: BorderRadius.circular(radius.image),
            ),
            child: Icon(Icons.person, color: colors.brand),
          ),
          SizedBox(width: spacing.cardPadding),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '$nickname님',
                  style: context.text.titleMedium?.copyWith(
                    fontWeight: FontWeight.w900,
                    color: colors.textPrimary,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  email,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: context.text.bodyMedium?.copyWith(
                    color: colors.textSecondary,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ],
            ),
          ),
          TextButton(
            onPressed: onLogout,
            child: Text(
              '로그아웃',
              style: context.text.labelLarge?.copyWith(
                  fontWeight: FontWeight.w900
              ),
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
    final colors = context.colors;
    final radius = context.radius;

    return Container(
      decoration: BoxDecoration(
        color: colors.surface,
        borderRadius: BorderRadius.circular(radius.card),
        border: Border.all(color: colors.border),
      ),
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
          Divider(height: 1, color: colors.divider),
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
    final colors = context.colors;
    final spacing = context.spacing;

    return ListTile(
      dense: true,
      contentPadding: EdgeInsets.symmetric(horizontal: spacing.cardPadding),
      leading: Icon(icon, size: 22, color: colors.textPrimary),
      title: Text(
        title,
        style: context.text.bodyMedium?.copyWith(
          fontWeight: FontWeight.w800,
          color: colors.textPrimary,
        ),
      ),
      trailing: Icon(
        locked ? Icons.lock_outline : Icons.chevron_right,
        color: colors.textTertiary,
        size: 22,
      ),
      onTap: onTap,
    );
  }
}