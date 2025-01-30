import 'package:trick_crm_app/core/api/api_result.dart';
import 'package:trick_crm_app/core/api/api_service.dart';
import 'package:trick_crm_app/features/leads/lead-view/delete_attachment/data/model/delete_attachment_model.dart';

class DeleteAttachmentRepo {
  final ApiService _apiService;
  DeleteAttachmentRepo(this._apiService);

  Future<ApiResult<DeleteAttachmentModel>> deleteAttachment(
      int id, int idAttachment) async {
    try {
      final response = await _apiService.deleteAttachment(id, idAttachment);
      return ApiResult.success(response);
    } catch (e) {
      return ApiResult.error(e.toString());
    }
  }
}
