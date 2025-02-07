import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trick_crm_app/features/clients/clients/logic/cubit/clients_state.dart';

import '../../data/repo/clients_repo.dart';

class ClientsCubit extends Cubit<ClientsState> {
  final ClientsRepo _clientsRepo;
  ClientsCubit(this._clientsRepo) : super(const ClientsState.initial());

  void getClients() async {
    emit(const ClientsState.loading());
    final clientsModel = await _clientsRepo.getClients();
    clientsModel.when(
      success: (clientsModel) {
        emit(ClientsState.success(clientsModel));
      },
      error: (e) {
        emit(ClientsState.error(e.toString()));
      },
    );
  }
}
