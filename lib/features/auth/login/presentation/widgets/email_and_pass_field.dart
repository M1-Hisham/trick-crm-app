import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:trick_crm_app/features/auth/login/logic/cubit/login_cubit.dart';

import '../../../../../core/helpers/spacing.dart';
import '../../../../../core/resources/resources.dart';
import '../../../../../core/widgets/app_text_form_field.dart';

class EmailAndPassField extends StatefulWidget {
  const EmailAndPassField({super.key});

  @override
  State<EmailAndPassField> createState() => _EmailAndPassFieldState();
}

class _EmailAndPassFieldState extends State<EmailAndPassField> {
  FocusNode passwordNode = FocusNode();
  bool isObscureText = true;
  @override
  Widget build(BuildContext context) {
    // cubit read from context
    final LoginCubit cubitRead = context.read<LoginCubit>();
    return Form(
      key: cubitRead.formKey,
      child: Column(
        children: [
          AppTextFormField(
              hintText: "Enter your email",
              controller: cubitRead.email,
              keyboardType: TextInputType.emailAddress,
              nextFocusNode: passwordNode,
              validator: (value) {
                if (GetUtils.isNull(value!)) {
                  return 'Please enter your email';
                } else if (!GetUtils.isEmail(value)) {
                  return 'Please enter a valid email';
                }
                return null;
              }),
          spacingV(15),
          AppTextFormField(
            hintText: "Enter your password",
            controller: cubitRead.password,
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
            validator: (value) {
              // tODO: add more validation
              if (value == null || value.isEmpty) {
                return "Please enter your password";
              } else if (value.length < 8) {
                return "Password must be at least 8 characters";
              }
              return null;
            },
          ),
        ],
      ),
    );
  }
}
