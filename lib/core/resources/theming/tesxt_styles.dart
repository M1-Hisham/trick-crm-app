import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import '../resources.dart';

class AppTextStyles {
  TextStyle font40BlackBold = GoogleFonts.poppins(
    textStyle: TextStyle(
      fontSize: 40.sp,
      color: R.colors.black,
      height: 1.1,
      fontWeight: FontWeight.bold,
    ),
  );
  TextStyle font20Gray29W500 = GoogleFonts.poppins(
    textStyle: TextStyle(
      fontSize: 20.sp,
      fontWeight: FontWeight.w500,
      color: const Color(0xFF4A4A4A),
    ),
  );
  TextStyle font18WhiteW600 = GoogleFonts.poppins(
    textStyle: TextStyle(
      fontSize: 18.sp,
      color: R.colors.white,
      fontWeight: FontWeight.w600,
    ),
  );
  TextStyle font15BlackW500 = GoogleFonts.poppins(
    textStyle: TextStyle(
      fontSize: 15.sp,
      color: R.colors.regentGray,
      fontWeight: FontWeight.w500,
    ),
  );
  TextStyle font14darkGeryW600 = GoogleFonts.poppins(
    textStyle: TextStyle(
      fontSize: 14.sp,
      color: R.colors.darkGery,
      fontWeight: FontWeight.w600,
    ),
  );
}
