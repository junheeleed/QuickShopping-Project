import '../repositories/banner_repository.dart';

class InsertBannerAll {
  final BannerRepository repo;
  InsertBannerAll(this.repo);
  Future call() => repo.insertAll();
}