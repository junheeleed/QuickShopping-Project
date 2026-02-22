import 'package:get/get.dart';
import 'detail_controller.dart';

class ProductDetailBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ProductDetailController(
      watchAppDetail: Get.find(),
      setFavorites: Get.find(),
    ));
  }
}
