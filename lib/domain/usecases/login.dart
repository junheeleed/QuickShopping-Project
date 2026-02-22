import '../../domain/repositories/auth_repository.dart';

class Login {
  final AuthRepository repo;
  Login(this.repo);

  Future<void> call(String email, String password) =>
      repo.login(email: email, password: password);
}