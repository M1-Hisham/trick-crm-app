import 'package:json_annotation/json_annotation.dart';

part 'create_lead_task_request_body.g.dart';

@JsonSerializable()
class CreateLeadTaskRequestBody {
  String? subject;
  String? description;
  String? dueDate;
  int? assignedTo;
  String? priority;
  String? status;

  CreateLeadTaskRequestBody({
    this.subject,
    this.description,
    this.dueDate,
    this.assignedTo,
    this.priority,
    this.status,
  });

  Map<String, dynamic> toJson() => _$CreateLeadTaskRequestBodyToJson(this);
}
