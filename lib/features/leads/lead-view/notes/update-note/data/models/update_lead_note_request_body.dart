import 'package:json_annotation/json_annotation.dart';

part 'update_lead_note_request_body.g.dart';

@JsonSerializable()
class UpdateLeadNoteRequestBody {
  String? comment;
  UpdateLeadNoteRequestBody({
    this.comment,
  });

  Map<String, dynamic> toJson() => _$UpdateLeadNoteRequestBodyToJson(this);
}
