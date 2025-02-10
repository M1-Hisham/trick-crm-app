import 'package:trick_crm_app/core/api/api_service.dart';
import 'package:trick_crm_app/core/repo/base_repo.dart';

import '../../../../../core/cubits/base_cubit.dart';
import '../../data/model/clients_model.dart';

class ClientsCubit extends BaseCubit<ClientsModel> {
  ClientsCubit(ApiService apiService)
      : super(BaseRepo(fetchData: () => apiService.getClients()));
}
