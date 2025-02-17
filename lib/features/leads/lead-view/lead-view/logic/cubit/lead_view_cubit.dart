import 'package:trick_crm_app/core/api/api_service.dart';
import '../../../../../../core/cubits/base_cubit.dart';
import '../../../../../../core/repo/base_repo.dart';
import '../../data/model/leads_view_model.dart';

class LeadViewCubit extends BaseCubit<LeadsViewModel> {
  LeadViewCubit(ApiService apiService)
      : super(
          BaseRepo(
            fetchData: ({Map<String, dynamic>? params}) =>
                apiService.getLeadsView(params!['id']),
          ),
        );
  Future<void> getLeadsView(int leadId) async {
    await getData(params: {'id': leadId});
  }
}
