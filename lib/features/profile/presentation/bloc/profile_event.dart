import 'dart:io';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'profile_event.freezed.dart';

@freezed
class ProfileEvent with _$ProfileEvent {
  const factory ProfileEvent.loadProfile() = _LoadProfile;

  const factory ProfileEvent.updateUser({
    required String id,
    required String name,
    File? coverFile,
  }) = _UpdateUser;

  const factory ProfileEvent.deleteUser({required String id}) = _DeleteUser;
}
