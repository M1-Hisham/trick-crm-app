import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_slider_drawer/flutter_slider_drawer.dart';

import '../../data/repo/dashboard_repo.dart';
import 'dashboard_state.dart';

class DashboardCubit extends Cubit<DashboardState> {
  final DashboardRepo _dashboardRepo;

  final GlobalKey<SliderDrawerState> key = GlobalKey<SliderDrawerState>();

  bool isOpenOrClose = false;

  DashboardCubit(this._dashboardRepo) : super(const DashboardState.initial());

  static DashboardCubit get(BuildContext context) {
    return BlocProvider.of(context);
  }

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

  void toggleMenu() {
    key.currentState?.toggle();
    isOpenOrClose = !isOpenOrClose;
    emit(DashboardState.menu(isOpenOrClose: isOpenOrClose));
  }

  void closeMenu() {
    if (isOpenOrClose) {
      key.currentState?.closeSlider();
      isOpenOrClose = !isOpenOrClose;
      emit(DashboardState.menu(isOpenOrClose: isOpenOrClose));
    }
  }
}
