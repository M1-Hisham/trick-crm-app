import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:trick_crm_app/core/helpers/spacing.dart';
import 'package:trick_crm_app/core/widgets/app_text_form_field.dart';

import '../../../../core/resources/resources.dart';
import '../../../../core/widgets/app_button.dart';

createLead(context) {
  return Get.bottomSheet(
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(13),
        topRight: Radius.circular(13),
      ),
    ),
    backgroundColor: Theme.of(context).scaffoldBackgroundColor,
    enterBottomSheetDuration: const Duration(milliseconds: 300),
    exitBottomSheetDuration: const Duration(milliseconds: 300),
    GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: SingleChildScrollView(
        child: Column(
          children: [
            Container(
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
                      child: SvgPicture.asset(R.icons.closeIcon),
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
                                "Create New Lead",
                                style: R.textStyles.font17whiteW600,
                              ),
                              Text(
                                "complete all the fields below the form",
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
            ),
            Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  spacingV(17),
                  Text(
                    "Image",
                    style: R.textStyles.font17PrimaryW600,
                  ),
                  spacingV(13),
                  Row(
                    children: [
                      CircleAvatar(
                          radius: 50.r, backgroundColor: R.colors.regentGray),
                      spacingH(14),
                      const Text("Accept images: JPG, PNG,\nJPG2000, GIF,...")
                    ],
                  ),
                  spacingV(20),
                  ...leadInformation(),
                  ...contactInformation(),
                  ...addressInformation(),
                  ...descriptionInformation(),
                  spacingV(20),
                  Row(
                    children: [
                      Expanded(
                        child: AppButton(
                          icon: SvgPicture.asset(R.icons.createLeads),
                          text: "Create Lead",
                          onPressed: Get.back,
                        ),
                      ),
                      spacingH(10),
                      Expanded(
                        child: AppButton(
                          text: "Cancel",
                          textStyle: R.textStyles.font14DimGrayW400.copyWith(
                            fontWeight: FontWeight.w500,
                          ),
                          onPressed: Get.back,
                          backgroundColor: R.colors.white,
                          borderColor: const Color(0xffC8C8C8),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    ),
  );
}

List<Widget> leadInformation() {
  return [
    Text(
      "Lead Information",
      style: R.textStyles.font17PrimaryW600,
    ),
    spacingV(20),
    AppTextFormField(
      labelText: "Lead Owner",
      hintText: "hintText",
      fillColor: R.colors.white,
    ),
    spacingV(20),
    AppTextFormField(
      labelText: "Assign To",
      hintText: "hintText",
      fillColor: R.colors.white,
    ),
    spacingV(20),
  ];
}

List<Widget> contactInformation() {
  return [
    Text(
      "Contact Information",
      style: R.textStyles.font17PrimaryW600,
    ),
    spacingV(20),
    AppTextFormField(
      labelText: "First Name",
      hintText: "hintText",
      fillColor: R.colors.white,
    ),
    spacingV(20),
    AppTextFormField(
      labelText: "Last Name",
      hintText: "hintText",
      fillColor: R.colors.white,
    ),
    spacingV(20),
    AppTextFormField(
      labelText: "Email",
      hintText: "hintText",
      fillColor: R.colors.white,
    ),
    spacingV(20),
    AppTextFormField(
      labelText: "Title",
      hintText: "hintText",
      fillColor: R.colors.white,
    ),
    spacingV(20),
    AppTextFormField(
      labelText: "Phone Number",
      hintText: "hintText",
      fillColor: R.colors.white,
    ),
    spacingV(20),
    AppTextFormField(
      hintText: "Sec Phone Number",
      labelText: "First Name",
      fillColor: R.colors.white,
    ),
    spacingV(20),
    AppTextFormField(
      labelText: "Company",
      hintText: "hintText",
      fillColor: R.colors.white,
    ),
    spacingV(20),
    AppTextFormField(
      labelText: "Industry",
      hintText: "hintText",
      fillColor: R.colors.white,
    ),
    spacingV(20),
    AppTextFormField(
      labelText: "Rating",
      hintText: "hintText",
      fillColor: R.colors.white,
    ),
    spacingV(20),
    AppTextFormField(
      labelText: "Annual Revenue",
      hintText: "hintText",
      fillColor: R.colors.white,
    ),
    spacingV(20),
    AppTextFormField(
      labelText: "Website",
      hintText: "hintText",
      fillColor: R.colors.white,
    ),
    spacingV(20),
    AppTextFormField(
      labelText: "Lead Source",
      hintText: "hintText",
      fillColor: R.colors.white,
    ),
    spacingV(20),
    AppTextFormField(
      hintText: "Lead Status",
      labelText: "Last Name",
      fillColor: R.colors.white,
    ),
    spacingV(20),
    AppTextFormField(
      hintText: "Secondary Email",
      labelText: "Last Name",
      fillColor: R.colors.white,
    ),
    spacingV(20),
  ];
}

List<Widget> addressInformation() {
  return [
    Text(
      "Lead Information",
      style: R.textStyles.font17PrimaryW600,
    ),
    spacingV(20),
    AppTextFormField(
      labelText: "State",
      hintText: "hintText",
      fillColor: R.colors.white,
    ),
    spacingV(20),
    AppTextFormField(
      labelText: "Counntry",
      hintText: "hintText",
      fillColor: R.colors.white,
    ),
    spacingV(20),
    AppTextFormField(
      labelText: "City",
      hintText: "hintText",
      fillColor: R.colors.white,
    ),
    spacingV(20),
  ];
}

List<Widget> descriptionInformation() {
  return [
    Text(
      "Description Information",
      style: R.textStyles.font17PrimaryW600,
    ),
    spacingV(20),
    AppTextFormField(
      labelText: "Description",
      hintText: "hintText",
      fillColor: R.colors.white,
      maxLines: 5,
    ),
    spacingV(20),
  ];
}
