import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:trick_crm_app/core/helpers/spacing.dart';
import 'package:trick_crm_app/core/widgets/app_button.dart';
import 'package:trick_crm_app/core/widgets/app_text_form_field.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../../core/resources/resources.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final GlobalKey formKey = GlobalKey<FormState>();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  FocusNode passwordNode = FocusNode();
  bool isObscureText = true;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        backgroundColor: R.colors.white,
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 35.w, vertical: 55.h),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                spacingV(15),
                Image.asset(R.icons.logo),
                spacingV(101),
                Text(
                  "Welcome back!\nGlad to see you,\nAgain!",
                  style: R.textStyles.font40BlackBold,
                ),
                spacingV(74),
                Form(
                  key: formKey,
                  child: Column(
                    children: [
                      AppTextFormField(
                        hintText: "Enter your email",
                        controller: email,
                        keyboardType: TextInputType.emailAddress,
                        nextFocusNode: passwordNode,
                      ),
                      spacingV(15),
                      AppTextFormField(
                        hintText: "Enter your password",
                        controller: password,
                        isObscureText: isObscureText,
                        focusNode: passwordNode,
                        keyboardType: TextInputType.visiblePassword,
                        suffixIcon: IconButton(
                          onPressed: () {
                            setState(() {
                              isObscureText = !isObscureText;
                            });
                            log("Show Password");
                          },
                          icon: isObscureText
                              ? SvgPicture.asset(
                                  R.icons.eye,
                                )
                              : const Icon(Icons.visibility_off_outlined),
                        ),
                      ),
                    ],
                  ),
                ),
                spacingV(11),
                GestureDetector(
                  onTap: () {
                    //TODO: Forgot Password
                    log("Forgot Password?");
                  },
                  child: Align(
                    alignment: Alignment.centerRight,
                    child: Text(
                      "Forgot Password?",
                      style: R.textStyles.font14darkGeryW600,
                    ),
                  ),
                ),
                spacingV(39),
                AppButton(
                  onPressed: () {
                    _showSnackBar("Login");
                  },
                  text: "Login",
                  borderRadius: 8,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _showSnackBar(String message) {
    final snackBar = SnackBar(content: Text(message));
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
}
