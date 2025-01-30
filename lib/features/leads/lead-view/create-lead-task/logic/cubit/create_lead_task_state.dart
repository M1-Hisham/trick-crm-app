import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:trick_crm_app/features/leads/lead-view/create-lead-task/data/model/create_lead_task_model.dart';

part 'create_lead_task_state.freezed.dart';

@freezed
class CreateLeadTaskState with _$CreateLeadTaskState {
  const factory CreateLeadTaskState.initial() = _Initial;

  const factory CreateLeadTaskState.loading() = Loading;
  const factory CreateLeadTaskState.success(
      CreateLeadTaskModel createLeadTaskModel) = Success;
  const factory CreateLeadTaskState.error(String message) = Error;
}
