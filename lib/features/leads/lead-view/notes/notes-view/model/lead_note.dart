import 'package:json_annotation/json_annotation.dart';

part 'lead_note.g.dart';

@JsonSerializable()
class LeadNote {
  int? id;
  int? leadId;
  int? userId;
  String? tenantId;
  String? comment;
  int? status;
  String? createdAt;
  String? updatedAt;
  UserNote? userNote;

  LeadNote({
    this.id,
    this.leadId,
    this.userId,
    this.tenantId,
    this.comment,
    this.status,
    this.createdAt,
    this.updatedAt,
    this.userNote,
  });
  factory LeadNote.fromJson(Map<String, dynamic> json) =>
      _$LeadNoteFromJson(json);
}

@JsonSerializable()
class UserNote {
  int? id;
  String? name;
  String? email;
  String? tenantId;
  String? emailVerifiedAt;
  dynamic departmentId;
  int? companyId;
  String? avatar;
  int? roleAs;
  int? isTenant;
  int? isActive;
  String? createdAt;
  String? updatedAt;
  dynamic department;

  UserNote({
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

  factory UserNote.fromJson(Map<String, dynamic> json) =>
      _$UserNoteFromJson(json);
}
