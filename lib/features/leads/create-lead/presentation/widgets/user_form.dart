import 'dart:developer';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:trick_crm_app/core/di/dependency_injection.dart';
import 'package:trick_crm_app/features/leads/create-lead/logic/cubit/create_lead_cubit.dart';

import '../../../../../core/helpers/spacing.dart';
import '../../../../../core/resources/resources.dart';
import '../../../../../core/widgets/app_button.dart';
import '../../../../../core/widgets/app_date_picker_field.dart';
import '../../../../../core/widgets/app_selection_form_field.dart';
import '../../../../../core/widgets/app_text_form_field.dart';
import '../../data/models/create_lead_request_body.dart';
import 'upload_image.dart';

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
final Map<String, dynamic> _formData = {};

ScrollController scrollController = ScrollController();

ListView userForm(
  context,
  List<Map<String, dynamic>>? leadOwner,
  List<Map<String, dynamic>>? assignedToNames,
  isShowFields,
) {
  return ListView(
    controller: scrollController,
    shrinkWrap: true,
    padding: const EdgeInsets.all(20),
    children: [
      spacingV(120),
      ...uploadImage(
        fun: (pickedFile) {
          if (pickedFile != null) {
            _formData['Image'] = File(pickedFile.name);
          }
        },
      ),
      spacingV(20),
      Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ..._getListInformation(
                context, leadOwner, assignedToNames, isShowFields),
          ],
        ),
      ),
      ..._submitAndCancel(context),
      spacingV(20),
    ],
  );
}

List<Widget> _getListInformation(
  context,
  List<Map<String, dynamic>>? leadOwner,
  List<Map<String, dynamic>>? assignedToNames,
  isShowFields,
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
        Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 22),
              child: AppSelectionFormField(
                labelText: fieldName,
                selections:
                    _selectionCase(fieldName, leadOwner, assignedToNames) ??
                        ['none'],
                onSaved: (value) {
                  _formData[fieldName] = value;
                  if (fieldName == 'Lead Owner') {
                    int? index = leadOwner?.indexWhere(
                        (element) => element['id'] == int.parse(value));
                    if (index != -1 && index != null) {
                      _formData['Tenant Id'] = leadOwner?[index]['Tenant Id'];
                    }
                  }
                },
              ),
            ),
            Visibility(
              visible: isShowFields == true && fieldName == 'Assign To',
              child: Padding(
                padding: const EdgeInsets.only(bottom: 22),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Flexible(
                      child: AppDatePickerField(
                        onSaved: (value) {
                          _formData['End Time'] = value;
                        },
                      ),
                    ),
                    spacingH(20),
                    Flexible(
                      child: AppSelectionFormField(
                          labelText: 'Time',
                          selections: const [
                            '6:00 AM',
                            '7:00 AM',
                            '8:00 AM',
                            '9:00 AM',
                            '10:00 AM',
                            '11:00 AM',
                            '12:00 PM',
                            '1:00 PM',
                            '2:00 PM',
                            '3:00 PM',
                            '4:00 PM',
                            '5:00 PM',
                            '6:00 PM',
                            '7:00 PM',
                            '8:00 PM',
                            '9:00 PM',
                            '10:00 PM',
                            '11:00 PM',
                            '12:00 AM',
                          ],
                          onSaved: (value) {
                            _formData['End Time Hour'] = value;
                          },
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              _scrollToTop();
                              return 'Please enter a valid time';
                            }
                            return null;
                          }),
                    ),
                  ],
                ),
              ),
            )
          ],
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
              _formData[fieldName] = value;
            },
            validator: (value) => _validateAllFields(fieldName, value),
          ),
        ),
      );
    }
  }
  return childs;
}

List<dynamic>? _selectionCase(
  String fieldName,
  List<Map<String, dynamic>>? leadOwner,
  List<Map<String, dynamic>>? assignedToNames,
) {
  final sectionLeadOwner = [
    ...leadOwner!,
  ];
  final sectionAssignTo = [
    ...leadOwner,
    ...assignedToNames!,
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
    'Annual Revenue' => TextInputType.phone,
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

void _submitCreateLead(context) async {
  if (_formKey.currentState!.validate()) {
    _formKey.currentState?.save();
    log("_formData: $_formData");
    var createLeadRequestBody = CreateLeadRequestBody(
      firstName: _formData['First Name'],
      lastName: _formData['Last Name'],
      email: _formData['Email'],
      mobile: _formData['Phone Number'],
      image: _formData['Image'],
      saluation: null,
      leadName: null,
      company: _formData['Company'],
      jobTitle: _formData['Title'],
      mobile2: _formData['Sec Phone Number'],
      website: _formData['Website'],
      rating: _formData['Rating'],
      leadStatus: _formData['Lead Status'],
      leadSource: _formData['Lead Source'],
      annualRevenue: _formData['Annual Revenue'] != ''
          ? int.parse(_formData['Annual Revenue'])
          : null,
      industry: _formData['Industry'],
      country: _formData['Country'],
      city: _formData['City'],
      state: _formData['State'],
      description: _formData['Description'],
      assignedToId:
          _formData['Assign To'] != null && _formData['Assign To'] != ''
              ? int.parse(_formData['Assign To'])
              : null,
      endTime: _formData['End Time'],
      endTimeHour: _formData['End Time Hour'],
      userId: _formData['Lead Owner'] != null && _formData['Lead Owner'] != ''
          ? int.parse(_formData['Lead Owner'])
          : null,
      tenantId: _formData['Tenant Id'],
    );
    final cubit = getIt.get<CreateLeadCubit>();
    await cubit.createLead(createLeadRequestBody);
    log("createLeadRequestBody: $createLeadRequestBody");
    log("Submit Successfully");
    Get.back();
  }
}
