import 'package:freezed_annotation/freezed_annotation.dart';

import '../../data/models/dashboard_response.dart';

part 'dashboard_state.freezed.dart';

@freezed
class DashboardState with _$DashboardState {
  const factory DashboardState.initial() = _Initial;

  const factory DashboardState.loading() = Loading;
  const factory DashboardState.success(DashboardResponseModel dashboardData) = Success;
  const factory DashboardState.error({required String error}) = Error;
}
