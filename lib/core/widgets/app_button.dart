import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../resources/resources.dart';

/// Generic button widget
class AppButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String text;
  final double? heigth;
  final double? borderRadius;
  final Color? backgroundColor;
  final EdgeInsetsGeometry? padding;
  final TextStyle? textStyle;
  const AppButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.heigth,
    this.backgroundColor,
    this.borderRadius,
    this.padding,
    this.textStyle,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: heigth == null ? 56.h : heigth!.h,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: backgroundColor ?? R.colors.primaryColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(borderRadius?.r ?? 5.r),
          ),
        ),
        child: Padding(
          padding: padding ?? EdgeInsets.symmetric(horizontal: 16.w),
          child: Text(
            text,
            style: textStyle ?? R.textStyles.font18WhiteW600,
          ),
        ),
      ),
    );
  }
}
