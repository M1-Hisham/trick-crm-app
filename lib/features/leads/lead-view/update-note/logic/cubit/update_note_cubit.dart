import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trick_crm_app/features/leads/lead-view/update-note/data/repo/update_lead_note_repo.dart';

import '../../data/models/update_lead_note_request_body.dart';
import 'update_note_state.dart';

class UpdateNoteCubit extends Cubit<UpdateNoteState> {
  final UpdateLeadNoteRepo _updateLeadNoteRepo;
  UpdateNoteCubit(this._updateLeadNoteRepo)
      : super(const UpdateNoteState.initial());

  void updateNote(int leadId, int noteId,
      UpdateLeadNoteRequestBody updateLeadNoteRequestBody) async {
    emit(const UpdateNoteState.loading());
    final response = await _updateLeadNoteRepo.updateLeadNote(
        leadId, noteId, updateLeadNoteRequestBody);
    response.when(
      success: (updateLeadNoteModel) {
        log("Cubit: Note updated successfully");
        emit(UpdateNoteState.success(updateLeadNoteModel));
      },
      error: (message) {
        log("Cubit: Error in update note cubit: $message");
        emit(UpdateNoteState.error(message));
      },
    );
  }
}
