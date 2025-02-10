import 'dart:developer';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trick_crm_app/features/leads/lead-view/edit-lead/data/repo/edit_lead_repo.dart';

import 'edit_lead_state.dart';



class EditLeadCubit extends Cubit<EditLeadState> {
  final EditLeadRepo _editLeadRepo;
  EditLeadCubit(this._editLeadRepo) : super(const EditLeadState.initial());

  void getEditLead(int id) async {
    emit(const EditLeadState.loading());
    log("EditLeadCubit: getEditLead called");
    final editLeadModel = await _editLeadRepo.getEditLead(id);
    editLeadModel.when(
      success: (editLeadModel) {
        log("Edit Lead data cubit: success");
        emit(EditLeadState.success(editLeadModel));
      },
      error: (e) {
        log("Error message EditLeadCubit: $e");
        emit(EditLeadState.error(e.toString()));
      },
    );
  }
}
