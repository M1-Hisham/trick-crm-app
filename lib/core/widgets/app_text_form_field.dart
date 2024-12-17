import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../resources/resources.dart';

/// Generic TextFormField
class AppTextFormField extends StatelessWidget {
  final String hintText;
  final bool? isObscureText;
  final EdgeInsetsGeometry? contentPadding;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final TextEditingController? controller;
  final TextInputType? keyboardType;
  final TextStyle? hintStyle;
  final TextStyle? style;
  final Color? cursorColor;
  final Color? cursorErrorColor;
  final Color? hoverColor;
  final Color? fillColor;
  final FormFieldValidator<String>? validator;
  final FocusNode? focusNode;
  final FocusNode? nextFocusNode;

  const AppTextFormField({
    super.key,
    required this.hintText,
    this.contentPadding,
    this.isObscureText,
    this.hintStyle,
    this.style,
    this.suffixIcon,
    this.prefixIcon,
    this.controller,
    this.keyboardType,
    this.validator,
    this.cursorColor,
    this.cursorErrorColor,
    this.hoverColor,
    this.fillColor,
    this.focusNode,
    this.nextFocusNode,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onFieldSubmitted: (value) =>
          FocusScope.of(context).requestFocus(nextFocusNode),
      focusNode: focusNode,
      decoration: InputDecoration(
        hintText: hintText,
        isDense: true,
        contentPadding: contentPadding ??
            EdgeInsets.symmetric(horizontal: 20.w, vertical: 19.h),
        hintStyle: hintStyle ?? R.textStyles.font15RegentGrayW500,
        suffixIcon: suffixIcon,
        hoverColor: hoverColor ?? R.colors.primaryColor,
        filled: true,
        fillColor: fillColor ?? const Color(0xFFF7F8F9),
        alignLabelWithHint: true,
        // label: ,
        prefixIcon: prefixIcon,
        border: const OutlineInputBorder(
          borderSide: BorderSide(
            color: Color.fromARGB(255, 139, 139, 139),
          ),
          // borderRadius: BorderRadius.all(Radius.circular(10)),
        ),
        focusedBorder: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(14)),
          borderSide: BorderSide(
            color: Color.fromARGB(255, 139, 139, 139),
          ),
        ),
        enabledBorder: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(8)),
          borderSide: BorderSide(
            color: Color(0xFFE8ECF4),
          ),
        ),
        errorBorder: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(10)),
          borderSide: BorderSide(
            color: Colors.red,
          ),
        ),
        focusedErrorBorder: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(10)),
          borderSide: BorderSide(
            color: Colors.red,
          ),
        ),
        disabledBorder: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(10)),
          borderSide: BorderSide(
            color: Color.fromARGB(255, 139, 139, 139),
          ),
        ),
      ),
      controller: controller,
      keyboardType: keyboardType ?? TextInputType.text,
      style: style,
      obscureText: isObscureText ?? false,
      cursorColor: cursorColor ?? R.colors.primaryColor,
      cursorErrorColor: cursorErrorColor ?? R.colors.red,
      validator: (value) {
        return validator?.call(value);
      },
    );
  }
}
