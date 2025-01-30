import 'package:json_annotation/json_annotation.dart';

part 'create_lead_meeting_request_body.g.dart';

@JsonSerializable()
class CreateLeadMeetingRequestBody {
  String? title;
  String? hostId;
  List<String>? participants;
  String? description;
  String? location;

  CreateLeadMeetingRequestBody({
    this.title,
    this.hostId,
    this.participants,
    this.description,
    this.location,
  });

  Map<String, dynamic> toJson() => _$CreateLeadMeetingRequestBodyToJson(this);
}
