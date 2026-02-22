import 'package:quick_shopping/domain/entities/recent_keyword_entity.dart';

import '../../../domain/repositories/search_repository.dart';
import '../db/app_database.dart';

class SearchRepositoryImpl implements SearchRepository {
  final RecentSearchDao recentDao;

  SearchRepositoryImpl({
    required this.recentDao,
  });

  @override
  Stream<List<RecentKeywordEntity>> watchRecent() {
    return recentDao.watchRecent().map(_mapRecentKeywords);
  }

  List<RecentKeywordEntity> _mapRecentKeywords(List<RecentSearche> list) {
    return list.map((keyword) {
      return RecentKeywordEntity(
        keyword: keyword.keyword,
        date: keyword.searchedAt,
      );
    }).toList();
  }

  @override
  Future insertRecentKeyword(String query) async {
    await recentDao.upsertKeyword(query);
  }

  @override
  Future deleteRecentKeyword(String keyword) async {
    await recentDao.deleteKeyword(keyword);
  }

  @override
  Future clearRecentKeyword() async {
    await recentDao.clearAll();
  }
}
