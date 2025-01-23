import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:trick_crm_app/features/leads/create-lead/data/models/create_lead_model.dart';

part 'create_lead_state.freezed.dart';

@freezed
class CreateLeadState with _$CreateLeadState {
  const factory CreateLeadState.initial() = _Initial;
  const factory CreateLeadState.loading() = Loading;
  const factory CreateLeadState.success(CreateLeadModel createLeadModel) =
      Success;
  const factory CreateLeadState.error({required String error}) = Error;

  /// for show form field data
  const factory CreateLeadState.showFields({required bool isShowFields}) =
      ShowFields;
}
