import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../core/helpers/spacing.dart';
import '../../../../core/resources/resources.dart';

class HomeCard extends StatelessWidget {
  final String icon;
  final String title;
  final String numberOfTitle;
  final VoidCallback? onTap;
  const HomeCard({
    super.key,
    required this.icon,
    required this.title,
    required this.numberOfTitle,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Card(
        color: R.colors.white,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            children: [
              SvgPicture.asset(
                icon,
                width: 84.w,
                height: 84.h,
              ),
              spacingH(23),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: R.textStyles.font14DimGrayW400,
                  ),
                  spacingV(10),
                  // $ number of clients here
                  Text(
                    numberOfTitle,
                    style: R.textStyles.font24DarkCharcoalW600,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
