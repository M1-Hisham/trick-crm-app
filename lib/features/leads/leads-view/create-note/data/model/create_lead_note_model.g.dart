// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create_lead_note_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CreateLeadNoteModel _$CreateLeadNoteModelFromJson(Map<String, dynamic> json) =>
    CreateLeadNoteModel(
      status: json['status'] as String?,
      message: json['message'] as String?,
      note: json['note'] == null
          ? null
          : Note.fromJson(json['note'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$CreateLeadNoteModelToJson(
        CreateLeadNoteModel instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
      'note': instance.note,
    };

Note _$NoteFromJson(Map<String, dynamic> json) => Note(
      leadId: (json['lead_id'] as num?)?.toInt(),
      userId: (json['user_id'] as num?)?.toInt(),
      tenantId: json['tenant_id'] as String?,
      comment: json['comment'] as String?,
      updatedAt: json['updated_at'] as String?,
      createdAt: json['created_at'] as String?,
      id: (json['id'] as num?)?.toInt(),
    );

Map<String, dynamic> _$NoteToJson(Note instance) => <String, dynamic>{
      'lead_id': instance.leadId,
      'user_id': instance.userId,
      'tenant_id': instance.tenantId,
      'comment': instance.comment,
      'updated_at': instance.updatedAt,
      'created_at': instance.createdAt,
      'id': instance.id,
    };
