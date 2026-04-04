import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'app/binding/initial_binding.dart';
import 'app/routes/app_pages.dart';
import 'app/routes/app_routes.dart';

import 'presentation/responsive/responsive.dart';
import 'presentation/theme/app_theme.dart';

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

      builder: (context, child) {
        final size = ResponsiveLayout.screenSizeOf(context);
        final brightness = MediaQuery.platformBrightnessOf(context);
        final theme = AppTheme.forSize(size, brightness);
        return Theme(data: theme, child: child ?? const SizedBox.shrink());
      },
    );
  }
}