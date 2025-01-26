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
      image: json['image'] as String?,
      saluation: json['saluation'] as String?,
      leadName: json['lead_name'] as String?,
      company: json['company'] as String?,
      jobTitle: json['job_title'] as String?,
      mobile2: json['mobile_2'] as String?,
      website: json['website'] as String?,
      rating: json['rating'] as String?,
      leadStatus: json['lead_status'] as String?,
      leadSource: json['lead_source'] as String?,
      annualRevenue: (json['annual_revenue'] as num?)?.toInt(),
      industry: json['industry'] as String?,
      country: json['country'] as String?,
      city: json['city'] as String?,
      state: json['state'] as String?,
      description: json['description'] as String?,
      assignedToId: (json['assigned_to_id'] as num?)?.toInt(),
      endTime: json['end_time'] as String?,
      endTimeHour: json['end_time_hour'] as String?,
      userId: (json['user_id'] as num?)?.toInt(),
      tenantId: json['tenant_id'] as String?,
    );

Map<String, dynamic> _$CreateLeadRequestBodyToJson(
        CreateLeadRequestBody instance) =>
    <String, dynamic>{
      'image': instance.image,
      'saluation': instance.saluation,
      'first_name': instance.firstName,
      'last_name': instance.lastName,
      'lead_name': instance.leadName,
      'company': instance.company,
      'job_title': instance.jobTitle,
      'email': instance.email,
      'mobile': instance.mobile,
      'mobile_2': instance.mobile2,
      'website': instance.website,
      'rating': instance.rating,
      'lead_status': instance.leadStatus,
      'lead_source': instance.leadSource,
      'annual_revenue': instance.annualRevenue,
      'industry': instance.industry,
      'country': instance.country,
      'city': instance.city,
      'state': instance.state,
      'description': instance.description,
      'assigned_to_id': instance.assignedToId,
      'end_time': instance.endTime,
      'end_time_hour': instance.endTimeHour,
      'user_id': instance.userId,
      'tenant_id': instance.tenantId,
    };
