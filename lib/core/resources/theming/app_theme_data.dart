import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../resources.dart';

class AppThemeData {
  final ThemeData theme = ThemeData(
    // scaffoldBackgroundColor: const Color(0xFFFBFDFF),
    primaryColor: R.colors.primaryColor,
    appBarTheme: AppBarTheme(
      centerTitle: true,
      titleTextStyle: R.textStyles.font18WhiteW600.copyWith(
        fontSize: 22.sp,
        fontWeight: FontWeight.w700,
      ),
      iconTheme: IconThemeData(
        color: R.colors.white,
      ),
    ),
  );
}
