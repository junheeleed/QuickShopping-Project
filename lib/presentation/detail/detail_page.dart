import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:quick_shopping/presentation/responsive/responsive.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'detail_controller.dart';

class ProductDetailPage extends StatelessWidget {
  const ProductDetailPage({super.key});

  static const _purple = Color(0xFF7B61FF);

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<ProductDetailController>();

    return Obx(() {
      final detail = controller.detail.value;
      if (detail == null) {
        return const Scaffold(body: Center(child: CircularProgressIndicator()));
      }

      final url = detail.url;
      final store = (detail.storeName).trim();
      final siteType = (detail.siteType).trim();
      final price = detail.price ?? 0;
      final ship = detail.shippingFee ?? 0;

      final isCompact = ResponsiveLayout.isCompact(context);
      final pagePadding = ResponsiveLayout.pagePadding(context);
      final sectionTitleFont = isCompact ? 18.sp : 20.sp;
      final appBarHeight = ResponsiveLayout.appBarHeight(context);
      final textSize = ResponsiveLayout.textSize(context).sp;

      return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          toolbarHeight: appBarHeight,
          backgroundColor: Colors.white,
          elevation: 0,
          title: Text(
            '상품 상세',
            style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.w900,
                fontSize: sectionTitleFont
            ),
          ),
          iconTheme: const IconThemeData(color: Colors.black),
        ),

        bottomNavigationBar: SafeArea(
          top: false,
          child: Container(
            padding: EdgeInsets.fromLTRB(pagePadding.w, 10.h, pagePadding.w, 10.h),
            decoration: const BoxDecoration(
              color: Colors.white,
              border: Border(top: BorderSide(color: Color(0xFFE6E6E6))),
            ),
            child: Row(
              children: [
                IconButton(
                  onPressed: controller.toggleFavorite,
                  visualDensity: VisualDensity.compact,
                  iconSize: isCompact ? 24.w : 26.w,
                  icon: Icon(
                    detail.isFavorite ? Icons.favorite : Icons.favorite_border,
                    color: detail.isFavorite ? Colors.red : Colors.black87,
                  ),
                ),
                SizedBox(width: 6.w),
                Expanded(
                  child: OutlinedButton(
                    onPressed: url.isEmpty ? null : () => _copy(url, context),
                    style: OutlinedButton.styleFrom(
                      padding: EdgeInsets.symmetric(vertical: 14.h),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.r)),
                    ),
                    child: Text(
                        '링크 복사',
                        style: TextStyle(
                            fontWeight: FontWeight.w900,
                            fontSize: textSize
                        ),
                    ),
                  ),
                ),
                SizedBox(
                    width: 10.w
                ),
                Expanded(
                  child: ElevatedButton(
                    onPressed: url.isEmpty ? null : () => _copy(url, context),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: _purple,
                      foregroundColor: Colors.white,
                      padding: EdgeInsets.symmetric(vertical: 14.h),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.r)),
                    ),
                    child: Text(
                        '스토어 열기',
                        style: TextStyle(
                            fontWeight: FontWeight.w900,
                            fontSize: textSize
                        )
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),

        body: ListView(
          padding: EdgeInsets.fromLTRB(pagePadding.w, 10.h, pagePadding.w, 16.h),
          children: [
            Container(
              height: isCompact ? 260.h : 300.h,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(18.r),
                color: const Color(0xFFF3F4F6),
              ),
              child: Stack(
                children: [
                  Center(
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(18.r),
                      child: AspectRatio(
                        aspectRatio: 1,
                        child: (detail.imageUrl.isEmpty)
                            ? Icon(Icons.local_mall_outlined, size: 84.w, color: Colors.black38)
                            : Image.network(
                          detail.imageUrl,
                          fit: BoxFit.cover,
                          errorBuilder: (_, __, ___) => Icon(Icons.local_mall_outlined, size: 84.w, color: Colors.black38),
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    left: 12,
                    top: 12,
                    child: _Badge(text: siteType.isEmpty ? '쇼핑' : siteType),
                  ),
                ],
              ),
            ),
            SizedBox(height: 14.h),
            Text(detail.name,
                style: TextStyle(
                    fontSize: isCompact ? 20.sp : 22.sp,
                    fontWeight: FontWeight.w900
                )
            ),
            SizedBox(height: 10.h),
            Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  _comma(price),
                  style: TextStyle(
                    fontSize: isCompact ? 20.sp : 22.sp,
                    fontWeight: FontWeight.w900,
                    height: 1.0,
                    color: Colors.black,
                  ),
                ),
                SizedBox(width: 4.w),
                Padding(
                  padding: EdgeInsets.only(bottom: 3.h),
                  child: Text(
                    '원',
                    style: TextStyle(
                        fontSize: isCompact ? 20.sp : 22.sp,
                        fontWeight: FontWeight.w900),
                  ),
                ),
              ],
            ),
            SizedBox(height: 8.h),
            Row(
              children: [
                Icon(Icons.local_shipping_outlined, size: isCompact ? 18.sp : 20.sp, color: Colors.black54),
                SizedBox(width: 6.w),
                Text(
                  ship == 0 ? '무료배송' : '${_comma(ship)}원',
                  style: TextStyle(
                    fontSize: textSize,
                    fontWeight: FontWeight.w800,
                    color: ship == 0 ? const Color(0xFF2DB400) : Colors.black54,
                  ),
                ),
                if (store.isNotEmpty) ...[
                  SizedBox(width: 8.w),
                  Text('·',
                      style: TextStyle(
                          color: Colors.black26,
                          fontWeight: FontWeight.w900,
                          fontSize: textSize
                      )
                  ),
                  SizedBox(width: 8.w),
                  Expanded(
                    child: Text(
                      store,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                          fontSize: textSize,
                          fontWeight: FontWeight.w700,
                          color: Colors.black54
                      ),
                    ),
                  ),
                ],
              ],
            ),
            SizedBox(height: 14.h),

