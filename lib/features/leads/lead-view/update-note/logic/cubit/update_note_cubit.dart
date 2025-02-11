import 'package:trick_crm_app/core/cubits/base_cubit.dart';
import 'package:trick_crm_app/features/leads/lead-view/update-note/data/models/update_lead_note_request_body.dart';

import '../../../../../../core/api/api_service.dart';
import '../../../../../../core/repo/base_repo.dart';
import '../../data/models/update_lead_note_model.dart';

class UpdateNoteCubit extends BaseCubit<UpdateLeadNoteModel> {
  UpdateNoteCubit(ApiService apiService)
      : super(BaseRepo(
            sendData: (requestBody, {Map<String, dynamic>? params}) =>
                apiService.updateLeadNote(
                    params!['id'], params['idNote'], requestBody)));

  Future<void> updateNote(
      int leadId, int noteId, UpdateLeadNoteRequestBody requestBody) async {
    await sendData(requestBody, params: {'id': leadId, 'idNote': noteId});
  }
}
