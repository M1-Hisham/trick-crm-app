import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:trick_crm_app/features/auth/login/data/models/login_response.dart';

part 'login_state.freezed.dart';

/// Login State for cubit state management
@freezed
class LoginState<T> with _$LoginState<T> {
  const factory LoginState.initial() = _Initial;
  const factory LoginState.loading() = Loading;
  const factory LoginState.success(LoginResponseModel loginResponsedataModel) = Success;
  const factory LoginState.error({required String error}) = Error;
}
