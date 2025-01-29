import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:trick_crm_app/features/leads/lead-view/update-note/data/models/update_lead_note_model.dart';

part 'update_note_state.freezed.dart';

@freezed
class UpdateNoteState with _$UpdateNoteState {
  const factory UpdateNoteState.initial() = _Initial;

  const factory UpdateNoteState.loading() = Loading;
  const factory UpdateNoteState.success(
      UpdateLeadNoteModel updateLeadNoteModel) = Success;
  const factory UpdateNoteState.error(String message) = Error;
}
