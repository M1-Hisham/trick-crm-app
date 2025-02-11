// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create_lead_task_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CreateLeadTaskModel _$CreateLeadTaskModelFromJson(Map<String, dynamic> json) =>
    CreateLeadTaskModel(
      status: json['status'] as String?,
      message: json['message'] as String?,
      errors: json['errors'] == null
          ? null
          : Errors.fromJson(json['errors'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$CreateLeadTaskModelToJson(
        CreateLeadTaskModel instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
      'errors': instance.errors,
    };

Errors _$ErrorsFromJson(Map<String, dynamic> json) => Errors(
      subject:
          (json['subject'] as List<dynamic>?)?.map((e) => e as String).toList(),
      assignedTo: (json['assignedTo'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
    );

Map<String, dynamic> _$ErrorsToJson(Errors instance) => <String, dynamic>{
      'subject': instance.subject,
      'assignedTo': instance.assignedTo,
    };
