import 'package:get/get.dart';
import '../../domain/usecases/account/login.dart';
import '../../domain/usecases/account/logout.dart';
import '../../domain/usecases/account/sign_up.dart';
import '../../domain/usecases/account/watch_profile.dart';
import 'my_controller.dart';

class MyBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<MyController>(
          () => MyController(
            watchProfile: Get.find<WatchProfile>(),
              signUp: Get.find<SignUp>(),
              login: Get.find<Login>(),
              logout: Get.find<Logout>()
          ),
      fenix: true,
    );
  }
}
