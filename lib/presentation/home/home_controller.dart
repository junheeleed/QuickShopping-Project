import 'dart:async';
import 'package:get/get.dart';

import '../../domain/entities/product_entity.dart';
import '../../domain/entities/category_entity.dart';
import '../../domain/usecases/product/sync_product.dart';
import '../../domain/usecases/product/watch_products.dart';
import '../../domain/usecases/watch_categories.dart';

class HomeController extends GetxController {
  final WatchCategories watchCategories;
  final WatchProducts watchProducts;
  final SyncProduct syncProduct;

  HomeController({
    required this.watchCategories,
    required this.watchProducts,
    required this.syncProduct,
  });

  final categories = <CategoryEntity>[].obs;
  final products = <ProductEntity>[].obs;

  final selectedCategoryId = 0.obs;
  final topTabIndex = 0.obs;

  final isLoading = true.obs;

  StreamSubscription? _catSub;
  StreamSubscription? _productcsSub;

  bool _gotFirstProducts = false;

  @override
  void onInit() {
    super.onInit();

    isLoading.value = true;
    _gotFirstProducts = false;

    _startSync();
    _catSub = watchCategories().listen(
          (list) => categories.assignAll(list),
      onError: (_) {
      },
    );

    ever(selectedCategoryId, (_) => _bindProducts());
    _bindProducts();
  }

  Future<void> _startSync() async {
    try {
      await syncProduct();
    } catch (_) {
      if (isLoading.value) isLoading.value = false;
    }
  }

  void _bindProducts() {
    _productcsSub?.cancel();
    isLoading.value = true;

    final categoryId = selectedCategoryId.value;

    _productcsSub = watchProducts(categoryId: categoryId).listen(
          (list) {
        products.assignAll(list);

        if (!_gotFirstProducts) {
          _gotFirstProducts = true;
          isLoading.value = false;
        }
        isLoading.value = false;
      },
      onError: (_) {
        isLoading.value = false;
      },
    );
  }

  void onTopTabChanged(int index) {
    topTabIndex.value = index;

    switch (index) {
      case 0:
        selectedCategoryId.value = 0;
        break;
      case 1:
        selectedCategoryId.value = 1;
        break;
    }
  }

  @override
  void onClose() {
    _catSub?.cancel();
    _productcsSub?.cancel();
    super.onClose();
  }
}
