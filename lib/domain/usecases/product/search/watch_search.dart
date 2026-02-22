import '../../../entities/product_entity.dart';
import '../../../repositories/store_repository.dart';

class WatchSearch {
  final ProductRepository repo;
  WatchSearch(this.repo);
  Stream<List<ProductEntity>> call(String query) => repo.watchSearch(query);
}