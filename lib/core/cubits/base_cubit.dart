import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trick_crm_app/core/cubits/base_state.dart';
import 'package:trick_crm_app/core/repo/base_repo.dart';

class BaseCubit<T> extends Cubit<BaseState<T>> {
  final BaseRepo<T> _repo;
  BaseCubit(this._repo) : super(const BaseState.initial());

  void getData() async {
    emit(const BaseState.loading());
    log("BaseCubit: getData called");
    final dataModel = await _repo.getData();
    dataModel.when(
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
