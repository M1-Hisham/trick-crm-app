import 'package:trick_crm_app/core/api/api_result.dart';

import '../../../../../../core/api/api_service.dart';
import '../model/create_lead_task_model.dart';
import '../model/create_lead_task_request_body.dart';

class CreateLeadTaskRepo {
  final ApiService _apiService;
  CreateLeadTaskRepo(this._apiService);

  Future<ApiResult<CreateLeadTaskModel>> createLeadTask(
      int leadId, CreateLeadTaskRequestBody createLeadTaskRequestBody) async {
    try {
      final response =
          await _apiService.createLeadTask(leadId, createLeadTaskRequestBody);
      return ApiResult.success(response);
    } catch (e) {
      return ApiResult.error(e.toString());
    }
  }
}
