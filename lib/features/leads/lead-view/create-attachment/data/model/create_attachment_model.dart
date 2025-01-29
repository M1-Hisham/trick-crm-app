import 'package:json_annotation/json_annotation.dart';

part 'create_attachment_model.g.dart';

@JsonSerializable()
class CreateAttachmentModel {
  String? status;
  String? message;
  CreateAttachmentModel(this.status, this.message);

  factory CreateAttachmentModel.fromJson(Map<String, dynamic> json) =>
      _$CreateAttachmentModelFromJson(json);
}
