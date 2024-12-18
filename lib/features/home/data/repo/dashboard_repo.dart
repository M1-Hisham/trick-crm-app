import 'dart:developer';

import 'package:trick_crm_app/core/api/api_result.dart';

import '../../../../core/api/api_service.dart';
import '../models/dashboard_response.dart';

class DashboardRepo {
  final ApiService _apiService;
  DashboardRepo(this._apiService);
  Future<ApiResult<DashboardResponseModel>> dashboardData() async {
    try {
      final dashboardResponseModel = await _apiService.getDashboard();
      return ApiResult.success(dashboardResponseModel);
    } catch (e) {
      log("Error in Dashboard repo: $e");
      return ApiResult.error(e.toString());
    }
  }
}
