import 'package:json_annotation/json_annotation.dart';

part 'delete_attachment_model.g.dart';

@JsonSerializable()
class DeleteAttachmentModel {
  final String? success;
  final String? message;
  DeleteAttachmentModel({
    this.success,
    this.message,
  });
  factory DeleteAttachmentModel.fromJson(Map<String, dynamic> json) =>
      _$DeleteAttachmentModelFromJson(json);
}
