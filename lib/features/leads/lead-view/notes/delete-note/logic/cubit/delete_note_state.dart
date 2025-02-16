import 'package:freezed_annotation/freezed_annotation.dart';

import '../../data/model/delete_note_model.dart';

part 'delete_note_state.freezed.dart';

@freezed
class DeleteNoteState with _$DeleteNoteState {
  const factory DeleteNoteState.initial() = _Initial;

  const factory DeleteNoteState.loading() = Loading;
  const factory DeleteNoteState.success(DeleteNoteModel deleteNoteModel) =
      Success;
  const factory DeleteNoteState.error(String message) = Error;
}
