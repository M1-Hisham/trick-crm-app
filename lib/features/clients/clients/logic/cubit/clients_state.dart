import 'package:freezed_annotation/freezed_annotation.dart';

import '../../data/model/clients_model.dart';

part 'clients_state.freezed.dart';

@freezed
class ClientsState with _$ClientsState {
  const factory ClientsState.initial() = _Initial;

  const factory ClientsState.loading() = Loading;
  const factory ClientsState.success(ClientsModel clientsModel) = Success;
  const factory ClientsState.error(String? message) = Error;
}
