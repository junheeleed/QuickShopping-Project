import 'category_entity.dart';

class ProductDetailEntity {
  final int id;
  final String name;
  final String shortDesc;
  final String description;

  final String url;
  final String imageUrl;
  final String storeName;
  final String siteType;

  final int? price;
  final int? shippingFee;

  final bool isFavorite;

  final List<CategoryEntity> categories;

  final String? savingInfo;
  final String? benefitInfo;
  final String? shippingInfo;

  final String? manufacturer;
  final String? brand;
  final String? modelName;
  final String? origin;
  final String? detailFeatures;
  final String? productForm;
  final String? capacity;
  final String? keyFeatures;

  const ProductDetailEntity({
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
    required this.isFavorite,
    required this.categories,
    required this.savingInfo,
    required this.benefitInfo,
    required this.shippingInfo,

    required this.manufacturer,
    required this.brand,
    required this.modelName,
    required this.origin,
    required this.detailFeatures,
    required this.productForm,
    required this.capacity,
    required this.keyFeatures,
  });
}
