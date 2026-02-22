import '../repositories/banner_repository.dart';

class GetBannerOnce {
  final BannerRepository repo;
  GetBannerOnce(this.repo);
  Future call() => repo.getOnce();
}