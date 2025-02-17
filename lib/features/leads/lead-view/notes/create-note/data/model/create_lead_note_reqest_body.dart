import 'package:json_annotation/json_annotation.dart';

part 'create_lead_note_reqest_body.g.dart';

@JsonSerializable()
class CreateLeadNoteRequestBody {
  String? comment;
  CreateLeadNoteRequestBody({required this.comment});

  Map<String, dynamic> toJson() => _$CreateLeadNoteRequestBodyToJson(this);
}
