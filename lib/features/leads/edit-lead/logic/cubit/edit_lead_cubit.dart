import 'dart:developer';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:trick_crm_app/features/leads/edit-lead/data/repo/edit_lead_repo.dart';

import '../../data/model/edit_lead_model.dart';

part 'edit_lead_state.dart';
part 'edit_lead_cubit.freezed.dart';

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
