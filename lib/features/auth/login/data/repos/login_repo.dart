import 'dart:developer';

import 'package:trick_crm_app/core/api/api_result.dart';
import 'package:trick_crm_app/core/api/api_service.dart';
import 'package:trick_crm_app/features/auth/login/data/models/login_request_body.dart';
import 'package:trick_crm_app/features/auth/login/data/models/login_response.dart';

/// Login Repository Interface for Login
class LoginRepo {
  final ApiService _apiService;

  LoginRepo(this._apiService);

  /// Login API call
  Future<ApiResult<LoginResponseModel>> login(
      LoginRequestBody loginRequestBody) async {
    try {
      final response = await _apiService.login(loginRequestBody);
      return ApiResult.success(response);
    } catch (e) {
      log("Error in login repo: $e");
      return ApiResult.error(e.toString());
    }
  }
}
