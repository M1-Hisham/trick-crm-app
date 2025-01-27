import 'package:json_annotation/json_annotation.dart';

part 'create_lead_note_reqest_body.g.dart';

@JsonSerializable()
class CreateLeadNoteRequestBody {
  String? comment;
  CreateLeadNoteRequestBody({this.comment});

  factory CreateLeadNoteRequestBody.fromJson(Map<String, dynamic> json) => _$CreateLeadNoteRequestBodyFromJson(json);
}
