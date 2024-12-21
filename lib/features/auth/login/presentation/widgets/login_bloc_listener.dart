import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:trick_crm_app/core/routes/routes.dart';

import '../../../../../core/resources/resources.dart';
import '../../logic/cubit/login_cubit.dart';
import '../../logic/cubit/login_state.dart';

class LoginBlocListener extends StatelessWidget {
  const LoginBlocListener({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<LoginCubit, LoginState>(
      listenWhen: (previous, current) =>
          current is Success || current is Loading || current is Error,
      listener: (context, state) {
        state.whenOrNull(
          loading: () {
            showDialog(
                context: context,
                builder: (context) {
                  return Center(
                    child: CircularProgressIndicator(
                      color: R.colors.primaryColor,
                    ),
                  );
                });
          },
          success: (loginResponseModel) {
            Get.back();
            showDialog(
                context: context,
                builder: (context) {
                  return Center(child: SvgPicture.asset(R.icons.successmark));
                });
            Future.delayed(
              const Duration(milliseconds: 500),
              () {
                Get.offAllNamed(RoutesNames.home);
              },
            );
          },
          error: (e) {
            Get.back();
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                elevation: 2,
                behavior: SnackBarBehavior.floating,
                showCloseIcon: true,
                backgroundColor: R.colors.red,
                content: Text(
                  'Error, Please check your email & password and try again',
                  style: R.textStyles.font14darkGeryW600
                      .copyWith(color: R.colors.white),
                ),
                duration: const Duration(seconds: 4),
              ),
            );
          },
        );
      },
      child: const SizedBox.shrink(),
    );
  }
}
