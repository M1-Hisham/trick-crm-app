import 'dart:io';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trick_crm_app/features/leads/lead-view/create-attachment/data/repo/create_attachment_repo.dart';

import 'create_attachment_state.dart';

class CreateAttachmentCubit extends Cubit<CreateAttachmentState> {
  final CreateAttachmentRepo _createAttachmentRepo;
  CreateAttachmentCubit(this._createAttachmentRepo)
      : super(const CreateAttachmentState.initial());

  void createAttachment(int leadId, File attachment) async {
    emit(const CreateAttachmentState.loading());

    final response = await _createAttachmentRepo.createAttachment(
        leadId: leadId, attachment: attachment);

    response.when(
      success: (createAttachmentModel) async {
        emit(CreateAttachmentState.success(createAttachmentModel));
      },
      error: (message) {
        emit(CreateAttachmentState.error(message));
      },
    );
  }
}
