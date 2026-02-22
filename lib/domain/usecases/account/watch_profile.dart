import '../../entities/auth_profile_entity.dart';
import '../../repositories/auth_repository.dart';

class WatchProfile {
  final AuthRepository repo;
  WatchProfile(this.repo);
  Stream<AuthProfileEntity> call() => repo.watchProfile();
}