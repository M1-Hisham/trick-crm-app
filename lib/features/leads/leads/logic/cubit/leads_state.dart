import 'package:freezed_annotation/freezed_annotation.dart';

import '../../data/models/leads_model.dart';

part 'leads_state.freezed.dart';

@freezed
class LeadsState with _$LeadsState {
  const factory LeadsState.initial() = _Initial;

  const factory LeadsState.loading() = Loading;
  const factory LeadsState.success(LeadsModel leadsModel) = Success;
  const factory LeadsState.error(String? message) = Error;
}
