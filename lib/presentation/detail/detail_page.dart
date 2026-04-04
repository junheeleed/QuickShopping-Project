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
        return const Scaffold(
          body: Center(child: CircularProgressIndicator()),
        );
      }

      final colors = context.colors;

      return Scaffold(
        backgroundColor: colors.background,
        appBar: AppBar(
          toolbarHeight: ResponsiveLayout.appBarHeight(context),
          title: Text('상품 상세', style: context.text.titleLarge),
          iconTheme: IconThemeData(color: colors.textPrimary),
          backgroundColor: colors.background,
          surfaceTintColor: colors.background,
          elevation: 0,
          scrolledUnderElevation: 0,
        ),
        bottomNavigationBar: ResponsiveLayout.isCompact(context) ? _ProductBottomBar(
          detail: detail,
          onFavorite: controller.toggleFavorite,
          onCopy: () => _copy(detail.url, context),
          onOpen: () => _copy(detail.url, context),
        ) : null,
        body: SafeArea(
          child: ResponsiveContent(
            child: ResponsiveLayout.isCompact(context)
                ? _ProductDetailMobile(detail: detail)
                : _ProductDetailWide(
              detail: detail,
              onFavorite: controller.toggleFavorite,
              onCopy: () => _copy(detail.url, context),
              onOpen: () => _copy(detail.url, context),
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
}

class _ProductDetailMobile extends StatelessWidget {
  final dynamic detail;

  const _ProductDetailMobile({required this.detail});

  @override
  Widget build(BuildContext context) {
    final spacing = context.spacing;

    return ListView(
      padding: EdgeInsets.fromLTRB(
        spacing.pagePaddingX,
        spacing.itemGap,
        spacing.pagePaddingX,
        spacing.sectionGap,
      ),
      children: [
        _ProductHero(detail: detail),
        SizedBox(height: spacing.sectionGap),
        _ProductSummary(detail: detail),
        SizedBox(height: spacing.sectionGap * 2),
        Text(
          '구매 정보',
          style: context.text.titleMedium?.copyWith(
            fontWeight: FontWeight.w900,
          ),
        ),
        SizedBox(height: spacing.itemGap),
        _PurchaseSummaryCard(
          benefitLines: _toLines(detail.benefitInfo),
          shippingLines: _toLines(detail.shippingInfo, fallbackShip: detail.shippingFee ?? 0),
          savingTitle: '예상 적립',
          savingValue: detail.savingInfo,
        ),
        SizedBox(height: spacing.sectionGap * 2),
        Text(
          '상품 설명',
          style: context.text.titleMedium?.copyWith(
            fontWeight: FontWeight.w900,
          ),
        ),
        SizedBox(height: spacing.itemGap),
        Text(
          detail.description,
          style: context.text.bodyMedium?.copyWith(
            fontWeight: FontWeight.w700,
            height: 1.35,
          ),
        ),
        SizedBox(height: spacing.sectionGap),
      ],
    );
  }
}

class _ProductDetailWide extends StatelessWidget {
  final dynamic detail;
  final VoidCallback onFavorite;
  final VoidCallback onCopy;
  final VoidCallback onOpen;

  const _ProductDetailWide({
    required this.detail,
    required this.onFavorite,
    required this.onCopy,
    required this.onOpen,
  });

  @override
  Widget build(BuildContext context) {
    final spacing = context.spacing;

    return SingleChildScrollView(
      padding: EdgeInsets.fromLTRB(
        spacing.pagePaddingX,
        spacing.sectionGap,
        spacing.pagePaddingX,
        spacing.sectionGap,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                flex: 5,
                child: _ProductHero(detail: detail),
              ),
              SizedBox(width: spacing.sectionGap * 1.5),
              Expanded(
                flex: 6,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _ProductSummary(detail: detail),
                    SizedBox(height: spacing.sectionGap * 1.5),
                    _PurchaseSummaryCard(
                      benefitLines: _toLines(detail.benefitInfo),
                      shippingLines: _toLines(
                        detail.shippingInfo,
                        fallbackShip: detail.shippingFee ?? 0,
                      ),
                      savingTitle: '예상 적립',
                      savingValue: detail.savingInfo,
                    ),
                    SizedBox(height: spacing.sectionGap * 1.5),
                    _WideActionRow(
                      detail: detail,
                      onFavorite: onFavorite,
                      onCopy: onCopy,
                      onOpen: onOpen,
                    ),
                  ],
                ),
              ),
            ],
          ),
          SizedBox(height: spacing.sectionGap * 2),
          Text(
            '상품 설명',
            style: context.text.titleMedium?.copyWith(
              fontWeight: FontWeight.w900,
            ),
          ),
          SizedBox(height: spacing.itemGap),
          Text(
            detail.description,
            style: context.text.bodyMedium?.copyWith(
              fontWeight: FontWeight.w700,
              height: 1.4,
            ),
          ),
        ],
      ),
    );
  }
}

class _ProductHero extends StatelessWidget {
  final dynamic detail;

  const _ProductHero({required this.detail});

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final spacing = context.spacing;
    final radius = context.radius;
    final metrics = context.metrics;

