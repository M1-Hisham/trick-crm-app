import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/repo/delete_note_repo.dart';
import 'delete_note_state.dart';

class DeleteNoteCubit extends Cubit<DeleteNoteState> {
  final DeleteNoteRepo _deleteNoteRepo;
  DeleteNoteCubit(this._deleteNoteRepo)
      : super(const DeleteNoteState.initial());

  void deleteNote(int id, int idNote) async {
    emit(const DeleteNoteState.loading());
    final result = await _deleteNoteRepo.deleteNote(id, idNote);
    result.when(
      success: (deleteNoteModel) {
        emit(DeleteNoteState.success(deleteNoteModel));
      },
      error: (message) {
        emit(DeleteNoteState.error(message));
      },
    );
  }
}
