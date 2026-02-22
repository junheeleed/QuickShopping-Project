import '../../repositories/store_repository.dart';

class SetFavoriteParams {
  final int productId;
  final bool isFavorite;
  const SetFavoriteParams(this.productId, this.isFavorite);
}

class SetFavorites {
  final ProductRepository repo;
  SetFavorites(this.repo);

  Future<void> call(SetFavoriteParams params) => repo.setInstalled(params.productId, params.isFavorite);
}