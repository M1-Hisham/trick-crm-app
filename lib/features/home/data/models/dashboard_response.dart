import 'package:json_annotation/json_annotation.dart';

part 'dashboard_response.g.dart';

@JsonSerializable()
class DashboardResponseModel {
  String? status;
  Data? data;

  DashboardResponseModel({this.status, this.data});
  factory DashboardResponseModel.fromJson(Map<String, dynamic> json) =>
      _$DashboardResponseModelFromJson(json);
}

@JsonSerializable()
class Data {
  List<dynamic>? leads;
  List<dynamic>? clients;
  List<dynamic>? deals;
  List<dynamic>? bigChartDeals;
  List<Tasks>? tasks;
  List<Meetings>? meetings;
  List<Calls>? calls;
  List<TopFiveSalesPersons>? topFiveSalesPersons;

  Data({
    this.leads,
    this.clients,
    this.deals,
    this.bigChartDeals,
    this.tasks,
    this.meetings,
    this.calls,
    this.topFiveSalesPersons,
  });
  factory Data.fromJson(Map<String, dynamic> json) => _$DataFromJson(json);
}

@JsonSerializable()
class Tasks {
  int? id;
  @JsonKey(name: 'user_id')
  int? userId;
  @JsonKey(name: 'tenant_id')
  String? tenantId;
  @JsonKey(name: 'task_owner')
  String? taskOwner;
  @JsonKey(name: 'assigned_to_id')
  int? assignedToId;
  @JsonKey(name: 'lead_id')
  int? leadId;
  @JsonKey(name: 'contact_id')
  dynamic contactId;
  @JsonKey(name: 'client_id')
  dynamic clientId;
  String? subject;
  String? status;
  String? priority;
  String? description;
  @JsonKey(name: 'due_date')
  String? dueDate;
  @JsonKey(name: 'is_deleted')
  int? isDeleted;
  @JsonKey(name: 'created_at')
  String? createdAt;
  @JsonKey(name: 'updated_at')
  String? updatedAt;

  Tasks({
    this.id,
    this.userId,
    this.tenantId,
    this.taskOwner,
    this.assignedToId,
    this.leadId,
    this.contactId,
    this.clientId,
    this.subject,
    this.status,
    this.priority,
    this.description,
    this.dueDate,
    this.isDeleted,
    this.createdAt,
    this.updatedAt,
  });

  factory Tasks.fromJson(Map<String, dynamic> json) => _$TasksFromJson(json);
}

@JsonSerializable()
class Meetings {
  int? id;
  @JsonKey(name: 'created_by')
  int? createdBy;
  @JsonKey(name: 'host_id')
  int? hostId;
  @JsonKey(name: 'tenant_id')
  String? tenantId;
  String? title;
  String? location;
  String? description;
  @JsonKey(name: 'start_date')
  String? startTime;
  @JsonKey(name: 'start_time_hour')
  String? startTimeHour;
  @JsonKey(name: 'end_time')
  String? endTime;
  @JsonKey(name: 'end_time_hour')
  String? endTimeHour;
  @JsonKey(name: 'all_day')
  int? allDay;
  String? participants;
  @JsonKey(name: 'related_to')
  String? relatedTo;
  @JsonKey(name: 'related_to_client')
  String? relatedToClient;
  @JsonKey(name: 'lead_id')
  int? leadId;
  @JsonKey(name: 'contact_id')
  dynamic contactId;
  @JsonKey(name: 'client_id')
  int? clientId;
  String? status;
  @JsonKey(name: 'is_deleted')
  int? isDeleted;
  @JsonKey(name: 'created_at')
  String? createdAt;
  @JsonKey(name: 'updated_at')
  String? updatedAt;
  @JsonKey(name: 'deal_id')
  dynamic dealId;
  @JsonKey(name: 'compaign_id')
  dynamic compaignId;
  Host? host;

