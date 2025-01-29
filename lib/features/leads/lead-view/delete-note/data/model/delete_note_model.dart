import 'package:json_annotation/json_annotation.dart';

part 'delete_note_model.g.dart';

@JsonSerializable()
class DeleteNoteModel {
  String? status;
  String? message;
  DeleteNoteModel({this.status, this.message});
  factory DeleteNoteModel.fromJson(Map<String, dynamic> json) =>
      _$DeleteNoteModelFromJson(json);
}
