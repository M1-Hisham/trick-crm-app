import 'dart:developer';

import 'package:trick_crm_app/core/api/api_result.dart';

import '../../../../core/api/api_service.dart';
import '../models/leads_model.dart';

class LeadsRepo {
  final ApiService _apiService;
  LeadsRepo(this._apiService);

  Future<ApiResult<LeadsModel>> getLeadsData() async {
    try {
      final response = await _apiService.getLeads();
      log("Leads Repo: success");
      return ApiResult.success(response);
    } catch (e) {
      log("Error in Leads repo: $e");
      return ApiResult.error(e.toString());
    }
  }
}
