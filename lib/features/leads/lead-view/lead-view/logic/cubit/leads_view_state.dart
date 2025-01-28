part of 'leads_view_cubit.dart';

@freezed
class LeadsViewState with _$LeadsViewState {
  const factory LeadsViewState.initial() = _Initial;

  const factory LeadsViewState.loading() = Loading;
  const factory LeadsViewState.success(LeadsViewModel leadsViewModel) = Success;
  const factory LeadsViewState.error(String? message) = Error;
}
