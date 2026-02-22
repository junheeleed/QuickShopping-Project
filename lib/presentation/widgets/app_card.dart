import 'package:flutter/material.dart';
import '../../domain/entities/product_entity.dart';
import 'rating_badge.dart';

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
    required Widget child,
    required VoidCallback onTap,
  }) {
    return InkWell(
      borderRadius: BorderRadius.circular(16),
      onTap: onTap,
      child: Ink(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: const Color(0xFFEAEAEA)),
        ),
        child: child,
      ),
    );
  }

  Widget _listCard(BuildContext context) {
    return _baseContainer(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.all(14),
        child: Row(
          children: [
            CircleAvatar(
              radius: 26,
              backgroundColor: const Color(0xFFF2F2F2),
              child: const Icon(Icons.apps),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(app.name, style: Theme.of(context).textTheme.titleMedium),
                  const SizedBox(height: 4),
                  Text(app.shortDesc, maxLines: 2, overflow: TextOverflow.ellipsis),
                  const SizedBox(height: 8),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _compactCard(BuildContext context) {
    final price = app.price ?? 0;
    final ship = app.shippingFee ?? 0;

    return _baseContainer(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _ProductImage(
              imageUrl: app.imageUrl,
              size: 63,
              radius: 14,
            ),
            const SizedBox(height: 8),

            Text(
              app.name,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 17,
                height: 1.1,
              ),
            ),
            const SizedBox(height: 6),

            Row(
              children: [
                Text(
                  '${_comma(price)}원',
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    fontWeight: FontWeight.w900,
                    fontSize: 16,
                    height: 1.1,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 6),
            Text(
              ship == 0 ? '무료배송' : '배송 ${_comma(ship)}원',
              style: const TextStyle(
                color: Colors.black54,
                fontWeight: FontWeight.w700,
                fontSize: 12,
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
  final double radius;

  const _ProductImage({
    required this.imageUrl,
    this.size = 40,
    this.radius = 12,
  });

  @override
  Widget build(BuildContext context) {
    if (imageUrl == null || imageUrl!.isEmpty) {
      return Container(
        width: size,
        height: size,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: const Color(0xFFF2F2F2),
          borderRadius: BorderRadius.circular(radius),
        ),
        child: const Icon(Icons.local_mall_outlined, size: 20, color: Colors.black54),
      );
    }

    return ClipRRect(
      borderRadius: BorderRadius.circular(radius),
      child: SizedBox(
        width: size,
        height: size,
        child: Image.network(
          imageUrl!,
          fit: BoxFit.cover,
          errorBuilder: (_, __, ___) => Container(
            alignment: Alignment.center,
            color: const Color(0xFFF2F2F2),
            child: const Icon(Icons.local_mall_outlined, size: 20, color: Colors.black54),
          ),
        ),
      ),
    );
  }
}