            Text('구매 정보',
                style: TextStyle(
                    fontSize: isCompact ? 16.sp : 18.sp,
                    fontWeight: FontWeight.w900
                )
            ),
            SizedBox(height: 10.h),

            _PurchaseSummaryCard(
              purple: _purple,
              savingTitle: '예상 적립',
              savingValue: detail.savingInfo,
              benefitLines: _toLines(detail.benefitInfo),
              shippingLines: _toLines(detail.shippingInfo, fallbackShip: ship),
            ),


            SizedBox(height: 18.h),
            Text('상품 설명',
                style: TextStyle(
                    fontSize: isCompact ? 16.sp : 18.sp,
                    fontWeight: FontWeight.w900,
                )
            ),
            SizedBox(height: 10.h),
            Text(
              detail.description,
              style: TextStyle(
                fontSize: textSize,
                fontWeight: FontWeight.w700,
                height: 1.35,
              ),
            ),
            SizedBox(height: 18.h),

          ],
        ),
      );
    });
  }

  Future<void> _copy(String url, BuildContext context) async {
    await Clipboard.setData(ClipboardData(text: url));
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('링크를 복사했어요')),
    );
  }

  String _comma(int number) {
    final string = number.toString();
    final stringBuffer = StringBuffer();
    for (int i = 0; i < string.length; i++) {
      final idxFromEnd = string.length - i;
      stringBuffer.write(string[i]);
      if (idxFromEnd > 1 && idxFromEnd % 3 == 1) stringBuffer.write(',');
    }
    return stringBuffer.toString();
  }
}

class _Badge extends StatelessWidget {
  final String text;
  const _Badge({required this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 6.h),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.95), // TODO
        borderRadius: BorderRadius.circular(999.r),
        border: Border.all(color: const Color(0xFFEAEAEA)),
      ),
      child: Text(
          text,
          style: TextStyle(
              fontWeight: FontWeight.w900,
              fontSize: ResponsiveLayout.textSize(context)
          )
      ),
    );
  }
}

List<String> _toLines(String? text, {int? fallbackShip}) {
  final t = (text ?? '').trim();

  if (t.isEmpty && fallbackShip != null) {
    return [fallbackShip == 0 ? '무료배송' : '배송비 ${fallbackShip.toString()}원'];
  }

  return t
      .split('\n')
      .map((e) => e.trim())
      .where((e) => e.isNotEmpty)
      .toList();
}

