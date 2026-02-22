import 'package:quick_shopping/domain/entities/recent_keyword_entity.dart';
import 'package:quick_shopping/domain/repositories/search_repository.dart';


class WatchRecentKeywords {
  final SearchRepository repo;
  WatchRecentKeywords(this.repo);
  Stream<List<RecentKeywordEntity>> call() => repo.watchRecent();
}