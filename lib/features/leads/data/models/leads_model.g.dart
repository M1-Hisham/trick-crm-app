// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'leads_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LeadsModel _$LeadsModelFromJson(Map<String, dynamic> json) => LeadsModel(
      status: json['status'] as String?,
      message: json['message'] as String?,
      users: (json['users'] as List<dynamic>?)
          ?.map((e) => Users.fromJson(e as Map<String, dynamic>))
          .toList(),
      leads: (json['leads'] as List<dynamic>?)
          ?.map((e) => Leads.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$LeadsModelToJson(LeadsModel instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
      'users': instance.users,
      'leads': instance.leads,
    };

Users _$UsersFromJson(Map<String, dynamic> json) => Users(
      id: (json['id'] as num?)?.toInt(),
      name: json['name'] as String?,
      email: json['email'] as String?,
      tenantId: json['tenantId'] as String?,
      emailVerifiedAt: json['emailVerifiedAt'],
      departmentId: (json['departmentId'] as num?)?.toInt(),
      companyId: (json['companyId'] as num?)?.toInt(),
      avatar: json['avatar'] as String?,
      roleAs: (json['roleAs'] as num?)?.toInt(),
      isTenant: (json['isTenant'] as num?)?.toInt(),
      isActive: (json['isActive'] as num?)?.toInt(),
      createdAt: json['createdAt'] as String?,
      updatedAt: json['updatedAt'] as String?,
      department: json['department'] == null
          ? null
          : Department.fromJson(json['department'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$UsersToJson(Users instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'email': instance.email,
      'tenantId': instance.tenantId,
      'emailVerifiedAt': instance.emailVerifiedAt,
      'departmentId': instance.departmentId,
      'companyId': instance.companyId,
      'avatar': instance.avatar,
      'roleAs': instance.roleAs,
      'isTenant': instance.isTenant,
      'isActive': instance.isActive,
      'createdAt': instance.createdAt,
      'updatedAt': instance.updatedAt,
      'department': instance.department,
    };

Department _$DepartmentFromJson(Map<String, dynamic> json) => Department(
      id: (json['id'] as num?)?.toInt(),
      tenantId: json['tenantId'] as String?,
      name: json['name'] as String?,
      createdAt: json['createdAt'] as String?,
      updatedAt: json['updatedAt'] as String?,
    );

Map<String, dynamic> _$DepartmentToJson(Department instance) =>
    <String, dynamic>{
      'id': instance.id,
      'tenantId': instance.tenantId,
      'name': instance.name,
      'createdAt': instance.createdAt,
      'updatedAt': instance.updatedAt,
    };

Leads _$LeadsFromJson(Map<String, dynamic> json) => Leads(
      id: (json['id'] as num?)?.toInt(),
      userId: (json['user_id'] as num?)?.toInt(),
      assignedToId: json['assigned_to_id'],
      tenantId: json['tenant_id'] as String?,
      compaingId: json['company_id'],
      saluation: json['saluation'],
      ownerName: json['owner_id'] as String?,
      firstName: json['first_name'],
      lastName: json['last_name'],
      leadName: json['lead_name'] as String?,
      company: json['company'],
      jobTitle: json['job_title'],
      email: json['email'] as String?,
      mobile: json['mobile'] as String?,
      mobile2: json['mobile_2'],
      website: json['website'],
      rating: json['rating'],
      leadStatus: json['lead_status'],
      leadSource: json['lead_source'] as String?,
      industry: json['industry'],
      annualRevenue: json['annual_revenue'],
      image: json['image'] as String?,
      country: json['country'],
      city: json['city'],
      state: json['state'],
      description: json['description'],
      fbLeadId: (json['fb_lead_id'] as num?)?.toInt(),
      fbAdName: json['fb_ad_name'] as String?,
      fbCampaignName: json['fb_campaign_name'] as String?,
      convertedDealId: json['converted_deal_id'],
      convertedClientId: json['converted_client_id'],
      isConverted: (json['is_converted'] as num?)?.toInt(),
      endTime: json['end_time'],
      endTimeHour: json['end_time_hour'],
      deletedAt: json['deleted_at'],
      createdAt: json['created_at'] as String?,
      updatedAt: json['updated_at'] as String?,
      assigned: json['assigned'],
    );

Map<String, dynamic> _$LeadsToJson(Leads instance) => <String, dynamic>{
      'id': instance.id,
      'user_id': instance.userId,
      'assigned_to_id': instance.assignedToId,
      'tenant_id': instance.tenantId,
      'company_id': instance.compaingId,
      'saluation': instance.saluation,
      'owner_id': instance.ownerName,
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
      'industry': instance.industry,
      'annual_revenue': instance.annualRevenue,
      'image': instance.image,
      'country': instance.country,
      'city': instance.city,
      'state': instance.state,
      'description': instance.description,
      'fb_lead_id': instance.fbLeadId,
      'fb_ad_name': instance.fbAdName,
      'fb_campaign_name': instance.fbCampaignName,
      'converted_deal_id': instance.convertedDealId,
      'converted_client_id': instance.convertedClientId,
      'is_converted': instance.isConverted,
      'end_time': instance.endTime,
      'end_time_hour': instance.endTimeHour,
      'deleted_at': instance.deletedAt,
      'created_at': instance.createdAt,
      'updated_at': instance.updatedAt,
      'assigned': instance.assigned,
    };
