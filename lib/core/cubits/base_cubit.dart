import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trick_crm_app/core/cubits/base_state.dart';
import 'package:trick_crm_app/core/repo/base_repo.dart';

class BaseCubit<T> extends Cubit<BaseState<T>> {
  final BaseRepo<T> _repo;
  BaseCubit(this._repo) : super(const BaseState.initial());

  /// Fetch data from API Service
  Future<void> getData({Map<String, dynamic>? params}) async {
    emit(const BaseState.loading());
    log("BaseCubit: getData called");
    final response = await _repo.getData(params: params);
    response.when(
      success: (data) {
        log("Data cubit: success");
        emit(BaseState.success(data));
      },
      error: (e) {
        log("Error message BaseCubit: $e");
        emit(BaseState.error(e.toString()));
      },
    );
  }

  /// Send data to API Service
  Future<void> sendData(dynamic requestBody,
      {Map<String, dynamic>? params}) async {
    emit(const BaseState.loading());
    log("BaseCubit: sendData called");
    final response = await _repo.sendData(requestBody, params: params);
    response.when(
      success: (data) {
        log("Data cubit: success");
        emit(BaseState.success(data));
      },
      error: (e) {
        log("Error message BaseCubit: $e");
        emit(BaseState.error(e.toString()));
      },
    );
  }
}
