import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trick_crm_app/features/leads/create-lead/data/models/create_lead_request_body.dart';
import 'package:trick_crm_app/features/leads/create-lead/data/repo/create_lead_repo.dart';

import 'create_lead_state.dart';

class CreateLeadCubit extends Cubit<CreateLeadState> {
  final CreateLeadRepo _createLeadRepo;
  CreateLeadCubit(this._createLeadRepo)
      : super(const CreateLeadState.initial());

  void emitCreateLeadState(CreateLeadRequestBody createLeadRequestBody) async {
    emit(const CreateLeadState.loading());

    final response = await _createLeadRepo.createLead(createLeadRequestBody);

    response.when(
      success: (createLeadModel) async {
        emit(CreateLeadState.success(createLeadModel));
        log("Lead created successfully");
        log('status: ${createLeadModel.status}');
        log('message ${createLeadModel.message}');
      },
      error: (message) {
        emit(CreateLeadState.error(error: message));
        log("Error in create lead cubit: $message");
      },
    );
  }
}
