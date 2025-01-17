import 'dart:developer';
import 'package:trick_crm_app/core/api/api_result.dart';

import '../../../../../core/api/api_service.dart';
import '../model/leads_view_model.dart';

class LeadsViewRepo {
  final ApiService _apiService;
  LeadsViewRepo(this._apiService);

  Future<ApiResult<LeadsViewModel>> getLeadsView(int id) async {
    try {
      final response = await _apiService.getLeadsView(id);
      log("Leads View Repo: success");
      return ApiResult.success(response);
    } catch (e) {
      log("Error in Leads View Repo: $e");
      return ApiResult.error(e.toString());
    }
  }
}
