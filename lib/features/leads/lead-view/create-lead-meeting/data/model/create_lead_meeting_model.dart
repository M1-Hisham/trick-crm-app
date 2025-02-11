import 'package:json_annotation/json_annotation.dart';

part 'create_lead_meeting_model.g.dart';

@JsonSerializable()
class CreateLeadMeetingModel {
  String? status;
  String? message;
  CreateLeadMeetingModel({
    this.status,
    this.message,
  });
  factory CreateLeadMeetingModel.fromJson(Map<String, dynamic> json) =>
      _$CreateLeadMeetingModelFromJson(json);
}
