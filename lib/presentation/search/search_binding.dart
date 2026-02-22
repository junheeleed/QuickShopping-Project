import 'package:get/get.dart';
import 'package:quick_shopping/presentation/search/search_controller.dart';

class SearchBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => SearchControllerX(
      watchRecentKeywords: Get.find(),
      insertRecentKeyword: Get.find(),
      deleteRecentKeyword: Get.find(),
      clearRecentKeyword: Get.find(),
      watchSearch: Get.find(),
    ));
  }
}
