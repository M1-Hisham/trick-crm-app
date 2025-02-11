import 'package:json_annotation/json_annotation.dart';

part 'create_lead_task_model.g.dart';

@JsonSerializable()
class CreateLeadTaskModel {
  String? status;
  String? message;
  Errors? errors;
  CreateLeadTaskModel({this.status, this.message, this.errors});

  factory CreateLeadTaskModel.fromJson(Map<String, dynamic> json) =>
      _$CreateLeadTaskModelFromJson(json);
}

@JsonSerializable()
class Errors {
  List<String>? subject;
  List<String>? assignedTo;

  Errors({this.subject, this.assignedTo});
  factory Errors.fromJson(Map<String, dynamic> json) => _$ErrorsFromJson(json);
}
