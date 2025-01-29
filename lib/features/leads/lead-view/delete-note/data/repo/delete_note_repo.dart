import 'package:trick_crm_app/core/api/api_result.dart';

import '../../../../../../core/api/api_service.dart';
import '../model/delete_note_model.dart';

class DeleteNoteRepo {
  final ApiService _apiService;
  DeleteNoteRepo(this._apiService);

  Future<ApiResult<DeleteNoteModel>> deleteNote(int id, int idNote) async {
    try {
      final response = await _apiService.deleteLeadNote(id, idNote);
      return ApiResult.success(response);
    } catch (e) {
      return ApiResult.error(e.toString());
    }
  }
}
