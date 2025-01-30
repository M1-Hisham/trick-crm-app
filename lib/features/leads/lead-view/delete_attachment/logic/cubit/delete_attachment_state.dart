import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:trick_crm_app/features/leads/lead-view/delete_attachment/data/model/delete_attachment_model.dart';

part 'delete_attachment_state.freezed.dart';

@freezed
class DeleteAttachmentState with _$DeleteAttachmentState {
  const factory DeleteAttachmentState.initial() = _initial;

  const factory DeleteAttachmentState.loading() = Loading;
  const factory DeleteAttachmentState.success(
      DeleteAttachmentModel deleteAttachmentModel) = Success;
  const factory DeleteAttachmentState.error(String message) = Error;
}
