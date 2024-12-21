import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:trick_crm_app/core/helpers/shaerd_pref_helper.dart';
import 'package:trick_crm_app/core/routes/routes.dart';
import 'package:trick_crm_app/core/widgets/app_button.dart';

class Logout extends StatelessWidget {
  const Logout({super.key});

  @override
  Widget build(BuildContext context) {
    return AppButton(
      text: "Logout",
      onPressed: () {
        SharedPrefHelper.clearAllSecuredData();
        log("logout success and clear all data");
        Get.offAllNamed(RoutesNames.login);
      },
    );
  }
}
