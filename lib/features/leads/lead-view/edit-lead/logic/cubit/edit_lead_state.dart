import 'package:freezed_annotation/freezed_annotation.dart';

import '../../data/model/edit_lead_model.dart';

part 'edit_lead_state.freezed.dart';

@freezed
class EditLeadState with _$EditLeadState {
  const factory EditLeadState.initial() = _Initial;

  const factory EditLeadState.loading() = Loading;
  const factory EditLeadState.success(EditLeadModel editLeadModel) = Success;
  const factory EditLeadState.error(String error) = Error;
}
