import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:get_it/get_it.dart';
import 'package:trick_crm_app/features/leads/create-lead/logic/cubit/create_lead_cubit.dart';

import '../../../../../core/helpers/spacing.dart';
import '../../../../../core/resources/resources.dart';
import '../../../../../core/widgets/app_button.dart';
import '../../../../../core/widgets/app_selection_form_field.dart';
import '../../../../../core/widgets/app_text_form_field.dart';
import '../../data/models/create_lead_request_body.dart';
import 'uploud_image.dart';

final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

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
final Map<String, String> _formData = {};

ScrollController scrollController = ScrollController();

ListView userForm(context, String userName, List<String> assignedToNames) {
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
            ..._getListInformation(userName, assignedToNames),
          ],
        ),
      ),
      ..._submitAndCancel(context),
      spacingV(20),
    ],
  );
}

List<Widget> _getListInformation(
  String userName,
  List<String> assignedToNames,
) {
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
    } else if (_requiredFields[fieldName] == 'selection') {
      childs.add(
        Padding(
          padding: const EdgeInsets.only(bottom: 22),
          child: AppSelectionFormField(
            labelText: fieldName,
            selections: _selectionCase(fieldName, userName, assignedToNames) ??
                ['none'],
            onSaved: (value) {
              _formData[fieldName] = value!;
            },
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

List<String>? _selectionCase(
  String fieldName,
  String userName,
  List<String> assignedToNames,
) {
  final sectionLeadOwner = [
    '$userName(you)',
  ];
  final sectionAssignTo = [
    '$userName(you)',
    ...assignedToNames,
  ];
  const sectionIndustry = [
    'ASP (Application Service Provider)',
    'Data/Telecom OEM',
    'ERP (Enterprise Resource Planning)',
    'Government/Military',
    'Large Enterprise',
    'Management ISV',
    'MSP (Managed Service Provider)',
    'Network Equipment/Security',
    'Non-management ISV',
    'Optical Networking',
    'Service Provider',
    'Small/Medium Enterprise',
    'Storage Equipment',
    'System Integrator',
    'Wireless Industry',
  ];
  const sectionRating = [
    'Acquired',
    'Active',
    'Market Failed',
    'Project Cancelled',
    'Shut Down',
  ];
  const sectionLeadSource = [
    'Advertisement',
    'Cold Call',
    'Employee Referral',
    'External Referral',
    'Online Store',
    'Twitter',
    'Facebook',
    'partner',
    'Google+',
    'Public Relations',
    'Sales Email',
    'Seminar Partner',
    'Internal Seminar',
    'Trade Show',
    'Web Download',
    'Web Research',
    'Chat',
  ];
  const sectionLeadStatus = [
    'Attempted to Contact',
    'Contact in Future',
    'Contacted',
    'Junk Lead',
    'Lost Lead',
    'Not Contacted',
  ];
  return switch (fieldName) {
    'Lead Owner' => sectionLeadOwner,
    'Assign To' => sectionAssignTo,
    'Industry' => sectionIndustry,
    'Rating' => sectionRating,
    'Lead Source' => sectionLeadSource,
    'Lead Status' => sectionLeadStatus,
    _ => null,
  };
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
            onPressed: () => _submitCreateLead(context),
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

void _submitCreateLead(context) {
  if (_formKey.currentState!.validate()) {
    _formKey.currentState?.save();
    log("_formData: $_formData");
    var createLeadRequestBody = CreateLeadRequestBody(
      firstName: _formData['First Name']!,
      lastName: _formData['Last Name']!,
      email: _formData['Email']!,
      mobile: _formData['Phone Number']!,
      image: null,
      saluation: null,
      // leadOwner: 'leadOwner',
      leadName: null,
      company: _formData['Company']!,
      jobTitle: _formData['Title']!,
      mobile2: _formData['Sec Phone Number']!,
      website: _formData['Website']!,
      rating: _formData['Rating']!,
      leadStatus: _formData['Lead Status']!,
      leadSource: _formData['Lead Source']!,
      annualRevenue: null,
      industry: null,
      country: _formData['Country']!,
      city: _formData['City']!,
      state: _formData['State']!,
      description: _formData['Description']!,
      assignedToId: null,
      endTime: null,
      endTimeHour: null,
      userId: null,
      tenantId: null,
    );
    GetIt.I<CreateLeadCubit>().emitCreateLeadState(createLeadRequestBody);
    log("createLeadRequestBody: $createLeadRequestBody");
    log("Submit Successfully");
    Get.back();
  }
}
