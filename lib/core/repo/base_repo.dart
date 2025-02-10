import 'dart:developer';

import 'package:trick_crm_app/core/api/api_result.dart';

/// Generic repo class
class BaseRepo<T> {
  /// Fetch data from API Service
  final Future<T> Function() _fetchData;

  BaseRepo(this._fetchData);

  Future<ApiResult<T>> getData() async {
    try {
      final response = await _fetchData();
      log("Base Repo: success");
      return ApiResult.success(response);
    } catch (e) {
      log("Error in Base repo: $e");
      return ApiResult.error(e.toString());
    }
  }
}
