import '../repositories/store_repository.dart';

class SyncProduct {
  final ProductRepository repo;
  SyncProduct(this.repo);

  Future<void> call() => repo.sync();
}