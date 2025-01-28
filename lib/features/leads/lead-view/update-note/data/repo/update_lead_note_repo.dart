import 'package:trick_crm_app/core/api/api_result.dart';
import 'package:trick_crm_app/features/leads/lead-view/update-note/data/models/update_lead_note_model.dart';

import '../../../../../../core/api/api_service.dart';
import '../models/update_lead_note_request_body.dart';

class UpdateLeadNoteRepo {
  final ApiService _apiService;
  UpdateLeadNoteRepo(this._apiService);

  Future<ApiResult<UpdateLeadNoteModel>> updateLeadNote(
      int leadId, int noteId, String note) async {
    try {
      final response = await _apiService.updateLeadNote(
        leadId,
        noteId,
        UpdateLeadNoteRequestBody(comment: note),
      );
      return ApiResult.success(response);
    } catch (e) {
      return ApiResult.error(e.toString());
    }
  }
}
