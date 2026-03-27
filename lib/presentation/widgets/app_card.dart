import 'package:flutter/material.dart';
import '../../domain/entities/product_entity.dart';
import '../responsive/responsive.dart';
import '../theme/theme_x.dart';

class AppCard extends StatelessWidget {
  final ProductEntity app;
  final VoidCallback onTap;
  final bool compact;

  const AppCard({
    super.key,
    required this.app,
    required this.onTap,
    this.compact = false,
  });

  @override
  Widget build(BuildContext context) {
    return compact ? _compactCard(context) : _listCard(context);
  }

  Widget _baseContainer({
    required BuildContext context,
    required Widget child,
    required VoidCallback onTap,
  }) {
    final colors = context.colors;
    final radius = context.radius;

    return InkWell(
      borderRadius: BorderRadius.circular(radius.card),
      onTap: onTap,
      child: Ink(
        decoration: BoxDecoration(
          color: colors.surface,
          borderRadius: BorderRadius.circular(radius.card),
          border: Border.all(color: colors.border),
        ),
        child: child,
      ),
    );
  }

  Widget _listCard(BuildContext context) {
    final colors = context.colors;
    final spacing = context.spacing;
    final imageSize = ResponsiveLayout.isCompact(context) ? 50.0 : 56.0;

    return _baseContainer(
      context: context,
      onTap: onTap,
      child: Padding(
        padding: EdgeInsets.all(spacing.cardPadding),
        child: Row(
          children: [
            _ProductImage(
              imageUrl: app.imageUrl,
              size: imageSize,
            ),
            SizedBox(width: spacing.cardPadding),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    app.name,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 2,
                    style: context.text.bodyMedium?.copyWith(
                      fontWeight: FontWeight.w800,
                      height: 1.2,
                      color: colors.textPrimary,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    app.shortDesc,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: context.text.bodySmall?.copyWith(
                      color: colors.textSecondary,
                      fontWeight: FontWeight.w700,
                      height: 1.25,
                    ),
                  ),
                  SizedBox(height: spacing.itemGap),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _compactCard(BuildContext context) {
    final colors = context.colors;
    final spacing = context.spacing;

    final price = app.price ?? 0;
    final ship = app.shippingFee ?? 0;

    // 컴팩트 카드 텍스트는 화면 특화라 단계형으로만
    final nameSize = ResponsiveLayout.isCompact(context) ? 14.0 : 15.0;
    final priceSize = ResponsiveLayout.isCompact(context) ? 13.0 : 14.0;
    final shipSize = ResponsiveLayout.isCompact(context) ? 12.0 : 13.0;

    final imgSize = ResponsiveLayout.isCompact(context) ? 63.0 : 72.0;

    return _baseContainer(
      context: context,
      onTap: onTap,
      child: Padding(
        padding: EdgeInsets.all(spacing.itemGap + 4),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _ProductImage(
              imageUrl: app.imageUrl,
              size: imgSize,
            ),
            SizedBox(height: spacing.itemGap),
            Text(
              app.name,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: context.text.bodyMedium?.copyWith(
                fontWeight: FontWeight.w700,
                fontSize: nameSize,
                height: 1.1,
                color: colors.textPrimary,
              ),
            ),
            const SizedBox(height: 4),
            Text(
              '${_comma(price)}원',
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: context.text.bodyMedium?.copyWith(
                fontWeight: FontWeight.w900,
                fontSize: priceSize,
                height: 1.1,
                color: colors.textPrimary,
              ),
            ),
            const SizedBox(height: 4),
            Text(
              ship == 0 ? '무료배송' : '배송 ${_comma(ship)}원',
              style: context.text.bodySmall?.copyWith(
                color: colors.textSecondary,
                fontWeight: FontWeight.w700,
                fontSize: shipSize,
                height: 1.1,
              ),
            ),
            const Spacer(),
          ],
        ),
      ),
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

class _ProductImage extends StatelessWidget {
  final String? imageUrl;
  final double size;

  const _ProductImage({
    required this.imageUrl,
    required this.size,
  });

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final radius = context.radius;

    if (imageUrl == null || imageUrl!.isEmpty) {
      return Container(
        width: size,
        height: size,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: colors.surfaceAlt,
          borderRadius: BorderRadius.circular(radius.image),
        ),
        child: Icon(
          Icons.local_mall_outlined,
          size: 22,
          color: colors.textSecondary,
        ),
      );
    }

    return ClipRRect(
      borderRadius: BorderRadius.circular(radius.image),
      child: SizedBox(
        width: size,
        height: size,
        child: Image.network(
          imageUrl!,
          fit: BoxFit.cover,
          errorBuilder: (_, __, ___) => Container(
            alignment: Alignment.center,
            color: colors.surfaceAlt,
            child: Icon(
              Icons.local_mall_outlined,
              size: 22,
              color: colors.textSecondary,
            ),
          ),
        ),
      ),
    );
  }
}