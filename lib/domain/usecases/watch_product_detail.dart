import '../entities/product_detail_entity.dart';
import '../repositories/store_repository.dart';

class WatchProductDetail {
  final ProductRepository repo;
  WatchProductDetail(this.repo);
  Stream<ProductDetailEntity> call(int productId) => repo.watchProductDetail(productId);
}