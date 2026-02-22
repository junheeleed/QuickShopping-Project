import '../../data/local/db/app_database.dart';
import '../entities/home_banner_entity.dart';

abstract class BannerRepository {
  Future<List<HomeBanner>> getOnce();
  Future insertAll();
  Stream<List<HomeBannerEntity>> watchBanners();
}

