// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create_lead_task_request_body.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CreateLeadTaskRequestBody _$CreateLeadTaskRequestBodyFromJson(
        Map<String, dynamic> json) =>
    CreateLeadTaskRequestBody(
      subject: json['subject'] as String?,
      description: json['description'] as String?,
      dueDate: json['dueDate'] as String?,
      assignedTo: (json['assignedTo'] as num?)?.toInt(),
      priority: json['priority'] as String?,
      status: json['status'] as String?,
    );

Map<String, dynamic> _$CreateLeadTaskRequestBodyToJson(
        CreateLeadTaskRequestBody instance) =>
    <String, dynamic>{
      'subject': instance.subject,
      'description': instance.description,
      'dueDate': instance.dueDate,
      'assignedTo': instance.assignedTo,
      'priority': instance.priority,
      'status': instance.status,
    };
