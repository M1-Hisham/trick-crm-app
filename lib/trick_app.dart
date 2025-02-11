import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:trick_crm_app/core/routes/app_router.dart';
import 'package:trick_crm_app/features/splash/splash_screen.dart';

import 'core/resources/resources.dart';

class TrickApp extends StatelessWidget {
  const TrickApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(437, 1003),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (_, child) {
          return GetMaterialApp(
            debugShowCheckedModeBanner: false,
            getPages: AppRouter.routes,
            theme: R.themeData.theme,
            home: const SplashScreen(),
          );
        });
  }
}
