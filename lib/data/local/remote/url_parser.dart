class UrlParseResult {
  final String? siteType;
  final String? storeName;
  const UrlParseResult({this.siteType, this.storeName});
}

UrlParseResult parseStore(String url) {
  try {
    final u = Uri.parse(url);
    final host = u.host; // smartstore.naver.com / brand.naver.com / search.shopping.naver.com

    if (host.contains('smartstore.naver.com')) {
      // /{store}/products/....
      final seg = u.pathSegments;
      final store = seg.isNotEmpty ? seg.first : null;
      return UrlParseResult(siteType: 'smartstore', storeName: store);
    }

    if (host.contains('brand.naver.com')) {
      // /{brand}/products/....
      final seg = u.pathSegments;
      final brand = seg.isNotEmpty ? seg.first : null;
      return UrlParseResult(siteType: 'brand', storeName: brand);
    }

    if (host.contains('search.shopping.naver.com')) {
      return const UrlParseResult(siteType: 'shopping', storeName: 'naver');
    }

    return const UrlParseResult(siteType: 'external', storeName: null);
  } catch (_) {
    return const UrlParseResult(siteType: 'unknown', storeName: null);
  }
}
