import '../../../entities/product_entity.dart';
import '../../../repositories/store_repository.dart';

class SearchProducts {
  final ProductRepository repo;
  SearchProducts(this.repo);
  Stream<List<ProductEntity>> call(String query) => repo.searchProducts(query);
}
