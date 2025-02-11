import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../resources/resources.dart';

AppBar appBar(String title) {
  const double paddingBottom = 12.0;
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
    leading: const Padding(
      padding: EdgeInsets.only(bottom: paddingBottom),
      child: BackButton(),
    ),
    centerTitle: true,
    title: Padding(
      padding: const EdgeInsets.only(bottom: paddingBottom),
      child: Text(title),
    ),
    // nottification icon
    actions: [
      Padding(
        padding: EdgeInsets.only(right: 16.w, bottom: paddingBottom),
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
