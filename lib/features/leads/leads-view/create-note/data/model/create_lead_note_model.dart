import 'package:json_annotation/json_annotation.dart';

part 'create_lead_note_model.g.dart';

@JsonSerializable()
class CreateLeadNoteModel {
  String? status;
  String? message;
  Note? note;

  CreateLeadNoteModel({this.status, this.message, this.note});

  factory CreateLeadNoteModel.fromJson(Map<String, dynamic> json) =>
      _$CreateLeadNoteModelFromJson(json);
}

@JsonSerializable()
class Note {
  @JsonKey(name: 'lead_id')
  int? leadId;
  @JsonKey(name: 'user_id')
  int? userId;
  @JsonKey(name: 'tenant_id')
  String? tenantId;
  String? comment;
  @JsonKey(name: 'updated_at')
  String? updatedAt;
  @JsonKey(name: 'created_at')
  String? createdAt;
  int? id;

  Note({
    this.leadId,
    this.userId,
    this.tenantId,
    this.comment,
    this.updatedAt,
    this.createdAt,
    this.id,
  });

  factory Note.fromJson(Map<String, dynamic> json) => _$NoteFromJson(json);
}
