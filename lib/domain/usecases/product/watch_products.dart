import '../../entities/product_entity.dart';
import '../../repositories/store_repository.dart';

class WatchProducts {
  final ProductRepository repo;
  WatchProducts(this.repo);
  Stream<List<ProductEntity>> call({int? categoryId}) => repo.watchProducts(categoryId: categoryId);
}