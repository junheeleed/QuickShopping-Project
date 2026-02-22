import '../repositories/search_repository.dart';

class DeleteRecentKeyword {
  final SearchRepository repo;
  DeleteRecentKeyword(this.repo);
  Future call(String keyword) => repo.deleteRecentKeyword(keyword);
}