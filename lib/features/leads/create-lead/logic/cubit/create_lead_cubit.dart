import 'package:trick_crm_app/core/api/api_service.dart';
import 'package:trick_crm_app/core/cubits/base_cubit.dart';
import 'package:trick_crm_app/core/repo/base_repo.dart';

import '../../data/models/create_lead_model.dart';
import '../../data/models/create_lead_request_body.dart';

class CreateLeadCubit extends BaseCubit<CreateLeadModel> {
  CreateLeadCubit(ApiService apiService)
      : super(BaseRepo(
            sendData: (requestBody, {Map<String, dynamic>? params}) =>
                apiService.createLead(requestBody)));

  Future<void> createLead(CreateLeadRequestBody createLeadRequestBody) async {
    await sendData(createLeadRequestBody);
  }
}
