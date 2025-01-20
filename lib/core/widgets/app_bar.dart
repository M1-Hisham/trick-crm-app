import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../resources/resources.dart';

AppBar appBar(String title) {
  return AppBar(
    forceMaterialTransparency: true,
    toolbarHeight: 60.h,
    flexibleSpace: Container(
      decoration: BoxDecoration(
        color: R.colors.primaryColor,
        borderRadius: const BorderRadius.only(
          bottomLeft: Radius.circular(35),
          bottomRight: Radius.circular(35),
        ),
      ),
    ),
    leading: const BackButton(),
    centerTitle: true,
    title: Text(title),
    // nottification icon
    actions: [
      Padding(
        padding: EdgeInsets.only(right: 16.w),
        child: IconButton(
          onPressed: () {
            //? Add your action here
          },
          icon: SvgPicture.asset(
            R.icons.notification,
            width: 32.w,
            height: 32.h,
          ),
        ),
      ),
    ],
  );
}
