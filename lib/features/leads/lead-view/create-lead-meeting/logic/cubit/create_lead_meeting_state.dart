import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:trick_crm_app/features/leads/lead-view/create-lead-meeting/data/model/create_lead_meeting_model.dart';

part 'create_lead_meeting_state.freezed.dart';

@freezed
class CreateLeadMeetingState with _$CreateLeadMeetingState {
  const factory CreateLeadMeetingState.initial() = _Initial;

  const factory CreateLeadMeetingState.loading() = Loading;
  const factory CreateLeadMeetingState.success(
      CreateLeadMeetingModel createLeadMeetingModel) = Success;
  const factory CreateLeadMeetingState.error(String message) = Error;
}
