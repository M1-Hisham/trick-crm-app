import 'dart:developer';

import 'package:trick_crm_app/core/api/api_result.dart';

/// Generic repo class
class BaseRepo<T> {
  /// Fetch data from API Service
  final Future<T> Function()? _fetchData;

  /// Send data to API Service
  final Future<T> Function(dynamic requestBody)? _sendData;

  BaseRepo(
      {Future<T> Function()? fetchData, Future<T> Function(dynamic)? sendData})
      : _fetchData = fetchData,
        _sendData = sendData;

  /// @GET
  Future<ApiResult<T>> getData() async {
    try {
      if (_fetchData == null) {
        throw Exception("No fetchData function provided!");
      }
      final response = await _fetchData();
      log("Base Repo: success");
      return ApiResult.success(response);
    } catch (e) {
      log("Error in Base repo: $e");
      return ApiResult.error(e.toString());
    }
  }

  /// @POST
  Future<ApiResult<T>> sendData(dynamic requestBody) async {
    try {
      if (_sendData == null) {
        throw Exception("No sendData function provided!");
      }
      final response = await _sendData(requestBody);
      log("Base Repo: success");
      return ApiResult.success(response);
    } catch (e) {
      log("Error in Base repo: $e");
      return ApiResult.error(e.toString());
    }
  }
}
