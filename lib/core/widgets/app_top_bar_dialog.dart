import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../../../../../core/helpers/spacing.dart';
import '../../../../../core/resources/resources.dart';

Container appTopBarDialog(String title, String subTitle) {
  return Container(
    decoration: BoxDecoration(
      color: R.colors.primaryColor,
      borderRadius: const BorderRadius.only(
        topLeft: Radius.circular(13),
        topRight: Radius.circular(13),
      ),
    ),
    child: Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 8, right: 8),
          child: Align(
            alignment: Alignment.topRight,
            child: GestureDetector(
                onTap: () => Get.back(),
                child: SvgPicture.asset(R.icons.closeIcon)),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 20, bottom: 20),
          child: Row(
            children: [
              SvgPicture.asset(R.icons.subtract),
              spacingH(10),
              Padding(
                padding: const EdgeInsets.only(top: 8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: R.textStyles.font17whiteW600,
                    ),
                    Text(
                      subTitle,
                      style: R.textStyles.font14WhiteW500,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    ),
  );
}
