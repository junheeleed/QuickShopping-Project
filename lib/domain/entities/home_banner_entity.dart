class HomeBannerEntity {
  final int id;
  final String title;
  final String subtitle;
  final String targetUrl;
  final String? imageUrl;
  final int gradA;
  final int gradB;
  final int sortOrder;

  const HomeBannerEntity({
    required this.id,
    required this.title,
    required this.subtitle,
    required this.targetUrl,
    this.imageUrl,
    required this.gradA,
    required this.gradB,
    required this.sortOrder,
  });
}
