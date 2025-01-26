import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../../../../../core/helpers/spacing.dart';
import '../../../../../core/resources/resources.dart';
import '../../../../../core/widgets/app_button.dart';
import '../../../../../core/widgets/app_text_form_field.dart';
import 'upload_image.dart';

final Map<String, dynamic> _requiredFields = {
  'Lead Information': null,
  'Lead Owner': 'selection',
  'Assign To': 'selection',
  'Contact Information': null,
  'First Name': true,
  'Last Name': true,
  'Email': true,
  'Title': false,
  'Phone Number': true,
  'Sec Phone Number': false,
  'Company': false,
  'Industry': 'selection',
  'Rating': 'selection',
  'Annual Revenue': false,
  'Website': false,
  'Lead Source': 'selection',
  'Lead Status': 'selection',
  'Secondary Email': false,
  'Address Information': null,
  'State': false,
  'Country': false,
  'City': false,
  'Description Information': null,
  'Description': false,
};
final Map<String, dynamic> _formData = {};

ScrollController scrollController = ScrollController();

ListView userFormLoading(context) {
  return ListView(
    controller: scrollController,
    shrinkWrap: true,
    padding: const EdgeInsets.all(20),
    children: [
      spacingV(120),
      ...uploadImage(
        fun: (pickedFile) {
          if (pickedFile != null) {
            _formData['Image'] = pickedFile.path;
          }
        },
      ),
      spacingV(20),
      Form(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ..._getListInformation(context),
          ],
        ),
      ),
      ..._submitAndCancel(context),
      spacingV(20),
    ],
  );
}

List<Widget> _getListInformation(context) {
  List<Widget> childs = [];
  const sectionHeaders = [
    'Lead Information',
    'Contact Information',
    'Address Information',
    'Description Information',
  ];

  for (String fieldName in _requiredFields.keys) {
    if (sectionHeaders.contains(fieldName)) {
      childs.add(
        Padding(
          padding: const EdgeInsets.only(bottom: 12),
          child: Text(
            fieldName,
            style: R.textStyles.font17PrimaryW600,
          ),
        ),
      );
    } else {
      childs.add(
        Padding(
          padding: const EdgeInsets.only(bottom: 22),
          child: AppTextFormField(
            labelText: fieldName,
            hintText: '',
            fillColor: R.colors.white,
            maxLines: fieldName == 'Description' ? 3 : 1,
            onSaved: (value) {
              _formData[fieldName] = value;
            },
          ),
        ),
      );
    }
  }
  return childs;
}

List<Widget> _submitAndCancel(context) {
  return [
    Row(
      children: [
        Expanded(
          child: AppButton(
            icon: SvgPicture.asset(R.icons.createLeads),
            text: "Create Lead",
            onPressed: (){},
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
            overlayColor: R.colors.primaryColor,
          ),
        ),
      ],
    ),
  ];
}

