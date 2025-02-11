import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trick_crm_app/features/leads/lead-view/delete_attachment/data/repo/delete_attachment_repo.dart';

import 'delete_attachment_state.dart';

class DeleteAttachmentCubit extends Cubit<DeleteAttachmentState> {
  final DeleteAttachmentRepo _deleteAttachmentRepo;
  DeleteAttachmentCubit(this._deleteAttachmentRepo)
      : super(const DeleteAttachmentState.initial());

  void deleteAttachment(
      {required int leadId, required int idAttachment}) async {
    emit(const DeleteAttachmentState.loading());
    final response =
        await _deleteAttachmentRepo.deleteAttachment(leadId, idAttachment);
    response.when(success: (deleteAttachmentModel) {
      emit(DeleteAttachmentState.success(deleteAttachmentModel));
    }, error: (message) {
      emit(DeleteAttachmentState.error(message));
    });
  }
}
