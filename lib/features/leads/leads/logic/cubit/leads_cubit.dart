import 'package:trick_crm_app/core/api/api_service.dart';
import 'package:trick_crm_app/core/cubits/base_cubit.dart';
import 'package:trick_crm_app/core/repo/base_repo.dart';

import '../../data/models/leads_model.dart';

class LeadsCubit extends BaseCubit<LeadsModel> {
  LeadsCubit(ApiService apiService)
      : super(BaseRepo(fetchData: ({params}) => apiService.getLeads()));
}