class _PurchaseSummaryCard extends StatelessWidget {
  final Color purple;

  final String savingTitle;
  final String? savingValue;

  final List<String> benefitLines;
  final List<String> shippingLines;

  const _PurchaseSummaryCard({
    required this.purple,
    required this.savingTitle,
    required this.savingValue,
    required this.benefitLines,
    required this.shippingLines,
  });

  @override
  Widget build(BuildContext context) {
    final pagePadding = ResponsiveLayout.pagePadding(context);
    return Container(
      padding: EdgeInsets.fromLTRB(pagePadding, 14.h, pagePadding, 14.h),
      decoration: BoxDecoration(
        color: const Color(0xFFF6F7F9),
        borderRadius: BorderRadius.circular(18.r),
        border: Border.all(color: const Color(0xFFEAEAEA)),
      ),
      child: Column(
        children: [
          _Section(
            icon: Icons.savings_outlined,
            title: '적립',
            child: Row(
              children: [
                Expanded(
                  child: Text(
                    savingTitle,
                    style: TextStyle(
                        fontWeight: FontWeight.w800,
                        color: Colors.black87,
                        fontSize: ResponsiveLayout.textSize(context)
                    ),
                  ),
                ),
                Text(
                  (savingValue ?? '').trim().isEmpty ? '—' : savingValue!.trim(),
                  style: TextStyle(
                    fontWeight: FontWeight.w900,
                    color: purple,
                    fontSize: 15.sp,
                  ),
                ),
              ],
            ),
          ),

          SizedBox(height: 12.h),
          Divider(height: 1, color: Color(0xFFE6E6E6)),
          SizedBox(height: 12.h),

          _Section(
            icon: Icons.local_offer_outlined,
            title: '혜택',
            child: _BulletLines(lines: benefitLines.isEmpty ? const ['혜택 정보가 아직 없어요.'] : benefitLines),
          ),

          SizedBox(height: 12.h),
          const Divider(height: 1, color: Color(0xFFE6E6E6)),
          SizedBox(height: 12.h),

          _Section(
            icon: Icons.local_shipping_outlined,
            title: '배송',
            child: _BulletLines(lines: shippingLines.isEmpty ? const ['배송 정보가 아직 없어요.'] : shippingLines),
          ),
        ],
      ),
    );
  }
}

class _Section extends StatelessWidget {
  final IconData icon;
  final String title;
  final Widget child;

  const _Section({
    required this.icon,
    required this.title,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    final isCompat = ResponsiveLayout.isCompact(context);
    final fontSize = ResponsiveLayout.textSize(context);
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Icon(icon, size: isCompat ? 20.w : 22.w, color: Colors.black54),
        SizedBox(width: 10.w),
        SizedBox(
          width: 44.w,
          child: Text(
            title,
            style: TextStyle(
              fontSize: fontSize,
              color: Colors.black54,
              fontWeight: FontWeight.w900,
            ),
          ),
        ),
        SizedBox(width: 10.w),
        Expanded(child: child),
      ],
    );
  }
}

class _BulletLines extends StatelessWidget {
  final List<String> lines;
  const _BulletLines({required this.lines});

  @override
  Widget build(BuildContext context) {
    final isCompact = ResponsiveLayout.isCompact(context);
    final fontSize = ResponsiveLayout.textSize(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: lines.map((text) {
        return Padding(
          padding: EdgeInsets.only(bottom: 6.h),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.only(top: 6.h),
                child: Icon(
                    Icons.circle,
                    size: isCompact ? 6.w : 8.w,
                    color: Colors.black26
                ),
              ),
              SizedBox(width: 8.w),
              Expanded(
                child: Text(
                  text,
                  style: TextStyle(
                    fontSize: fontSize,
                    fontWeight: FontWeight.w800,
                    color: Colors.black87,
                    height: 1.25,
                  ),
                ),
              ),
            ],
          ),
        );
      }).toList(),
    );
  }
}
