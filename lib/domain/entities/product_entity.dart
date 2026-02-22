class ProductEntity {
  final int id;
  final String name;
  final String shortDesc;
  final String description;
  final String url;
  final String? imageUrl;
  final String? storeName;
  final String? siteType;

  final int? price;
  final int? shippingFee;

  final bool installed;

  const ProductEntity({
    required this.id,
    required this.name,
    required this.shortDesc,
    required this.description,
    required this.url,
    required this.imageUrl,
    required this.storeName,
    required this.siteType,
    required this.price,
    required this.shippingFee,
    required this.installed,
  });
}
