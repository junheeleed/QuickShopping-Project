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
import '../../domain/usecases/banner/watch_banners.dart';
import '../../domain/usecases/keyword/clear_recent_keyword.dart';
import '../../domain/usecases/banner/get_banner_once.dart';
import '../../domain/usecases/keyword/delete_recent_keyword.dart';
import '../../domain/usecases/keyword/insert_recent_keyword.dart';
import '../../domain/usecases/account/login.dart';
import '../../domain/usecases/account/logout.dart';
import '../../domain/usecases/product/search/search_products.dart';
import '../../domain/usecases/product/set_favorite.dart';
import '../../domain/usecases/account/sign_up.dart';
import '../../domain/usecases/product/sync_product.dart';
import '../../domain/usecases/banner/insert_banner_all.dart';
import '../../domain/usecases/product/detail/watch_product_detail.dart';
import '../../domain/usecases/product/watch_products.dart';
import '../../domain/usecases/watch_categories.dart';
import '../../domain/usecases/account/watch_profile.dart';
import '../../domain/usecases/keyword/watch_recent_keywords.dart';
import '../../domain/usecases/product/search/watch_search.dart';

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
