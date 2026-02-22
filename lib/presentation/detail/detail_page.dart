import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

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

      return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          title: Text(
            '상품 상세',
            style: const TextStyle(color: Colors.black, fontWeight: FontWeight.w900),
          ),
          iconTheme: const IconThemeData(color: Colors.black),
        ),

        bottomNavigationBar: SafeArea(
          top: false,
          child: Container(
            padding: const EdgeInsets.fromLTRB(12, 10, 12, 10),
            decoration: const BoxDecoration(
              color: Colors.white,
              border: Border(top: BorderSide(color: Color(0xFFE6E6E6))),
            ),
            child: Row(
              children: [
                IconButton(
                  onPressed: controller.toggleFavorite,
                  icon: Icon(
                    detail.isFavorite ? Icons.favorite : Icons.favorite_border,
                    color: detail.isFavorite ? Colors.red : Colors.black87,
                  ),
                ),
                const SizedBox(width: 6),
                Expanded(
                  child: OutlinedButton(
                    onPressed: url.isEmpty ? null : () => _copy(url, context),
                    style: OutlinedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(vertical: 14),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                    ),
                    child: const Text('링크 복사', style: TextStyle(fontWeight: FontWeight.w900)),
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: ElevatedButton(
                    onPressed: url.isEmpty ? null : () => _copy(url, context),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: _purple,
                      foregroundColor: Colors.white,
                      padding: const EdgeInsets.symmetric(vertical: 14),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                    ),
                    child: const Text('스토어 열기', style: TextStyle(fontWeight: FontWeight.w900)),
                  ),
                ),
              ],
            ),
          ),
        ),

        body: ListView(
          padding: const EdgeInsets.fromLTRB(16, 10, 16, 16),
          children: [
            Container(
              height: 260,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(18),
                color: const Color(0xFFF3F4F6),
              ),
              child: Stack(
                children: [
                  Center(
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(18),
                      child: AspectRatio(
                        aspectRatio: 1,
                        child: (detail.imageUrl.isEmpty)
                            ? const Icon(Icons.local_mall_outlined, size: 84, color: Colors.black38)
                            : Image.network(
                          detail.imageUrl,
                          fit: BoxFit.cover,
                          errorBuilder: (_, __, ___) => const Icon(Icons.local_mall_outlined, size: 84, color: Colors.black38),
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
            const SizedBox(height: 14),
            Text(detail.name, style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w900)),
            const SizedBox(height: 10),
            Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  _comma(price),
                  style: const TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.w900,
                    height: 1.0,
                    color: Colors.black,
                  ),
                ),
                const SizedBox(width: 4),
                const Padding(
                  padding: EdgeInsets.only(bottom: 3),
                  child: Text(
                    '원',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.w900),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 8),
            Row(
              children: [
                const Icon(Icons.local_shipping_outlined, size: 18, color: Colors.black54),
                const SizedBox(width: 6),
                Text(
                  ship == 0 ? '무료배송' : '${_comma(ship)}원',
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w800,
                    color: ship == 0 ? const Color(0xFF2DB400) : Colors.black54,
                  ),
                ),
                if (store.isNotEmpty) ...[
                  const SizedBox(width: 8),
                  const Text('·', style: TextStyle(color: Colors.black26, fontWeight: FontWeight.w900)),
                  const SizedBox(width: 8),
                  Expanded(
                    child: Text(
                      store,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w700, color: Colors.black54),
                    ),
                  ),
                ],
              ],
            ),
            const SizedBox(height: 14),

            const Text('구매 정보', style: TextStyle(fontSize: 16, fontWeight: FontWeight.w900)),
            const SizedBox(height: 10),

            _PurchaseSummaryCard(
              purple: _purple,
              savingTitle: '예상 적립',
              savingValue: detail.savingInfo,
              benefitLines: _toLines(detail.benefitInfo),
              shippingLines: _toLines(detail.shippingInfo, fallbackShip: ship),
            ),


            const SizedBox(height: 18),
            const Text('상품 설명', style: TextStyle(fontSize: 16, fontWeight: FontWeight.w900)),
            const SizedBox(height: 10),
            Text(
              detail.description,
              style: const TextStyle(
                  fontWeight: FontWeight.w700,
                  height: 1.35,
              ),
            ),
            const SizedBox(height: 18),

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
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.95), // TODO
        borderRadius: BorderRadius.circular(999),
        border: Border.all(color: const Color(0xFFEAEAEA)),
      ),
      child: Text(text, style: const TextStyle(fontWeight: FontWeight.w900)),
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
    return Container(
      padding: const EdgeInsets.fromLTRB(16, 14, 16, 14),
      decoration: BoxDecoration(
        color: const Color(0xFFF6F7F9),
        borderRadius: BorderRadius.circular(18),
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
                    style: const TextStyle(fontWeight: FontWeight.w800, color: Colors.black87),
                  ),
                ),
                Text(
                  (savingValue ?? '').trim().isEmpty ? '—' : savingValue!.trim(),
                  style: TextStyle(
                    fontWeight: FontWeight.w900,
                    color: purple,
                    fontSize: 15,
                  ),
                ),
              ],
            ),
          ),

          const SizedBox(height: 12),
          const Divider(height: 1, color: Color(0xFFE6E6E6)),
          const SizedBox(height: 12),

          _Section(
            icon: Icons.local_offer_outlined,
            title: '혜택',
            child: _BulletLines(lines: benefitLines.isEmpty ? const ['혜택 정보가 아직 없어요.'] : benefitLines),
          ),

          const SizedBox(height: 12),
          const Divider(height: 1, color: Color(0xFFE6E6E6)),
          const SizedBox(height: 12),

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
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Icon(icon, size: 20, color: Colors.black54),
        const SizedBox(width: 10),
        SizedBox(
          width: 44,
          child: Text(
            title,
            style: const TextStyle(
              color: Colors.black54,
              fontWeight: FontWeight.w900,
            ),
          ),
        ),
        const SizedBox(width: 10),
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
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: lines.map((text) {
        return Padding(
          padding: const EdgeInsets.only(bottom: 6),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Padding(
                padding: EdgeInsets.only(top: 6),
                child: Icon(Icons.circle, size: 6, color: Colors.black26),
              ),
              const SizedBox(width: 8),
              Expanded(
                child: Text(
                  text,
                  style: const TextStyle(
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
