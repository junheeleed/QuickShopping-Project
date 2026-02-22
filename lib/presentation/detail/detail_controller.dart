import 'dart:async';
import 'package:get/get.dart';
import '../../domain/entities/product_detail_entity.dart';
import '../../domain/usecases/set_favorite.dart';
import '../../domain/usecases/watch_product_detail.dart';

class ProductDetailController extends GetxController {
  final WatchProductDetail watchAppDetail;
  final SetFavorites setFavorites;

  ProductDetailController({
    required this.watchAppDetail,
    required this.setFavorites,
  });

  final detail = Rxn<ProductDetailEntity>();
  final isFavorites = false.obs;

  StreamSubscription? _sub;
  late final int appId;

  @override
  void onInit() {
    super.onInit();
    appId = int.parse(Get.parameters['id']!);

    _sub = watchAppDetail(appId).listen((d) {
      detail.value = d;
      isFavorites.value = d.isFavorite;
    });
  }

  Future<void> toggleFavorite() async {
    final d = detail.value;
    if (d == null) return;

    final next = !isFavorites.value;

    isFavorites.value = next;

    try {
      await setFavorites(SetFavoriteParams(d.id, next));
    } catch (e) {
      isFavorites.value = !next;
      rethrow;
    }
  }

  @override
  void onClose() {
    _sub?.cancel();
    super.onClose();
  }
}
