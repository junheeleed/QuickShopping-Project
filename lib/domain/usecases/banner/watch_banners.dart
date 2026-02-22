import '../../entities/home_banner_entity.dart';
import '../../repositories/banner_repository.dart';

class WatchBanners {
  final BannerRepository repo;
  WatchBanners(this.repo);
  Stream<List<HomeBannerEntity>> call() => repo.watchBanners();
}