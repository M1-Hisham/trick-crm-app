import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:trick_crm_app/features/leads/data/repo/leads_repo.dart';

import '../../data/models/leads_model.dart';

part 'leads_state.dart';
part 'leads_cubit.freezed.dart';

class LeadsCubit extends Cubit<LeadsState> {
  final LeadsRepo _leadsRepo;
  LeadsCubit(this._leadsRepo) : super(const LeadsState.initial());
  void getLeads() async {
    emit(const LeadsState.loading());
    log("LeadsCubit: getLeads called");
    final leadsModel = await _leadsRepo.getLeadsData();
    leadsModel.when(
      success: (leadsModel) {
        log("Leads data cubit: success");
        emit(LeadsState.success(leadsModel));
      },
      error: (e) {
        log("Error message LeadsCubit: $e");
        emit(LeadsState.error(e.toString()));
      },
    );
  }
}
