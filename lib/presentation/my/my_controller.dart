import 'dart:async';
import 'package:get/get.dart';
import 'package:quick_shopping/domain/usecases/sign_up.dart';
import '../../domain/entities/auth_profile_entity.dart';
import '../../domain/usecases/login.dart';
import '../../domain/usecases/logout.dart';
import '../../domain/usecases/watch_profile.dart';

class MyController extends GetxController {
  final WatchProfile watchProfile;
  final SignUp signUp;
  final Login login;
  final Logout logout;

  MyController({
    required this.watchProfile,
    required this.signUp,
    required this.login,
    required this.logout,
  });

  final profile = const AuthProfileEntity.guest().obs;
  StreamSubscription<AuthProfileEntity>? _sub;

  @override
  void onInit() {
    super.onInit();
    _sub = watchProfile().listen((p) => profile.value = p);
  }

  Future<void> signup({required String email, required String password}) =>
      signUp(email, password);

  Future<void> loginUser({required String email, required String password}) =>
      login(email, password);

  Future<void> logoutUser() => logout();

  @override
  void onClose() {
    _sub?.cancel();
    super.onClose();
  }
}
