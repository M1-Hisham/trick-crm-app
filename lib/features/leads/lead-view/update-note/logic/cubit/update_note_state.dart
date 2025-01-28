import 'package:freezed_annotation/freezed_annotation.dart';

part 'update_note_state.freezed.dart';

@freezed
class UpdateNoteState with _$UpdateNoteState {
  const factory UpdateNoteState.initial() = _Initial;

  const factory UpdateNoteState.loading() = Loading;
  const factory UpdateNoteState.success() = Success;
  const factory UpdateNoteState.error(String message) = Error;
}
