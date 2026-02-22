import 'package:drift/native.dart';

import '../../../domain/auth/auth_exceptions.dart';
import '../../../domain/entities/auth_profile_entity.dart';
import '../../../domain/repositories/auth_repository.dart';
import '../db/app_database.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthDao dao;
  AuthRepositoryImpl({required this.dao});

  @override
  Stream<AuthProfileEntity> watchProfile() {
    return dao.watchProfile().map((row) {
      if (row == null || row.isLoggedIn == false) {
        return const AuthProfileEntity.guest();
      }
      return AuthProfileEntity(
        isLoggedIn: true,
        nickname: row.nickname,
        email: row.email,
      );
    });
  }

  @override
  Future<void> signup({required String email, required String password}) async {
    final e = email.trim();
    final p = password.trim();

    final exist = await dao.findAccountByEmail(e);
    if (exist != null) {
      throw const SignupFailureException(SignupFailureReason.emailAlreadyExists);
    }

    try {
      await dao.createAccount(email: e, password: p);
    } on SqliteException catch (ex) {
      final msg = ex.message.toLowerCase();
      if (msg.contains('unique') || msg.contains('constraint')) {
        throw const SignupFailureException(SignupFailureReason.emailAlreadyExists);
      }
      rethrow;
    }
  }

  @override
  Future<void> login({required String email, required String password}) async {
    final e = email.trim();
    final p = password.trim();

    final account = await dao.findAccountByEmail(e);

    if (account == null) {
      throw const LoginFailureException(LoginFailureReason.emailNotFound);
    }

    if (account.password != p) {
      throw const LoginFailureException(LoginFailureReason.wrongPassword);
    }

    await dao.upsertLoggedIn(email: e);
  }

  @override
  Future<void> logout() => dao.upsertLoggedOut();
}
