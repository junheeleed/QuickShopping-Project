import '../repositories/search_repository.dart';

class InsertRecentKeyword {
  final SearchRepository repo;
  InsertRecentKeyword(this.repo);
  Future call(String query) => repo.insertRecentKeyword(query);
}