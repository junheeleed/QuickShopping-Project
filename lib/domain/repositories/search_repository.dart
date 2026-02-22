import '../entities/recent_keyword_entity.dart';

abstract class SearchRepository {
  Stream<List<RecentKeywordEntity>> watchRecent();
  Future insertRecentKeyword(String query);
  Future deleteRecentKeyword(String keyword);
  Future clearRecentKeyword();
}

