import 'package:freezed_annotation/freezed_annotation.dart';

part 'auth_event.freezed.dart';

@freezed
abstract class AuthEvent with _$AuthEvent {
  const factory AuthEvent.started() = _Started;

  const factory AuthEvent.checkSession() = _CheckSession;

  const factory AuthEvent.login({
    required String email,
    required String password,
  }) = _Login;

  const factory AuthEvent.register({
    required String name,
    required String email,
    required String password,
  }) = _Register;

  const factory AuthEvent.loginWithGoogle() = _LoginWithGoogle;

  const factory AuthEvent.logout() = _Logout;

  const factory AuthEvent.resetPassword({required String password}) =
      _ResetPassword;
}
