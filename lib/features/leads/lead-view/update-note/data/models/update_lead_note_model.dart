import 'package:json_annotation/json_annotation.dart';

part 'update_lead_note_model.g.dart';

@JsonSerializable()
class UpdateLeadNoteModel {
  String? status;
  String? message;
  Note? note;

  UpdateLeadNoteModel({this.status, this.message, this.note});

  factory UpdateLeadNoteModel.fromJson(Map<String, dynamic> json) =>
      _$UpdateLeadNoteModelFromJson(json);
}

@JsonSerializable()
class Note {
  int? id;
  int? leadId;
  int? userId;
  String? tenantId;
  String? comment;
  int? status;
  String? createdAt;
  String? updatedAt;
  UserNote? userNote;

  Note({
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

  factory Note.fromJson(Map<String, dynamic> json) => _$NoteFromJson(json);
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
