import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quick_shopping/presentation/root/root_page.dart';
import 'app/app.dart';
import 'app/binding/initial_binding.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'app/routes/app_pages.dart';
import 'app/routes/app_routes.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const QuickShoppingApp());
}

class QuickShoppingApp extends StatelessWidget {
  const QuickShoppingApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(390, 844),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (_, child) {
          return GetMaterialApp(
            debugShowCheckedModeBanner: false,
            initialBinding: InitialBinding(),
            getPages: AppPages.pages,
            initialRoute: Routes.root,
            theme: AppTheme.light,
            darkTheme: AppTheme.dark,
            themeMode: ThemeMode.system,
          );
        },
        child: const RootPage()
    );
  }
}
