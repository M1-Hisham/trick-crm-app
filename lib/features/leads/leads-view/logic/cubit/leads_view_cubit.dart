import 'dart:developer';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../data/model/leads_view_model.dart';
import '../../data/repo/leads_view_repo.dart';

part 'leads_view_state.dart';
part 'leads_view_cubit.freezed.dart';

class LeadsViewCubit extends Cubit<LeadsViewState> {
  final LeadsViewRepo _leadsViewRepo;
  LeadsViewCubit(this._leadsViewRepo) : super(const LeadsViewState.initial());
  void getLeadsView(int id) async {
    emit(const LeadsViewState.loading());
    log("LeadsViewCubit: getLeads called");
    final leadsViewModel = await _leadsViewRepo.getLeadsView(id);
    leadsViewModel.when(
      success: (leadsViewModel) {
        log("Leads data cubit: success");
        emit(LeadsViewState.success(leadsViewModel));
      },
      error: (e) {
        log("Error message LeadsViewCubit: $e");
        emit(LeadsViewState.error(e.toString()));
      },
    );
  }
}
