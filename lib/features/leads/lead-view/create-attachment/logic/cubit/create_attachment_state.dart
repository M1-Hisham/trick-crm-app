import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:trick_crm_app/features/leads/lead-view/create-attachment/data/model/create_attachment_model.dart';

part 'create_attachment_state.freezed.dart';

@freezed
class CreateAttachmentState with _$CreateAttachmentState {
  const factory CreateAttachmentState.initial() = _Initial;

  const factory CreateAttachmentState.loading() = Loading;
  const factory CreateAttachmentState.success(
      CreateAttachmentModel createAttachmentModel) = Success;
  const factory CreateAttachmentState.error(String message) = Error;
}
