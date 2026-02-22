import '../../repositories/auth_repository.dart';

class SignUp {
  final AuthRepository repo;
  SignUp(this.repo);

  Future<void> call(String email, String password) =>
      repo.signup(email: email, password: password);
}