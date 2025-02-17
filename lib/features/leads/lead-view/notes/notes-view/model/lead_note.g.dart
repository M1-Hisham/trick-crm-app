// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'lead_note.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LeadNote _$LeadNoteFromJson(Map<String, dynamic> json) => LeadNote(
      id: (json['id'] as num?)?.toInt(),
      leadId: (json['leadId'] as num?)?.toInt(),
      userId: (json['userId'] as num?)?.toInt(),
      tenantId: json['tenantId'] as String?,
      comment: json['comment'] as String?,
      status: (json['status'] as num?)?.toInt(),
      createdAt: json['createdAt'] as String?,
      updatedAt: json['updatedAt'] as String?,
      userNote: json['userNote'] == null
          ? null
          : UserNote.fromJson(json['userNote'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$LeadNoteToJson(LeadNote instance) => <String, dynamic>{
      'id': instance.id,
      'leadId': instance.leadId,
      'userId': instance.userId,
      'tenantId': instance.tenantId,
      'comment': instance.comment,
      'status': instance.status,
      'createdAt': instance.createdAt,
      'updatedAt': instance.updatedAt,
      'userNote': instance.userNote,
    };

UserNote _$UserNoteFromJson(Map<String, dynamic> json) => UserNote(
      id: (json['id'] as num?)?.toInt(),
      name: json['name'] as String?,
      email: json['email'] as String?,
      tenantId: json['tenantId'] as String?,
      emailVerifiedAt: json['emailVerifiedAt'] as String?,
      departmentId: json['departmentId'],
      companyId: (json['companyId'] as num?)?.toInt(),
      avatar: json['avatar'] as String?,
      roleAs: (json['roleAs'] as num?)?.toInt(),
      isTenant: (json['isTenant'] as num?)?.toInt(),
      isActive: (json['isActive'] as num?)?.toInt(),
      createdAt: json['createdAt'] as String?,
      updatedAt: json['updatedAt'] as String?,
      department: json['department'],
    );

Map<String, dynamic> _$UserNoteToJson(UserNote instance) => <String, dynamic>{
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