    return Container(
      height: metrics.heroImageHeight,
      decoration: BoxDecoration(
        color: colors.surfaceAlt,
        borderRadius: BorderRadius.circular(radius.card),
      ),
      child: Stack(
        children: [
          Center(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(radius.card),
              child: AspectRatio(
                aspectRatio: 1,
                child: detail.imageUrl.isEmpty
                    ? Icon(Icons.local_mall_outlined,
                  size: metrics.heroImageIconSize,
                  color: colors.textTertiary,)
                    : Image.network(
                  detail.imageUrl,
                  fit: BoxFit.cover,
                  errorBuilder: (_, __, ___) => Icon(
                    Icons.local_mall_outlined,
                    size: metrics.heroImageIconSize,
                    color: colors.textTertiary,
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            left: spacing.itemGap,
            top: spacing.itemGap,
            child: _Badge(
              text: detail.siteType.trim().isEmpty ? '쇼핑' : detail.siteType.trim(),
            ),
          ),
        ],
      ),
    );
  }
}

class _ProductSummary extends StatelessWidget {
  final dynamic detail;

  const _ProductSummary({required this.detail});

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final spacing = context.spacing;
    final metrics = context.metrics;

    final store = detail.storeName.trim();
    final price = detail.price ?? 0;
    final ship = detail.shippingFee ?? 0;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          detail.name,
          style: context.text.titleLarge?.copyWith(
            fontWeight: FontWeight.w900,
          ),
        ),
        SizedBox(height: spacing.itemGap),
        Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Text(
              _comma(price),
              style: context.text.titleLarge?.copyWith(
                fontSize: metrics.productPriceValue,
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
                  fontSize: metrics.productPriceUnit,
                  fontWeight: FontWeight.w900,
                ),
              ),
            ),
          ],
        ),
        SizedBox(height: spacing.itemGap),
        Row(
          children: [
            Icon(
              Icons.local_shipping_outlined,
              size: metrics.mediumIcon,
              color: colors.textSecondary,
            ),
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
              Text(
                '·',
                style: context.text.bodyMedium?.copyWith(
                  color: colors.textTertiary,
                  fontWeight: FontWeight.w900,
                ),
              ),
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
      ],
    );
  }
}

class _ProductBottomBar extends StatelessWidget {
  final dynamic detail;
  final VoidCallback onFavorite;
  final VoidCallback onCopy;
  final VoidCallback onOpen;

  const _ProductBottomBar({
    required this.detail,
    required this.onFavorite,
    required this.onCopy,
    required this.onOpen,
  });

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final spacing = context.spacing;

    return SafeArea(
      top: false,
      child: IntrinsicHeight(
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
                    onPressed: onFavorite,
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
                        onPressed: detail.url.isEmpty ? null : onCopy,
                        child: Text(
                          '링크 복사',
                          style: context.text.labelLarge,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: spacing.itemGap),
                  Expanded(
                    child: SizedBox(
                      height: context.fields.height,
                      child: ElevatedButton(
                        onPressed: detail.url.isEmpty ? null : onOpen,
                        child: Text(
                          '스토어 열기',
                          style: context.text.labelLarge?.copyWith(
                            color: colors.brandOn,
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
    );
  }
}

class _WideActionRow extends StatelessWidget {
  final dynamic detail;
  final VoidCallback onFavorite;
  final VoidCallback onCopy;
  final VoidCallback onOpen;

  const _WideActionRow({
    required this.detail,
    required this.onFavorite,
    required this.onCopy,
    required this.onOpen,
  });

  @override
  Widget build(BuildContext context) {
    final spacing = context.spacing;
    final colors = context.colors;

    return Row(
      children: [
        IconButton(
          onPressed: onFavorite,
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
              onPressed: detail.url.isEmpty ? null : onCopy,
              child: Text(
                '링크 복사',
                style: context.text.labelLarge,
              ),
            ),
          ),
        ),
        SizedBox(width: spacing.itemGap),
        Expanded(
          child: SizedBox(
            height: context.fields.height,
            child: ElevatedButton(
              onPressed: detail.url.isEmpty ? null : onOpen,
              child: Text(
                '스토어 열기',
                style: context.text.labelLarge?.copyWith(
                  color: colors.brandOn,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class _Badge extends StatelessWidget {
  final String text;

  const _Badge({required this.text});

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final radius = context.radius;
    final metrics = context.metrics;

    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: metrics.badgeHorizontalPadding,
        vertical: metrics.badgeVerticalPadding,
      ),
      decoration: BoxDecoration(
        color: colors.surface.withValues(alpha: 0.95),
        borderRadius: BorderRadius.circular(radius.button),
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
            child: _BulletLines(
              lines: benefitLines.isEmpty
                  ? const ['혜택 정보가 아직 없어요.']
                  : benefitLines,
            ),
          ),
          SizedBox(height: spacing.sectionGap),
          Divider(height: 1, color: colors.divider),
          SizedBox(height: spacing.sectionGap),
          _Section(
            icon: Icons.local_shipping_outlined,
            title: '배송',
            child: _BulletLines(
              lines: shippingLines.isEmpty
                  ? const ['배송 정보가 아직 없어요.']
                  : shippingLines,
            ),
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
    final metrics = context.metrics;

    const labelWidth = 52.0;

    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Icon(icon, size: metrics.mediumIcon, color: colors.textSecondary),
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