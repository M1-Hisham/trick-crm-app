import 'package:trick_crm_app/core/api/api_result.dart';
import 'package:trick_crm_app/features/clients/clients/data/model/clients_model.dart';

import '../../../../../core/api/api_service.dart';

class ClientsRepo {
  final ApiService _apiService;
  ClientsRepo(this._apiService);

  Future<ApiResult<ClientsModel>> getClients() async {
    try {
      final response = await _apiService.getClients();
      return ApiResult.success(response);
    } catch (e) {
      return ApiResult.error(e.toString());
    }
  }
}
