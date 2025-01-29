import 'dart:io';

import 'package:trick_crm_app/core/api/api_result.dart';

import '../../../../../../core/api/api_service.dart';
import '../model/create_attachment_model.dart';

class CreateAttachmentRepo {
  final ApiService _apiService;
  CreateAttachmentRepo(this._apiService);

  Future<ApiResult<CreateAttachmentModel>> createAttachment(
      {required int leadId, required File attachment}) async {
    try {
      final response = await _apiService.createAttachment(leadId, attachment);
      return ApiResult.success(response);
    } on Exception catch (e) {
      return ApiResult.error(e.toString());
    }
  }
}