  Meetings({
    this.id,
    this.createdBy,
    this.hostId,
    this.tenantId,
    this.title,
    this.location,
    this.description,
    this.startTime,
    this.startTimeHour,
    this.endTime,
    this.endTimeHour,
    this.allDay,
    this.participants,
    this.relatedTo,
    this.relatedToClient,
    this.leadId,
    this.contactId,
    this.clientId,
    this.status,
    this.isDeleted,
    this.createdAt,
    this.updatedAt,
    this.dealId,
    this.compaignId,
    this.host,
  });

  factory Meetings.fromJson(Map<String, dynamic> json) =>
      _$MeetingsFromJson(json);
}

@JsonSerializable()
class Host {
  int? id;
  String? name;
  String? email;
  @JsonKey(name: 'tenant_id')
  String? tenantId;
  @JsonKey(name: 'email_verified_at')
  String? emailVerifiedAt;
  @JsonKey(name: 'department_id')
  dynamic departmentId;
  @JsonKey(name: 'company_id')
  int? companyId;
  String? avatar;
  @JsonKey(name: 'role_as')
  int? roleAs;
  @JsonKey(name: 'is_tenant')
  int? isTenant;
  @JsonKey(name: 'is_active')
  int? isActive;
  @JsonKey(name: 'created_at')
  String? createdAt;
  @JsonKey(name: 'updated_at')
  String? updatedAt;
  dynamic department;

  Host({
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

  factory Host.fromJson(Map<String, dynamic> json) => _$HostFromJson(json);
}

@JsonSerializable()
class Calls {
  int? id;
  @JsonKey(name: 'tenant_id')
  String? tenantId;
  @JsonKey(name: 'call_to')
  String? callTo;
  @JsonKey(name: 'lead_id')
  int? leadId;
  @JsonKey(name: 'contact_id')
  dynamic contactId;
  @JsonKey(name: 'related_to')
  dynamic relatedTo;
  @JsonKey(name: 'related_to_client')
  String? relatedToClient;
  @JsonKey(name: 'client_id')
  int? clientId;
  @JsonKey(name: 'deal_id')
  dynamic dealId;
  @JsonKey(name: 'campaign_id')
  dynamic campaignId;
  @JsonKey(name: 'call_type')
  String? callType;
  @JsonKey(name: 'call_status')
  String? callStatus;
  @JsonKey(name: 'start_time')
  String? startTime;
  @JsonKey(name: 'start_time_hour')
  String? startTimeHour;
  @JsonKey(name: 'call_owner_id')
  int? callOwnerId;
  String? subject;
  @JsonKey(name: 'call_purpose')
  String? callPurpose;
  @JsonKey(name: 'call_agenda')
  String? callAgenda;
  @JsonKey(name: 'call_result')
  String? callResult;
  String? description;
  @JsonKey(name: 'is_deleted')
  int? isDeleted;
  @JsonKey(name: 'created_at')
  String? createdAt;
  @JsonKey(name: 'updated_at')
  String? updatedAt;

  Calls({
    this.id,
    this.tenantId,
    this.callTo,
    this.leadId,
    this.contactId,
    this.relatedTo,
    this.relatedToClient,
    this.clientId,
    this.dealId,
    this.campaignId,
    this.callType,
    this.callStatus,
    this.startTime,
    this.startTimeHour,
    this.callOwnerId,
    this.subject,
    this.callPurpose,
    this.callAgenda,
    this.callResult,
    this.description,
    this.isDeleted,
    this.createdAt,
    this.updatedAt,
  });

  factory Calls.fromJson(Map<String, dynamic> json) => _$CallsFromJson(json);
}

@JsonSerializable()
class TopFiveSalesPersons {
  String? name;
  String? year;
  String? gdp;

  TopFiveSalesPersons({this.name, this.year, this.gdp});

  factory TopFiveSalesPersons.fromJson(Map<String, dynamic> json) =>
      _$TopFiveSalesPersonsFromJson(json);
}
