part of 'leads_cubit.dart';

@freezed
class LeadsState with _$LeadsState {
  const factory LeadsState.initial() = _Initial;

  const factory LeadsState.loading() = Loading;
  const factory LeadsState.success(LeadsModel leadsModel) = Success;
  const factory LeadsState.error(String? message) = Error;
}
