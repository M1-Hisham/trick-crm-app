import 'dart:developer';

import '../../../../../core/api/api_result.dart';
import '../../../../../core/api/api_service.dart';
import '../models/create_lead_model.dart';
import '../models/create_lead_request_body.dart';

class CreateLeadRepo {
  final ApiService _apiService;
  CreateLeadRepo(this._apiService);

  /// create Lead repo
  Future<ApiResult<CreateLeadModel>> createLead(
      CreateLeadRequestBody creatLeadRequestBody) async {
    try {
      final response = await _apiService.createLead(creatLeadRequestBody);
      log("Lead created successfully");
      return ApiResult.success(response);
    } catch (e) {
      log("Error in create lead repo: $e");
      return ApiResult.error(e.toString());
    }
  }
}
