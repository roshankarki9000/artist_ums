import 'package:artist_ums/core/error/failure/failure.dart';
import 'package:artist_ums/features/users/domain/entities/user_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'auth_state.freezed.dart';

@freezed
abstract class AuthState with _$AuthState {
  const factory AuthState.initial() = _Initial;

  const factory AuthState.loading() = _Loading;

  const factory AuthState.unauthenticated() = _Unauthenticated;

  const factory AuthState.authenticated(UserModel user) = _Authenticated;

  const factory AuthState.resetRequired() = _ResetRequired;

  const factory AuthState.error({required Failure failure}) = _Error;
}
