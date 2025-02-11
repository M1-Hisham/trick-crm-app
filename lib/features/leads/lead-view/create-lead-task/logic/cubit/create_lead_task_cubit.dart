import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trick_crm_app/features/leads/lead-view/create-lead-task/data/model/create_lead_task_request_body.dart';

import '../../data/repo/create_lead_task_repo.dart';
import 'create_lead_task_state.dart';

class CreateLeadTaskCubit extends Cubit<CreateLeadTaskState> {
  final CreateLeadTaskRepo _createLeadTaskRepo;
  CreateLeadTaskCubit(this._createLeadTaskRepo)
      : super(const CreateLeadTaskState.initial());

  void createLeadTask(
      int leadId, CreateLeadTaskRequestBody createLeadTaskRequestBody) async {
    emit(const CreateLeadTaskState.loading());
    final response = await _createLeadTaskRepo.createLeadTask(
        leadId, createLeadTaskRequestBody);

    response.when(success: (createLeadTaskModel) {
      emit(CreateLeadTaskState.success(createLeadTaskModel));
    }, error: (message) {
      emit(CreateLeadTaskState.error(message));
    });
  }
}
