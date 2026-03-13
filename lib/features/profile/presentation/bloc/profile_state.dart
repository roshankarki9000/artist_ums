import 'package:freezed_annotation/freezed_annotation.dart';
import '../../domain/entities/profile_model.dart';

part 'profile_state.freezed.dart';

@freezed
class ProfileState with _$ProfileState {
  const factory ProfileState.initial() = _Initial;

  const factory ProfileState.loading() = _Loading;

  const factory ProfileState.loaded(ProfileModel profile) = _Loaded;

  const factory ProfileState.success(String message) = _Success;

  const factory ProfileState.error(String message) = _Error;
}
