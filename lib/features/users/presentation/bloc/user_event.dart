import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_event.freezed.dart';

@freezed
class UserEvent with _$UserEvent {
  const factory UserEvent.getUsers() = GetUsers;

  const factory UserEvent.getCurrentUser() = GetCurrentUser;

  const factory UserEvent.createUser({
    required String name,
    required String email,
  }) = CreateUser;

  const factory UserEvent.updateUser({
    required String id,
    required String name,
  }) = UpdateUser;

  const factory UserEvent.deleteUser({required String id}) = DeleteUser;
}
