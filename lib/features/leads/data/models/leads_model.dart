import 'package:json_annotation/json_annotation.dart';

part 'leads_model.g.dart';

@JsonSerializable()
class LeadsModel {
  String? status;
  String? message;
  List<Users>? users;
  List<Leads>? leads;

  LeadsModel({this.status, this.message, this.users, this.leads});
  factory LeadsModel.fromJson(Map<String, dynamic> json) =>
      _$LeadsModelFromJson(json);
}

@JsonSerializable()
class Users {
  int? id;
  String? name;
  String? email;
  String? tenantId;
  // String? emailVerifiedAt;
  dynamic emailVerifiedAt;
  int? departmentId;
  int? companyId;
  String? avatar;
  int? roleAs;
  int? isTenant;
  int? isActive;
  String? createdAt;
  String? updatedAt;
  Department? department;

  Users({
    this.id,
    this.name,
    this.email,
    this.tenantId,
    this.emailVerifiedAt,
    this.departmentId,
    this.companyId,
    this.avatar,
    this.roleAs,
    this.isTenant,
    this.isActive,
    this.createdAt,
    this.updatedAt,
    this.department,
  });
  factory Users.fromJson(Map<String, dynamic> json) => _$UsersFromJson(json);
}

@JsonSerializable()
class Department {
  int? id;
  String? tenantId;
  String? name;
  String? createdAt;
  String? updatedAt;

  Department(
      {this.id, this.tenantId, this.name, this.createdAt, this.updatedAt});
  factory Department.fromJson(Map<String, dynamic> json) =>
      _$DepartmentFromJson(json);
}

@JsonSerializable()
class Leads {
  int? id;
  @JsonKey(name: 'user_id')
  int? userId;
  @JsonKey(name: 'assigned_to_id')
  dynamic assignedToId;
  @JsonKey(name: 'tenant_id')
  String? tenantId;
  @JsonKey(name: 'company_id')
  dynamic compaingId;
  dynamic saluation;
  @JsonKey(name: 'owner_id')
  String? ownerName;
  @JsonKey(name: 'first_name')
  dynamic firstName;
  @JsonKey(name: 'last_name')
  dynamic lastName;
  @JsonKey(name: 'lead_name')
  String? leadName;
  dynamic company;
  @JsonKey(name: 'job_title')
  dynamic jobTitle;
  String? email;
  String? mobile;
  @JsonKey(name: 'mobile_2')
  dynamic mobile2;
  dynamic website;
  dynamic rating;
  @JsonKey(name: 'lead_status')
  dynamic leadStatus;
  @JsonKey(name: 'lead_source')
  String? leadSource;
  dynamic industry;
  @JsonKey(name: 'annual_revenue')
  dynamic annualRevenue;
  String? image;
  dynamic country;
  dynamic city;
  dynamic state;
  dynamic description;
  @JsonKey(name: 'fb_lead_id')
  int? fbLeadId;
  @JsonKey(name: 'fb_ad_name')
  String? fbAdName;
  @JsonKey(name: 'fb_campaign_name')
  String? fbCampaignName;
  @JsonKey(name: 'converted_deal_id')
  dynamic convertedDealId;
  @JsonKey(name: 'converted_client_id')
  dynamic convertedClientId;
  @JsonKey(name: 'is_converted')
  int? isConverted;
  @JsonKey(name: 'end_time')
  dynamic endTime;
  @JsonKey(name: 'end_time_hour')
  dynamic endTimeHour;
  @JsonKey(name: 'deleted_at')
  dynamic deletedAt;
  @JsonKey(name: 'created_at')
  String? createdAt;
  @JsonKey(name: 'updated_at')
  String? updatedAt;
  dynamic assigned;

  Leads({
    this.id,
    this.userId,
    this.assignedToId,
    this.tenantId,
    this.compaingId,
    this.saluation,
    this.ownerName,
    this.firstName,
    this.lastName,
    this.leadName,
    this.company,
    this.jobTitle,
    this.email,
    this.mobile,
    this.mobile2,
    this.website,
    this.rating,
    this.leadStatus,
    this.leadSource,
    this.industry,
    this.annualRevenue,
    this.image,
    this.country,
    this.city,
    this.state,
    this.description,
    this.fbLeadId,
    this.fbAdName,
    this.fbCampaignName,
    this.convertedDealId,
    this.convertedClientId,
    this.isConverted,
    this.endTime,
    this.endTimeHour,
    this.deletedAt,
    this.createdAt,
    this.updatedAt,
    this.assigned,
  });

  factory Leads.fromJson(Map<String, dynamic> json) => _$LeadsFromJson(json);
}
