import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'app/app.dart';
import 'app/binding/initial_binding.dart';
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
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      initialBinding: InitialBinding(),
      getPages: AppPages.pages,
      initialRoute: Routes.root,
      theme: AppTheme.light,
      darkTheme: AppTheme.dark,
      themeMode: ThemeMode.system,
    );
  }
}
