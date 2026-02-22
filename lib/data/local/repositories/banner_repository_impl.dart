import 'dart:ui';

import 'package:drift/drift.dart' as drift;

import '../../../domain/entities/home_banner_entity.dart';
import '../../../domain/repositories/banner_repository.dart';
import '../db/app_database.dart';

class BannerRepositoryImpl implements BannerRepository {
  final HomeBannerDao dao;

  BannerRepositoryImpl({
    required this.dao,
  });


  @override
  Future<List<HomeBanner>> getOnce() async {
    return await dao.getOnce();
  }

  @override
  Future<dynamic> insertAll() async {
    return await dao.upsertAll(_seedBanners());
  }

  List<HomeBannersCompanion> _seedBanners() {
    return [
      HomeBannersCompanion.insert(
        id: drift.Value(1),
        title: '제일 중요한 건 건강\n자기 관리 템 준비',
        subtitle: '최대 10% 할인',
        targetUrl: 'https://brand.naver.com/hleshop/products/11525829619',
        imageUrl: drift.Value('https://shop-phinf.pstatic.net/20250808_170/1754639742283IdNA0_PNG/88772567333979173_717965079.png?type=o1000'),
        gradA: const Color(0xFFC23A3A).value,
        gradB: const Color(0xFFB12222).value,
        sortOrder: 1,
      ),
      HomeBannersCompanion.insert(
        id: drift.Value(2),
        title: '매일 11시, 오늘꿀딜',
        subtitle: '무료배송에 최대 혜택까지!',
        targetUrl: 'https://brand.naver.com/jyns/products/6576886971?nl-au=63887eaef2b44bed88970aa4a4268b3c', // ✅ 너가 준 URL
        imageUrl: drift.Value('https://shopping-phinf.pstatic.net/main_3246701/32467012122.20260117074526.jpg'),
        gradA: const Color(0xFF575B7D).value,
        gradB: const Color(0xFF3D4061).value,
        sortOrder: 2,
      ),
      HomeBannersCompanion.insert(
        id: drift.Value(3),
        title: '관심 있을\n행사 상품 추천!',
        subtitle: '최대 혜택 놓치지 마세요',
        targetUrl: 'https://brand.naver.com/meditree/products/7868256026',
        imageUrl: drift.Value('https://shop-phinf.pstatic.net/20260206_258/17703486171020LUGv_JPEG/61149589401867343_129845859.jpg?type=o1000'),
        gradA: const Color(0xFF4A1A83).value,
        gradB: const Color(0xFF2B0E52).value,
        sortOrder: 3,
      ),
    ];
  }

  @override
  Stream<List<HomeBannerEntity>> watchBanners() {
    return dao.watchBanners().map(_mapBanners);
  }

  List<HomeBannerEntity> _mapBanners(List<HomeBanner> list) {
    return list.map((banner) {
      return HomeBannerEntity(
        id: banner.id,
        title: banner.title,
        subtitle: banner.subtitle,
        targetUrl: banner.targetUrl,
        imageUrl: banner.imageUrl,
        gradA: banner.gradA,
        gradB: banner.gradB,
        sortOrder: banner.sortOrder,
      );
    }).toList();
  }

}
