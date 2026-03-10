import 'package:artist_ums/core/error/failure/failure.dart';
import 'package:artist_ums/features/users/domain/entities/user_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_state.freezed.dart';

@freezed
class UserState with _$UserState {
  const factory UserState.initial() = Initial;

  const factory UserState.loading() = Loading;

  const factory UserState.usersLoaded({required List<UserModel> users}) =
      UsersLoaded;

  const factory UserState.userLoaded({required UserModel user}) = UserLoaded;

  const factory UserState.success() = Success;

  const factory UserState.error({required Failure failure}) = Error;
}
