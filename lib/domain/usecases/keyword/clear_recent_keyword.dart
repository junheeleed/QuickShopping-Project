import '../../repositories/search_repository.dart';

class ClearRecentKeyword {
  final SearchRepository repo;
  ClearRecentKeyword(this.repo);
  Future call() => repo.clearRecentKeyword();
}