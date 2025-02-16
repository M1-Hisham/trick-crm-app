import 'dart:developer';

import 'package:trick_crm_app/core/api/api_service.dart';
import 'package:trick_crm_app/features/leads/lead-view/notes/create-note/data/model/create_lead_note_model.dart';
import 'package:trick_crm_app/features/leads/lead-view/notes/create-note/data/model/create_lead_note_reqest_body.dart';

import '../../../../../../../core/api/api_result.dart';

class CreateNoteRepo {
  final ApiService _apiService;
  CreateNoteRepo(this._apiService);

  Future<ApiResult<CreateLeadNoteModel>> createNote(
      int leadId, CreateLeadNoteRequestBody comment) async {
    try {
      final response = await _apiService.createLeadNote(leadId, comment);
      log("Note created successfully");
      return ApiResult.success(response);
    } catch (e) {
      log("Error in create note repo: $e");
      return ApiResult.error(e.toString());
    }
  }
}
