import '../entities/auth_profile_entity.dart';

abstract class AuthRepository {
  Stream<AuthProfileEntity> watchProfile();
  Future<void> signup({required String email, required String password});
  Future<void> login({required String email, required String password});
  Future<void> logout();
}
