import 'package:json_annotation/json_annotation.dart';

part 'create_lead_model.g.dart';

@JsonSerializable()
class CreateLeadModel {
  String? status;
  String? message;

  CreateLeadModel({this.status, this.message});

  factory CreateLeadModel.fromJson(Map<String, dynamic> json) =>
      _$CreateLeadModelFromJson(json);
}
