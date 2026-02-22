import 'package:drift/drift.dart' as drift;

import '../../../domain/entities/product_detail_entity.dart';
import '../../../domain/entities/product_entity.dart';
import '../../../domain/entities/category_entity.dart';
import '../../../domain/repositories/store_repository.dart';
import '../db/app_database.dart';
import '../remote/fake_store_remote_ds.dart';

class ProductRepositoryImpl implements ProductRepository {
  final StoreDao dao;
  final ProductRemoteDataSource remote;

  ProductRepositoryImpl({
    required this.dao,
    required this.remote,
  });

  @override
  Stream<List<CategoryEntity>> watchCategories() {
    return dao.watchCategories().map(
          (list) => list.map((c) => CategoryEntity(id: c.id, name: c.name)).toList(),
    );
  }

  @override
  Stream<List<ProductEntity>> watchProducts({int? categoryId}) {
    return dao.watchProducts(categoryId: categoryId).map(_mapProducts);
  }

  @override
  Stream<List<ProductEntity>> searchProducts(String query) {
    return dao.searchProducts(query).map(_mapProducts);
  }

  @override
  Stream<ProductDetailEntity> watchProductDetail(int productId) {
    return dao.watchProductDetail(productId).map((row) {
      final product = row.product;
      final cats = row.categories.map((c) => CategoryEntity(id: c.id, name: c.name)).toList();

      return ProductDetailEntity(
        id: product.id,
        name: product.name,
        shortDesc: product.shortDesc,
        description: product.description,
        url: product.url,
        imageUrl: product.imageUrl,
        storeName: product.storeName,
        siteType: product.siteType,
        isFavorite: product.installed,
        categories: cats,
        price: product.price,
        shippingFee: product.shippingFee,
        savingInfo: product.savingInfo,
        benefitInfo: product.benefitInfo,
        shippingInfo: product.shippingInfo,

        manufacturer: product.manufacturer,
        brand: product.brand,
        modelName: product.modelName,
        origin: product.origin,
        detailFeatures: product.detailFeatures,
        productForm: product.productForm,
        capacity: product.capacity,
        keyFeatures: product.keyFeatures,
      );
    });
  }

  @override
  Future<void> sync() async {
    final categories = await remote.fetchCategories();
    final items = await remote.fetchProducts();

    final installedMap = await dao.getInstalledMap();

    final catComp = categories
        .map((c) => CategoriesCompanion.insert(
      id: drift.Value(c.id),
      name: c.name,
    ))
        .toList();

    final List<AppsCompanion> productComp = [];
    final joins = <AppCategoryJoinsCompanion>[];

    for (final a in items) {
      final preservedInstalled = installedMap[a.id] ?? false;
      productComp.add(
          AppsCompanion.insert(
              id: drift.Value(a.id),
              name: a.name,
              shortDesc: drift.Value(a.shortDesc),
              description: drift.Value(a.description),
              url: a.url,
              imageUrl: a.imageUrl,
              price: drift.Value(a.price),
              shippingFee: drift.Value(a.shippingFee),
              installed: drift.Value(preservedInstalled),
            savingInfo: drift.Value(a.savingInfo),
            benefitInfo: drift.Value(a.benefitInfo),
            shippingInfo: drift.Value(a.shippingInfo),

            manufacturer: drift.Value(a.manufacturer),
            brand: drift.Value(a.brand),
            modelName: drift.Value(a.modelName),
            origin: drift.Value(a.origin),
            detailFeatures: drift.Value(a.detailFeatures),
            productForm: drift.Value(a.productForm),
            capacity: drift.Value(a.capacity),
            keyFeatures: drift.Value(a.keyFeatures),

            updatedAt: drift.Value(DateTime.now()),
          )
      );

      for (final cid in a.categoryIds) {
        joins.add(
          AppCategoryJoinsCompanion.insert(
            appId: a.id,
            categoryId: cid,
          ),
        );

        // 만약 여기서 "int -> Value<int>" 에러 나면 아래처럼 바꿔:
        // joins.add(AppCategoryJoinsCompanion(
        //   appId: drift.Value(a.id),
        //   categoryId: drift.Value(cid),
        // ));
      }
    }

    await dao.replaceAll(
      newProducts: productComp,
      newCategories: catComp,
      newJoins: joins,
    );
  }

  @override
  Future<void> setInstalled(int productId, bool installed) => dao.setInstalled(productId, installed);

  List<ProductEntity> _mapProducts(List<App> list) {
    return list.map((a) {
      return ProductEntity(
        id: a.id,
        name: a.name,
        shortDesc: a.shortDesc,
        url: a.url,
        imageUrl: a.imageUrl,
        storeName: a.storeName,
        siteType: a.siteType,
        installed: a.installed,
        description: a.description,
        price: a.price,
        shippingFee: a.shippingFee,
      );
    }).toList();
  }

  @override
  Stream<List<ProductEntity>> watchSearch(String query) {
    return dao.watchSearch(query).map(_mapProducts);
  }
}
