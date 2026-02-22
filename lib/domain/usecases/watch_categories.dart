import '../entities/category_entity.dart';
import '../repositories/store_repository.dart';

class WatchCategories {
  final ProductRepository repo;
  WatchCategories(this.repo);
  Stream<List<CategoryEntity>> call() => repo.watchCategories();
}