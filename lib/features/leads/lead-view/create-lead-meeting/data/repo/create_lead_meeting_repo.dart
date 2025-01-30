import 'package:trick_crm_app/core/api/api_result.dart';
import 'package:trick_crm_app/core/api/api_service.dart';
import 'package:trick_crm_app/features/leads/lead-view/create-lead-meeting/data/model/create_lead_meeting_model.dart';

import '../model/create_lead_meeting_request_body.dart';

class CreateLeadMeetingRepo {
  final ApiService _apiService;
  CreateLeadMeetingRepo(this._apiService);

  Future<ApiResult<CreateLeadMeetingModel>> createLeadMeeting(int leadId,
      CreateLeadMeetingRequestBody createLeadMeetingRequestBody) async {
    try {
      final response = await _apiService.createLeadMeeting(
          leadId, createLeadMeetingRequestBody);
      return ApiResult.success(response);
    } catch (e) {
      return ApiResult.error(e.toString());
    }
  }
}
