import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trick_crm_app/features/leads/lead-view/create-note/data/model/create_lead_note_reqest_body.dart';
import 'package:trick_crm_app/features/leads/lead-view/create-note/data/repo/create_note_repo.dart';

import 'create_note_state.dart';

class CreateNoteCubit extends Cubit<CreateNoteState> {
  final CreateNoteRepo _createNoteRepo;
  CreateNoteCubit(this._createNoteRepo)
      : super(const CreateNoteState.initial());

  void createNote(
      int leadId, CreateLeadNoteRequestBody createLeadNoteRequestBody) async {
    emit(const CreateNoteState.loading());
    final response =
        await _createNoteRepo.createNote(leadId, createLeadNoteRequestBody);

    response.when(
      success: (createLeadNoteModel) async {
        emit(CreateNoteState.success(createLeadNoteModel));
        log("Cubit: Note created successfully");
      },
      error: (message) {
        emit(CreateNoteState.error(message));
        log("Cubit: Error in create note cubit: $message");
      },
    );
  }
}
