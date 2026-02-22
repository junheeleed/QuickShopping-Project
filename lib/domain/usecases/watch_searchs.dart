import '../entities/recent_keyword_entity.dart';
import '../repositories/search_repository.dart';

class WatchProducts {
  final SearchRepository repo;
  WatchProducts(this.repo);
  Stream<List<RecentKeywordEntity>> call() => repo.watchRecent();
}