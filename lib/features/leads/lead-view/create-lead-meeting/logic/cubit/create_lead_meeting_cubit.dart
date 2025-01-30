import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trick_crm_app/features/leads/lead-view/create-lead-meeting/data/model/create_lead_meeting_request_body.dart';
import 'package:trick_crm_app/features/leads/lead-view/create-lead-meeting/data/repo/create_lead_meeting_repo.dart';
import 'package:trick_crm_app/features/leads/lead-view/create-lead-meeting/logic/cubit/create_lead_meeting_state.dart';

class CreateLeadMeetingCubit extends Cubit<CreateLeadMeetingState> {
  final CreateLeadMeetingRepo _createLeadMeetingRepo;
  CreateLeadMeetingCubit(this._createLeadMeetingRepo)
      : super(const CreateLeadMeetingState.initial());

  void createLeadMeeting(int leadId,
      CreateLeadMeetingRequestBody createLeadMeetingRequestBody) async {
    emit(const CreateLeadMeetingState.loading());

    final response = await _createLeadMeetingRepo.createLeadMeeting(
        leadId, createLeadMeetingRequestBody);

    response.when(
      success: (createLeadMeetingModel) {
        emit(CreateLeadMeetingState.success(createLeadMeetingModel));
      },
      error: (message) {
        emit(CreateLeadMeetingState.error(message));
      },
    );
  }
}
