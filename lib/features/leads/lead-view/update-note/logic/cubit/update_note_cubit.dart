import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trick_crm_app/features/leads/lead-view/update-note/data/repo/update_lead_note_repo.dart';

import 'update_note_state.dart';

class UpdateNoteCubit extends Cubit<UpdateNoteState> {
  final UpdateLeadNoteRepo _updateLeadNoteRepo;
  UpdateNoteCubit(this._updateLeadNoteRepo)
      : super(const UpdateNoteState.initial());

  void updateNote(int leadId, int noteId, String note) async {
    emit(const UpdateNoteState.loading());
    final response =
        await _updateLeadNoteRepo.updateLeadNote(leadId, noteId, note);
    response.when(
      success: (updateLeadNoteModel) {
        log("Cubit: Note updated successfully");
        emit(const UpdateNoteState.success());
      },
      error: (message) {
        log("Cubit: Error in update note cubit: $message");
        emit(UpdateNoteState.error(message));
      },
    );
  }
}
