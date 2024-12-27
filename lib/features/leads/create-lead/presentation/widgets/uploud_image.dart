import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/helpers/spacing.dart';
import '../../../../../core/resources/resources.dart';

List<Widget> uploudImage() {
  return [
    Text(
      "Image",
      style: R.textStyles.font17PrimaryW600,
    ),
    spacingV(13),
    Row(
      children: [
        InkWell(
          onTap: () {
            //? set image
          },
          splashColor: R.colors.primaryColor,
          child: Container(
            width: 72,
            height: 72,
            decoration: BoxDecoration(
              color: R.colors.secGray,
              borderRadius: BorderRadius.circular(100.r),
            ),
            child: const Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.add,
                  color: Color(0xff727272),
                ),
                Text(
                  "Uploud",
                  style: TextStyle(
                    color: Color(0xff727272),
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                  ),
                )
              ],
            ),
          ),
        ),
        spacingH(14),
        const Text("Accept images: JPG, PNG,\nJPG2000, GIF,...")
      ],
    ),
  ];
}
