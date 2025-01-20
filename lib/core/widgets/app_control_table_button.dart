import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../resources/resources.dart';

class ControlTableButton extends StatelessWidget {
  final Icon? icon;
  final double? iconSize;
  final double? borderRadius;
  final Color? color;
  final Color? colorBorderSide;
  final void Function()? onPressed;
  const ControlTableButton({
    super.key,
    this.icon,
    required this.onPressed,
    this.iconSize,
    this.color,
    this.borderRadius,
    this.colorBorderSide,
  });

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: onPressed,
      icon: icon ?? const SizedBox.shrink(),
      iconSize: iconSize,
      style: ButtonStyle(
        minimumSize: WidgetStateProperty.all<Size>(
          Size(28.w, 28.h),
        ),
        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
        overlayColor: WidgetStateProperty.all<Color>(R.colors.primaryColor),
        backgroundColor: WidgetStateProperty.all<Color>(
          color ?? const Color(0xFFF4F4F4),
        ),
        shape: WidgetStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(
            side: BorderSide(
              color: colorBorderSide ?? const Color(0xffE5E5E5),
            ),
            borderRadius: BorderRadius.all(
              Radius.circular(borderRadius ?? 5.r),
            ),
          ),
        ),
      ),
    );
  }
}
