import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../../../../core/helpers/spacing.dart';
import '../../../../../../../core/resources/resources.dart';

/// Generate a card view for the leads view
cardLeadView(String title, String icon) {
  return GestureDetector(
    onTap: () {
      // Navigate to ...
    },
    child: Padding(
      padding: const EdgeInsets.only(bottom: 15.0),
      child: Card(
        color: R.colors.white,
        child: ListTile(
          title: Padding(
            padding: const EdgeInsets.symmetric(
              vertical: 18.0,
              // horizontal: 9.0,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Logo
                Container(
                  height: 50,
                  width: 50,
                  decoration: BoxDecoration(
                    gradient: const LinearGradient(
                      colors: <Color>[
                        Color(0x78C8F9FF),
                        Color(0x78D3EDF0),
                      ],
                    ),
                    borderRadius: BorderRadius.circular(90),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(14),
                    child: SvgPicture.asset(
                      R.icons.iconsLeadView[icon] ?? '',
                      width: 42,
                      height: 42,
                    ),
                  ),
                ),
                spacingH(10),
                // Name
                Text(
                  title,
                  style: R.textStyles.font20ShadowGray29W500.copyWith(
                    fontWeight: FontWeight.w600,
                    color: const Color(0xFF333333),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    ),
  );
}
