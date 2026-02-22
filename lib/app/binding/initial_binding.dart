import 'package:get/get.dart';
import '../../data/local/db/app_database.dart';
import '../../data/local/remote/fake_store_remote_ds.dart';
import '../../data/local/repositories/auth_repository_impl.dart';
import '../../data/local/repositories/banner_repository_impl.dart';
import '../../data/local/repositories/search_repository_impl.dart';
import '../../data/local/repositories/store_repository_impl.dart';
import '../../domain/repositories/auth_repository.dart';
import '../../domain/repositories/banner_repository.dart';
import '../../domain/repositories/search_repository.dart';
import '../../domain/repositories/store_repository.dart';
import '../../domain/usecases/clear_recent_keyword.dart';
import '../../domain/usecases/delete_recent_keyword.dart';
import '../../domain/usecases/get_banner_once.dart';
import '../../domain/usecases/insert_recent_keyword.dart';
import '../../domain/usecases/login.dart';
import '../../domain/usecases/logout.dart';
import '../../domain/usecases/search_apps.dart';
import '../../domain/usecases/set_favorite.dart';
import '../../domain/usecases/sign_up.dart';
import '../../domain/usecases/sync_store.dart';
import '../../domain/usecases/upsert_all.dart';
import '../../domain/usecases/watch_banners.dart';
import '../../domain/usecases/watch_product_detail.dart';
import '../../domain/usecases/watch_products.dart';
import '../../domain/usecases/watch_categories.dart';
import '../../domain/usecases/watch_profile.dart';
import '../../domain/usecases/watch_recent_keywords.dart';
import '../../domain/usecases/watch_search.dart';

class InitialBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<AppDatabase>(AppDatabase(), permanent: true);
    Get.put<StoreDao>(StoreDao(Get.find<AppDatabase>()), permanent: true);
    Get.put<RecentSearchDao>(RecentSearchDao(Get.find<AppDatabase>()), permanent: true);
    Get.put<AuthDao>(AuthDao(Get.find<AppDatabase>()), permanent: true);
    Get.put<HomeBannerDao>(HomeBannerDao(Get.find<AppDatabase>()), permanent: true);
    Get.put(ProductRemoteDataSource(), permanent: true);

    Get.put<ProductRepository>(
      ProductRepositoryImpl(
          dao: Get.find<StoreDao>(),
          remote: Get.find<ProductRemoteDataSource>(),
      ),
      permanent: true,
    );
    Get.put<BannerRepository>(
      BannerRepositoryImpl(
        dao: Get.find<HomeBannerDao>(),
      ),
      permanent: true,
    );
    Get.put<SearchRepository>(
      SearchRepositoryImpl(
        recentDao: Get.find<RecentSearchDao>(),
      ),
      permanent: true,
    );
    Get.put<AuthRepository>(
      AuthRepositoryImpl(dao: Get.find<AuthDao>()),
      permanent: true,
    );

    Get.put(WatchCategories(Get.find()), permanent: true);
    Get.put(WatchProducts(Get.find()), permanent: true);
    Get.put(SearchProducts(Get.find()), permanent: true);
    Get.put(GetBannerOnce(Get.find()), permanent: true);
    Get.put(InsertBannerAll(Get.find()), permanent: true);
    Get.put(WatchBanners(Get.find()), permanent: true);

    Get.put(WatchRecentKeywords(Get.find()), permanent: true);
    Get.put(InsertRecentKeyword(Get.find()), permanent: true);
    Get.put(DeleteRecentKeyword(Get.find()), permanent: true);
    Get.put(ClearRecentKeyword(Get.find()), permanent: true);
    Get.put(WatchSearch(Get.find()), permanent: true);

    Get.put(WatchProfile(Get.find()), permanent: true);
    Get.put(SignUp(Get.find()), permanent: true);
    Get.put(Login(Get.find()), permanent: true);
    Get.put(Logout(Get.find()), permanent: true);

    Get.put(WatchProductDetail(Get.find()), permanent: true);
    Get.put(SyncProduct(Get.find()), permanent: true);
    Get.put(SetFavorites(Get.find()), permanent: true);
  }
}
