import 'package:get/get.dart';
import 'package:quick_shopping/presentation/home/widget/home_banner_carousel.dart';
import '../../domain/usecases/banner/get_banner_once.dart';
import '../../domain/usecases/banner/insert_banner_all.dart';
import '../../domain/usecases/banner/watch_banners.dart';
import 'home_controller.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => HomeController(
      watchCategories: Get.find(),
      watchProducts: Get.find(),
      syncProduct: Get.find(),
    ));

    Get.lazyPut(() => HomeBannerController(
      getBannerOnce: Get.find<GetBannerOnce>(),
      insertBannerAll: Get.find<InsertBannerAll>(),
      watchBanners: Get.find<WatchBanners>(),
    ));
  }
}
