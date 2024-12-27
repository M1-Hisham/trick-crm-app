import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../../../../../core/helpers/spacing.dart';
import '../../../../../core/resources/resources.dart';
import '../../../../../core/widgets/app_button.dart';
import '../../../../../core/widgets/app_text_form_field.dart';
import 'uploud_image.dart';

final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

final Map<String, dynamic> _requiredFields = {
  'Lead Information': null,
  'Lead Owner': false,
  'Assign To': false,
  'Contact Information': null,
  'First Name': true,
  'Last Name': true,
  'Email': true,
  'Title': false,
  'Phone Number': true,
  'Sec Phone Number': false,
  'Company': false,
  'Industry': false,
  'Rating': false,
  'Annual Revenue': false,
  'Website': false,
  'Lead Source': false,
  'Lead Status': false,
  'Secondary Email': false,
  'Address Information': null,
  'State': false,
  'Counntry': false,
  'City': false,
  'Description Information': null,
  'Description': false,
};
final Map<String, String> _formData = {};

ScrollController scrollController = ScrollController();

ListView userForm(context) {
  return ListView(
    controller: scrollController,
    shrinkWrap: true,
    padding: const EdgeInsets.all(20),
    children: [
      spacingV(120),
      ...uploudImage(),
      spacingV(20),
      Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ..._getListInformation(),
          ],
        ),
      ),
      ..._submitAndCancel(context),
      spacingV(20),
    ],
  );
}

List<Widget> _getListInformation() {
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
            keyboardType: _getKeyboardType(fieldName),
            maxLines: fieldName == 'Description' ? 3 : 1,
            onSaved: (value) {
              _formData[fieldName] = value!;
            },
            validator: (value) => _validateAllFields(fieldName, value),
          ),
        ),
      );
    }
  }
  return childs;
}

_validateAllFields(fieldName, value) {
  if (_requiredFields[fieldName] == true) {
    if (value == null || value.isEmpty) {
      _scrollToTop();
      return 'Please enter a valid $fieldName';
    }

    switch (fieldName) {
      case 'Email':
        if (!GetUtils.isEmail(value)) {
          _scrollToTop();
          return 'Please enter a valid email address';
        }
        break;
      case 'Phone Number':
        if (!GetUtils.isPhoneNumber(value)) {
          _scrollToTop();
          return 'Please enter a valid phone number';
        }
        break;
      case 'First Name':
        var checkName =
            RegExp(r'[!@#<>?":_`~;[\]\\|=+)(*&^%0-9-]').hasMatch(value);
        if (checkName) {
          _scrollToTop();
          return 'Change first name';
        }
        break;
      case 'Last Name':
        var checkName =
            RegExp(r'[!@#<>?":_`~;[\]\\|=+)(*&^%0-9-]').hasMatch(value);
        if (checkName) {
          _scrollToTop();
          return 'Change last name';
        }
        break;
      default:
        break;
    }
  }
  return null;
}

void _scrollToTop() {
  scrollController.animateTo(0,
      duration: const Duration(milliseconds: 1600), curve: Curves.easeIn);
}

_getKeyboardType(String fieldName) {
  return switch (fieldName) {
    'Phone Number' => TextInputType.phone,
    'Sec Phone Number' => TextInputType.phone,
    'Email' => TextInputType.emailAddress,
    'Secondary Email' => TextInputType.emailAddress,
    _ => null,
  };
}

List<Widget> _submitAndCancel(context) {
  return [
    Row(
      children: [
        Expanded(
          child: AppButton(
            icon: SvgPicture.asset(R.icons.createLeads),
            text: "Create Lead",
            onPressed: () => _submitCrateLead(),
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

void _submitCrateLead() {
  if (_formKey.currentState!.validate()) {
    _formKey.currentState?.save();
    // context.read.<CreateLeadCubit>(getIt())
    Get.back();
  }
}
