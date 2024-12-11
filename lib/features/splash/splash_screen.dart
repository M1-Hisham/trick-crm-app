import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:trick_crm_app/core/routes/routes.dart';

import '../../core/resources/resources.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    initialization();
  }

  /// initlizetion of the splash screen
  void initialization() async {
    Future.delayed(const Duration(seconds: 3), () {
      Get.toNamed(RoutesNames.login);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: R.colors.white,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Image.asset(
              R.icons.logo,
              height: 86.h,
              width: 196.w,
            ),
          ),
        ],
      ),
    );
  }
}
