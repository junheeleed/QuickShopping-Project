import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quick_shopping/presentation/responsive/responsive.dart';
import '../../app/routes/app_routes.dart';
import 'my_controller.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MyPage extends StatelessWidget {
  const MyPage({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<MyController>();
    final isCompact = ResponsiveLayout.isCompact(context);
    final pagePadding = ResponsiveLayout.pagePadding(context);
    final logoFont = isCompact ? 22.sp : 24.sp;
    final appBarHeight = ResponsiveLayout.appBarHeight(context);
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
                titleSpacing: pagePadding.w,
                toolbarHeight: appBarHeight,
                title: Text(
                  '마이',
                  style: TextStyle(
                      fontWeight: FontWeight.w900,
                      color: Colors.black,
                      fontSize: logoFont
                  ),
                ),
              ),

              SliverToBoxAdapter(
                child: Padding(
                  padding: EdgeInsets.fromLTRB(pagePadding.w, 12.h, pagePadding.w, 12.h),
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
                  padding: EdgeInsets.fromLTRB(pagePadding.w, 0, pagePadding.w, 16.h),
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
    final isCompact = ResponsiveLayout.isCompact(context);
    final textSize = ResponsiveLayout.textSize(context);
    return Container(
      padding: EdgeInsets.all(18.r),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(18.r),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '로그인하고\n더 많은 혜택을 받아보세요',
            style: TextStyle(
                fontSize: isCompact ? 18.sp : 20.sp,
                fontWeight: FontWeight.w900,
                height: 1.15
            ),
          ),
          SizedBox(height: 10.h),
          Text(
            '주문/배송 조회, 찜, 최근 본 상품을 한 번에.',
            style: TextStyle(
                color: Colors.black54,
                fontWeight: FontWeight.w700,
                fontSize: textSize
            ),
          ),
          SizedBox(height: 14.h),
          SizedBox(
            width: double.infinity,
            height: 48.h,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: _purple,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
              ),
              onPressed: onLogin,
              child: Text(
                '로그인',
                style: TextStyle(
                    fontWeight: FontWeight.w900,
                    fontSize: isCompact ? 16.sp : 18.sp,
                    color: Colors.white
                ),
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
    final isCompact = ResponsiveLayout.isCompact(context);
    final textSize = ResponsiveLayout.textSize(context);
    return Container(
      padding: EdgeInsets.all(18.r),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(18.r),
      ),
      child: Row(
        children: [
          Container(
            width: 54.w,
            height: 54.w,
            decoration: BoxDecoration(
              color: _purple.withOpacity(0.12),
              borderRadius: BorderRadius.circular(16.r),
            ),
            child: const Icon(Icons.person, color: _purple),
          ),
          SizedBox(width: 12.w),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '$nickname님',
                  style: TextStyle(
                      fontSize: isCompact ? 18.sp : 20.sp,
                      fontWeight: FontWeight.w900
                  ),
                ),
                SizedBox(height: 4.h),
                Text(
                  email,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    color: Colors.black54,
                    fontWeight: FontWeight.w700,
                    fontSize: textSize
                  ),
                ),
              ],
            ),
          ),
          TextButton(
            onPressed: onLogout,
            child: Text(
              '로그아웃',
              style: TextStyle(
                  fontWeight: FontWeight.w900,
                  fontSize: textSize
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
    return Container(
      decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(18.r)),
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
    final isCompact = ResponsiveLayout.isCompact(context);
    final textSize = ResponsiveLayout.textSize(context);
    return ListTile(
      dense: true,
      contentPadding: EdgeInsets.symmetric(horizontal: 14.w),
      leading: Icon(icon, color: Colors.black87),
      title: Text(
          title,
          style: TextStyle(
              fontWeight: FontWeight.w800,
              fontSize: textSize
          )
      ),
      trailing: locked
          ? Icon(
          Icons.lock_outline,
          color: Colors.black38,
          size: isCompact ? 20.w : 22.w
      ) : Icon(
          Icons.chevron_right,
          color: Colors.black38,
          size: isCompact ? 20.w : 22.w
      ),
      onTap: onTap,
    );
  }
}
