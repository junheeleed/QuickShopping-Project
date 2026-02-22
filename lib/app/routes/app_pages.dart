import 'package:get/get.dart';
import '../../presentation/auth/login_page.dart';
import '../../presentation/auth/signup_page.dart';
import '../../presentation/detail/detail_binding.dart';
import '../../presentation/detail/detail_page.dart';
import '../../presentation/home/home_binding.dart';
import '../../presentation/my/my_binding.dart';
import '../../presentation/root/root_page.dart';
import '../../presentation/search/search_binding.dart';
import 'app_routes.dart';

class AppPages {
  static final pages = <GetPage>[
    GetPage(
      name: Routes.root,
      page: () => const RootPage(),
      bindings: [
        HomeBinding(),
        MyBinding(),
        SearchBinding(),
      ],
    ),
    GetPage(
      name: Routes.login,
      page: () => const LoginPage(),
      binding: MyBinding(),
    ),
    GetPage(
      name: Routes.signup,
      page: () => const SignupPage(),
      binding: MyBinding(),
    ),
    GetPage(
      name: '${Routes.detail}/:id',
      page: () => const ProductDetailPage(),
      binding: ProductDetailBinding(),
    ),
  ];
}
