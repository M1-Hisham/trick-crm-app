import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trick_crm_app/features/auth/login/data/models/login_request_body.dart';
import 'package:trick_crm_app/features/auth/login/data/repos/login_repo.dart';

import 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  final LoginRepo _loginRepo;
  LoginCubit(this._loginRepo) : super(const LoginState.initial());
  final formKey = GlobalKey<FormState>();
  final email = TextEditingController();
  final password = TextEditingController();

  /// emit login states
  void emitLoginStates() async {
    emit(const LoginState.loading());
    final response = await _loginRepo.login(
      LoginRequestBody(
        email: email.text,
        password: password.text,
      ),
    );
    response.when(
      success: (data) {
        emit(LoginState.success(data));
      },
      error: (message) {
        emit(LoginState.error(error: message));
      },
    );
  }
}
