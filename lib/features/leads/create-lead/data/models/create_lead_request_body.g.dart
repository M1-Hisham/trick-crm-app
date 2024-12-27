// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create_lead_request_body.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CreateLeadRequestBody _$CreateLeadRequestBodyFromJson(
        Map<String, dynamic> json) =>
    CreateLeadRequestBody(
      firstName: json['first_name'] as String,
      lastName: json['last_name'] as String,
      email: json['email'] as String,
      mobile: json['mobile'] as String,
    );

Map<String, dynamic> _$CreateLeadRequestBodyToJson(
        CreateLeadRequestBody instance) =>
    <String, dynamic>{
      'first_name': instance.firstName,
      'last_name': instance.lastName,
      'email': instance.email,
      'mobile': instance.mobile,
    };
