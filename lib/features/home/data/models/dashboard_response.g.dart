// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dashboard_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DashboardResponseModel _$DashboardResponseModelFromJson(
        Map<String, dynamic> json) =>
    DashboardResponseModel(
      status: json['status'] as String?,
      data: json['data'] == null
          ? null
          : Data.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$DashboardResponseModelToJson(
        DashboardResponseModel instance) =>
    <String, dynamic>{
      'status': instance.status,
      'data': instance.data,
    };

Data _$DataFromJson(Map<String, dynamic> json) => Data(
      leads: json['leads'] as List<dynamic>?,
      clients: json['clients'] as List<dynamic>?,
      deals: json['deals'] as List<dynamic>?,
      bigChartDeals: json['bigChartDeals'] as List<dynamic>?,
      tasks: (json['tasks'] as List<dynamic>?)
          ?.map((e) => Tasks.fromJson(e as Map<String, dynamic>))
          .toList(),
      meetings: (json['meetings'] as List<dynamic>?)
          ?.map((e) => Meetings.fromJson(e as Map<String, dynamic>))
          .toList(),
      calls: (json['calls'] as List<dynamic>?)
          ?.map((e) => Calls.fromJson(e as Map<String, dynamic>))
          .toList(),
      topFiveSalesPersons: (json['topFiveSalesPersons'] as List<dynamic>?)
          ?.map((e) => TopFiveSalesPersons.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$DataToJson(Data instance) => <String, dynamic>{
      'leads': instance.leads,
      'clients': instance.clients,
      'deals': instance.deals,
      'bigChartDeals': instance.bigChartDeals,
      'tasks': instance.tasks,
      'meetings': instance.meetings,
      'calls': instance.calls,
      'topFiveSalesPersons': instance.topFiveSalesPersons,
    };

Tasks _$TasksFromJson(Map<String, dynamic> json) => Tasks(
      id: (json['id'] as num?)?.toInt(),
      userId: (json['user_id'] as num?)?.toInt(),
      tenantId: json['tenant_id'] as String?,
      taskOwner: json['task_owner'] as String?,
      assignedToId: (json['assigned_to_id'] as num?)?.toInt(),
      leadId: (json['lead_id'] as num?)?.toInt(),
      contactId: json['contact_id'],
      clientId: json['client_id'],
      subject: json['subject'] as String?,
      status: json['status'] as String?,
      priority: json['priority'] as String?,
      description: json['description'] as String?,
      dueDate: json['due_date'] as String?,
      isDeleted: (json['is_deleted'] as num?)?.toInt(),
      createdAt: json['created_at'] as String?,
      updatedAt: json['updated_at'] as String?,
    );

Map<String, dynamic> _$TasksToJson(Tasks instance) => <String, dynamic>{
      'id': instance.id,
      'user_id': instance.userId,
      'tenant_id': instance.tenantId,
      'task_owner': instance.taskOwner,
      'assigned_to_id': instance.assignedToId,
      'lead_id': instance.leadId,
      'contact_id': instance.contactId,
      'client_id': instance.clientId,
      'subject': instance.subject,
      'status': instance.status,
      'priority': instance.priority,
      'description': instance.description,
      'due_date': instance.dueDate,
      'is_deleted': instance.isDeleted,
      'created_at': instance.createdAt,
      'updated_at': instance.updatedAt,
    };

Meetings _$MeetingsFromJson(Map<String, dynamic> json) => Meetings(
      id: (json['id'] as num?)?.toInt(),
      createdBy: (json['created_by'] as num?)?.toInt(),
      hostId: (json['host_id'] as num?)?.toInt(),
      tenantId: json['tenant_id'] as String?,
      title: json['title'] as String?,
      location: json['location'] as String?,
      description: json['description'] as String?,
      startTime: json['start_date'] as String?,
      startTimeHour: json['start_time_hour'] as String?,
      endTime: json['end_time'] as String?,
      endTimeHour: json['end_time_hour'] as String?,
      allDay: (json['all_day'] as num?)?.toInt(),
      participants: json['participants'] as String?,
      relatedTo: json['related_to'] as String?,
      relatedToClient: json['related_to_client'] as String?,
      leadId: (json['lead_id'] as num?)?.toInt(),
      contactId: json['contact_id'],
      clientId: (json['client_id'] as num?)?.toInt(),
      status: json['status'] as String?,
      isDeleted: (json['is_deleted'] as num?)?.toInt(),
      createdAt: json['created_at'] as String?,
      updatedAt: json['updated_at'] as String?,
      dealId: json['deal_id'],
      compaignId: json['compaign_id'],
      host: json['host'] == null
          ? null
          : Host.fromJson(json['host'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$MeetingsToJson(Meetings instance) => <String, dynamic>{
      'id': instance.id,
      'created_by': instance.createdBy,
      'host_id': instance.hostId,
      'tenant_id': instance.tenantId,
      'title': instance.title,
      'location': instance.location,
      'description': instance.description,
      'start_date': instance.startTime,
      'start_time_hour': instance.startTimeHour,
      'end_time': instance.endTime,
      'end_time_hour': instance.endTimeHour,
      'all_day': instance.allDay,
      'participants': instance.participants,
      'related_to': instance.relatedTo,
      'related_to_client': instance.relatedToClient,
      'lead_id': instance.leadId,
      'contact_id': instance.contactId,
      'client_id': instance.clientId,
      'status': instance.status,
      'is_deleted': instance.isDeleted,
      'created_at': instance.createdAt,
      'updated_at': instance.updatedAt,
      'deal_id': instance.dealId,
      'compaign_id': instance.compaignId,
      'host': instance.host,
    };

Host _$HostFromJson(Map<String, dynamic> json) => Host(
      id: (json['id'] as num?)?.toInt(),
      name: json['name'] as String?,
      email: json['email'] as String?,
      tenantId: json['tenant_id'] as String?,
      emailVerifiedAt: json['email_verified_at'] as String?,
      departmentId: json['department_id'],
      companyId: (json['company_id'] as num?)?.toInt(),
      avatar: json['avatar'] as String?,
      roleAs: (json['role_as'] as num?)?.toInt(),
      isTenant: (json['is_tenant'] as num?)?.toInt(),
      isActive: (json['is_active'] as num?)?.toInt(),
      createdAt: json['created_at'] as String?,
      updatedAt: json['updated_at'] as String?,
      department: json['department'],
    );

Map<String, dynamic> _$HostToJson(Host instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'email': instance.email,
      'tenant_id': instance.tenantId,
      'email_verified_at': instance.emailVerifiedAt,
      'department_id': instance.departmentId,
      'company_id': instance.companyId,
      'avatar': instance.avatar,
      'role_as': instance.roleAs,
      'is_tenant': instance.isTenant,
      'is_active': instance.isActive,
      'created_at': instance.createdAt,
      'updated_at': instance.updatedAt,
      'department': instance.department,
    };

Calls _$CallsFromJson(Map<String, dynamic> json) => Calls(
      id: (json['id'] as num?)?.toInt(),
      tenantId: json['tenant_id'] as String?,
      callTo: json['call_to'] as String?,
      leadId: (json['lead_id'] as num?)?.toInt(),
      contactId: json['contact_id'],
      relatedTo: json['related_to'],
      relatedToClient: json['related_to_client'] as String?,
      clientId: (json['client_id'] as num?)?.toInt(),
      dealId: json['deal_id'],
      campaignId: json['campaign_id'],
      callType: json['call_type'] as String?,
      callStatus: json['call_status'] as String?,
      startTime: json['start_time'] as String?,
      startTimeHour: json['start_time_hour'] as String?,
      callOwnerId: (json['call_owner_id'] as num?)?.toInt(),
      subject: json['subject'] as String?,
      callPurpose: json['call_purpose'] as String?,
      callAgenda: json['call_agenda'] as String?,
      callResult: json['call_result'] as String?,
      description: json['description'] as String?,
      isDeleted: (json['is_deleted'] as num?)?.toInt(),
      createdAt: json['created_at'] as String?,
      updatedAt: json['updated_at'] as String?,
    );

Map<String, dynamic> _$CallsToJson(Calls instance) => <String, dynamic>{
      'id': instance.id,
      'tenant_id': instance.tenantId,
      'call_to': instance.callTo,
      'lead_id': instance.leadId,
      'contact_id': instance.contactId,
      'related_to': instance.relatedTo,
      'related_to_client': instance.relatedToClient,
      'client_id': instance.clientId,
      'deal_id': instance.dealId,
      'campaign_id': instance.campaignId,
      'call_type': instance.callType,
      'call_status': instance.callStatus,
      'start_time': instance.startTime,
      'start_time_hour': instance.startTimeHour,
      'call_owner_id': instance.callOwnerId,
      'subject': instance.subject,
      'call_purpose': instance.callPurpose,
      'call_agenda': instance.callAgenda,
      'call_result': instance.callResult,
      'description': instance.description,
      'is_deleted': instance.isDeleted,
      'created_at': instance.createdAt,
      'updated_at': instance.updatedAt,
    };

TopFiveSalesPersons _$TopFiveSalesPersonsFromJson(Map<String, dynamic> json) =>
    TopFiveSalesPersons(
      name: json['name'] as String?,
      year: json['year'] as String?,
      gdp: json['gdp'] as String?,
    );

Map<String, dynamic> _$TopFiveSalesPersonsToJson(
        TopFiveSalesPersons instance) =>
    <String, dynamic>{
      'name': instance.name,
      'year': instance.year,
      'gdp': instance.gdp,
    };
