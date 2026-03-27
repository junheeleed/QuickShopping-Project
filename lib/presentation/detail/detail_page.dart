import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../responsive/responsive.dart';
import '../theme/theme_x.dart';
import 'detail_controller.dart';

class ProductDetailPage extends StatelessWidget {
  const ProductDetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<ProductDetailController>();

    return Obx(() {
      final detail = controller.detail.value;
      if (detail == null) {
        return const Scaffold(body: Center(child: CircularProgressIndicator()));
      }

      final colors = context.colors;
      final spacing = context.spacing;
      final radius = context.radius;

      final url = detail.url;
      final store = detail.storeName.trim();
      final siteType = detail.siteType.trim();
      final price = detail.price ?? 0;
      final ship = detail.shippingFee ?? 0;

      final heroHeight = ResponsiveLayout.isCompact(context)
          ? 220.0 : (ResponsiveLayout.isMedium(context) ? 260.0 : 300.0);
      final priceFont = ResponsiveLayout.isCompact(context)
          ? 24.0 : (ResponsiveLayout.isMedium(context) ? 26.0 : 28.0);
      final unitFont = ResponsiveLayout.isCompact(context) ? 16.0 : 18.0;

      return Scaffold(
        backgroundColor: colors.background,
        appBar: AppBar(
          toolbarHeight: ResponsiveLayout.appBarHeight(context),
          title: Text(
              '상품 상세',
              style: context.text.titleLarge
          ),
          iconTheme: IconThemeData(color: colors.textPrimary),
          backgroundColor: colors.background,
          surfaceTintColor: colors.background,
          elevation: 0,
          scrolledUnderElevation: 0,
        ),

        bottomNavigationBar: SafeArea(
          top: false,
          child: Container(
            decoration: BoxDecoration(
              color: colors.surface,
              border: Border(top: BorderSide(color: colors.divider)),
            ),
            child: ResponsiveContent(
              child: Padding(
                padding: EdgeInsets.fromLTRB(
                  spacing.pagePaddingX,
                  spacing.itemGap,
                  spacing.pagePaddingX,
                  spacing.itemGap,
                ),
                child: Row(
                  children: [
                    IconButton(
                      onPressed: controller.toggleFavorite,
                      visualDensity: VisualDensity.compact,
                      icon: Icon(
                        detail.isFavorite ? Icons.favorite : Icons.favorite_border,
                        color: detail.isFavorite ? Colors.red : colors.textPrimary,
                      ),
                    ),
                    SizedBox(width: spacing.itemGap),

                    Expanded(
                      child: SizedBox(
                        height: context.fields.height,
                        child: OutlinedButton(
                          onPressed: url.isEmpty ? null : () => _copy(url, context),
                          // OutlinedButtonTheme가 이미 Theme에서 잡혀있으므로 여기선 최소만
                          child: Text(
                              '링크 복사',
                              style: context.text.labelLarge
                          ),
                        ),
                      ),
                    ),
                    SizedBox(width: spacing.itemGap),

                    Expanded(
                      child: SizedBox(
                        height: context.fields.height,
                        child: ElevatedButton(
                          onPressed: url.isEmpty ? null : () => _copy(url, context),
                          child: Text(
                            '스토어 열기',
                            style: context.text.labelLarge?.copyWith(
                                color: colors.brandOn
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),

        body: SafeArea(
          child: ResponsiveContent(
            child: ListView(
              padding: EdgeInsets.fromLTRB(
                spacing.pagePaddingX,
                spacing.itemGap,
                spacing.pagePaddingX,
                spacing.sectionGap,
              ),
              children: [
                Container(
                  height: heroHeight,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(radius.card),
                    color: colors.surfaceAlt,
                  ),
                  child: Stack(
                    children: [
                      Center(
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(radius.card),
                          child: AspectRatio(
                            aspectRatio: 1,
                            child: (detail.imageUrl.isEmpty)
                                ? Icon(Icons.local_mall_outlined,
                                size: ResponsiveLayout.isCompact(context) ? 64 : 72,
                                color: colors.textTertiary)
                                : Image.network(
                              detail.imageUrl,
                              fit: BoxFit.cover,
                              errorBuilder: (_, __, ___) => Icon(
                                Icons.local_mall_outlined,
                                size: ResponsiveLayout.isCompact(context) ? 64 : 72,
                                color: colors.textTertiary,
                              ),
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        left: spacing.itemGap + 4,
                        top: spacing.itemGap + 4,
                        child: _Badge(text: siteType.isEmpty ? '쇼핑' : siteType),
                      ),
                    ],
                  ),
                ),

                SizedBox(height: spacing.sectionGap),

                Text(
                  detail.name,
                  style: context.text.titleMedium?.copyWith(fontWeight: FontWeight.w900),
                ),

                const SizedBox(height: 6),

                Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      _comma(price),
                      style: context.text.titleLarge?.copyWith(
                        fontSize: priceFont,
                        fontWeight: FontWeight.w900,
                        height: 1.1,
                      ),
                    ),
                    const SizedBox(width: 4),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 2),
                      child: Text(
                        '원',
                        style: context.text.titleMedium?.copyWith(
                          fontSize: unitFont,
                          fontWeight: FontWeight.w900,
                        ),
                      ),
                    ),
                  ],
                ),

                SizedBox(height: spacing.itemGap),

                Row(
                  children: [
                    Icon(Icons.local_shipping_outlined, size: 20, color: colors.textSecondary),
                    SizedBox(width: spacing.itemGap),
                    Text(
                      ship == 0 ? '무료배송' : '${_comma(ship)}원',
                      style: context.text.bodyMedium?.copyWith(
                        fontWeight: FontWeight.w800,
                        color: ship == 0 ? colors.success : colors.textSecondary,
                      ),
                    ),
                    if (store.isNotEmpty) ...[
                      SizedBox(width: spacing.itemGap),
                      Text('·',
                          style: context.text.bodyMedium?.copyWith(
                            color: colors.textTertiary,
                            fontWeight: FontWeight.w900,
                          )),
                      SizedBox(width: spacing.itemGap),
                      Expanded(
                        child: Text(
                          store,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: context.text.bodyMedium?.copyWith(
                            color: colors.textSecondary,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                    ],
                  ],
                ),

                SizedBox(height: spacing.sectionGap * 2),

                Text(
                  '구매 정보',
                  style: context.text.titleMedium?.copyWith(
                      fontWeight: FontWeight.w900
                  ),
                ),
                SizedBox(height: spacing.itemGap),

                _PurchaseSummaryCard(
                  benefitLines: _toLines(detail.benefitInfo),
                  shippingLines: _toLines(detail.shippingInfo, fallbackShip: ship),
                  savingTitle: '예상 적립',
                  savingValue: detail.savingInfo,
                ),

                SizedBox(height: spacing.sectionGap * 2),

                Text(
                  '상품 설명',
                  style: context.text.titleMedium?.copyWith(
                      fontWeight: FontWeight.w900
                  ),
                ),
                SizedBox(height: spacing.itemGap),

                Text(
                  detail.description,
                  style: context.text.bodyMedium?.copyWith(
                    fontWeight: FontWeight.w700,
                    height: 1.35,
                    color: colors.textPrimary,
                  ),
                ),

                SizedBox(height: spacing.sectionGap),
              ],
            ),
          ),
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
    final colors = context.colors;
    final spacing = context.spacing;

    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: spacing.itemGap + 2,
        vertical: 6,
      ),
      decoration: BoxDecoration(
        color: colors.surface.withValues(alpha: 0.95),
        borderRadius: BorderRadius.circular(999),
        border: Border.all(color: colors.border),
      ),
      child: Text(
        text,
        style: context.text.bodySmall?.copyWith(
          fontWeight: FontWeight.w900,
          color: colors.textPrimary,
        ),
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
  final String savingTitle;
  final String? savingValue;
  final List<String> benefitLines;
  final List<String> shippingLines;

  const _PurchaseSummaryCard({
    required this.savingTitle,
    required this.savingValue,
    required this.benefitLines,
    required this.shippingLines,
  });

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final spacing = context.spacing;
    final radius = context.radius;

    return Container(
      padding: EdgeInsets.all(spacing.cardPadding),
      decoration: BoxDecoration(
        color: colors.surfaceAlt,
        borderRadius: BorderRadius.circular(radius.card),
        border: Border.all(color: colors.border),
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
                    style: context.text.bodyMedium?.copyWith(
                      fontWeight: FontWeight.w800,
                      color: colors.textPrimary,
                    ),
                  ),
                ),
                Text(
                  (savingValue ?? '').trim().isEmpty ? '—' : savingValue!.trim(),
                  style: context.text.bodyMedium?.copyWith(
                    fontWeight: FontWeight.w900,
                    color: colors.brand,
                  ),
                ),
              ],
            ),
          ),

          SizedBox(height: spacing.sectionGap),
          Divider(height: 1, color: colors.divider),
          SizedBox(height: spacing.sectionGap),

          _Section(
            icon: Icons.local_offer_outlined,
            title: '혜택',
            child: _BulletLines(lines: benefitLines.isEmpty ? const ['혜택 정보가 아직 없어요.'] : benefitLines),
          ),

          SizedBox(height: spacing.sectionGap),
          Divider(height: 1, color: colors.divider),
          SizedBox(height: spacing.sectionGap),

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
    final colors = context.colors;
    final spacing = context.spacing;

    const labelWidth = 52.0;
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Icon(icon, size: 20, color: colors.textSecondary),
        SizedBox(width: spacing.itemGap + 2),
        SizedBox(
          width: labelWidth,
          child: Text(
            title,
            style: context.text.bodySmall?.copyWith(
              color: colors.textSecondary,
              fontWeight: FontWeight.w900,
            ),
          ),
        ),
        SizedBox(width: spacing.itemGap + 2),
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
    final colors = context.colors;
    final spacing = context.spacing;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: lines.map((text) {
        return Padding(
          padding: EdgeInsets.only(bottom: spacing.itemGap),
          child: Text(
            text,
            style: context.text.bodyMedium?.copyWith(
              fontWeight: FontWeight.w800,
              color: colors.textPrimary,
              height: 1.25,
            ),
          ),
        );
      }).toList(),
    );
  }
}