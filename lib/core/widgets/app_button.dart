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
  final Color? borderColor;
  final Color? overlayColor;
  final TextStyle? textStyle;
  final Widget? icon;
  const AppButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.heigth,
    this.backgroundColor,
    this.borderRadius,
    this.textStyle,
    this.icon,
    this.borderColor,
    this.overlayColor,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: heigth == null ? 56.h : heigth!.h,
      child: ElevatedButton.icon(
        onPressed: onPressed,
        icon: icon,
        iconAlignment: IconAlignment.start,
        style: OutlinedButton.styleFrom(
          overlayColor: overlayColor,
          side: BorderSide(color: borderColor ?? Colors.transparent),
          backgroundColor: backgroundColor ?? R.colors.primaryColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(borderRadius?.r ?? 5.r),
          ),
        ),
        label: FittedBox(
          child: Text(
            text,
            style: textStyle ?? R.textStyles.font18WhiteW600,
          ),
        ),
      ),
    );
  }
}
