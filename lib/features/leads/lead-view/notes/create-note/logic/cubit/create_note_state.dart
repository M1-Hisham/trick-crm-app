import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:trick_crm_app/features/leads/lead-view/notes/create-note/data/model/create_lead_note_model.dart';

part 'create_note_state.freezed.dart';

@freezed
class CreateNoteState with _$CreateNoteState {
  const factory CreateNoteState.initial() = _Initial;
  const factory CreateNoteState.loading() = Loading;
  const factory CreateNoteState.success(
      CreateLeadNoteModel createLeadNoteModel) = Success;
  const factory CreateNoteState.error(String? error) = Error;
}
