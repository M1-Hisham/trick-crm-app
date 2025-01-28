part of 'edit_lead_cubit.dart';

@freezed
class EditLeadState with _$EditLeadState {
  const factory EditLeadState.initial() = _Initial;

  const factory EditLeadState.loading() = Loading;
  const factory EditLeadState.success(EditLeadModel editLeadModel) = Success;
  const factory EditLeadState.error(String error) = Error;
}
