import '../entities/product_detail_entity.dart';
import '../entities/product_entity.dart';
import '../entities/category_entity.dart';

abstract class ProductRepository {
  Stream<List<CategoryEntity>> watchCategories();
  Stream<List<ProductEntity>> watchProducts({int? categoryId});
  Stream<List<ProductEntity>> searchProducts(String query);
  Stream<List<ProductEntity>> watchSearch(String query);
  Stream<ProductDetailEntity> watchProductDetail(int productId);

  Future<void> sync();
  Future<void> setInstalled(int productId, bool installed);
}

