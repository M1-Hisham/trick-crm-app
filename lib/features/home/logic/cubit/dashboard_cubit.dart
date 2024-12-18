import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/repo/dashboard_repo.dart';
import 'dashboard_state.dart';

class DashboardCubit extends Cubit<DashboardState> {
  final DashboardRepo _dashboardRepo;
  DashboardCubit(this._dashboardRepo) : super(const DashboardState.initial());

  void getDashboard() async {
    emit(const DashboardState.loading());
    log("DashboardCubit: getDashboard called");
    final dashboardData = await _dashboardRepo.dashboardData();
    dashboardData.when(
      success: (dashboardData) {
        log("Dashboard data: success");
        emit(DashboardState.success(dashboardData));
      },
      error: (message) {
        log("Error message DashboardCubit: $message");
        emit(const DashboardState.error(error: 'Failed to load dashboard'));
      },
    );
  }
}
