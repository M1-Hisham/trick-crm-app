import 'dart:developer';
import 'package:trick_crm_app/features/leads/edit-lead/data/model/edit_lead_model.dart';

import '../../../../../core/api/api_result.dart';
import '../../../../../core/api/api_service.dart';

class EditLeadRepo {
  final ApiService _apiService;
  EditLeadRepo(this._apiService);

  Future<ApiResult<EditLeadModel>> getEditLead(int id) async {
    try {
      final response = await _apiService.getEditLead(id);
      log("Edit Lead Repo: success");
      return ApiResult.success(response);
    } catch (e) {
      log("Error in Edit Lead Repo: $e");
      return ApiResult.error(e.toString());
    }
  }
}
