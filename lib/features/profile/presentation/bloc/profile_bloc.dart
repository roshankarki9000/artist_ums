import 'dart:io';

import 'package:artist_ums/features/profile/domain/repository/profile_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import 'profile_event.dart';
import 'profile_state.dart';

@injectable
class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  final ProfileRepository _repository;

  ProfileBloc(this._repository) : super(const ProfileState.initial()) {
    on<ProfileEvent>((event, emit) async {
      await event.when(
        loadProfile: () => _loadProfile(emit),
        updateUser: (id, name, coverFile) =>
            _updateUser(emit, id: id, name: name, coverFile: coverFile),
        deleteUser: (id) => _deleteUser(emit, id: id),
      );
    });
  }

  Future<void> _loadProfile(Emitter<ProfileState> emit) async {
    emit(const ProfileState.loading());

    final result = await _repository.getProfile();

    result.fold(
      (failure) => emit(ProfileState.error(failure.message)),
      (profile) => emit(ProfileState.loaded(profile)),
    );
  }

  Future<void> _updateUser(
    Emitter<ProfileState> emit, {
    required String id,
    required String name,
    required File? coverFile,
  }) async {
    emit(const ProfileState.loading());

    String? coverUrl;

    if (coverFile != null) {
      final uploadResult = await _repository.uploadProfileCover(
        file: coverFile,
      );

      uploadResult.fold(
        (failure) => emit(ProfileState.error(failure.message)),
        (url) => coverUrl = url,
      );
    }

    final result = await _repository.updateUser(
      id: id,
      name: name,
      coverUrl: coverUrl,
    );

    result.fold((failure) => emit(ProfileState.error(failure.message)), (_) {
      emit(const ProfileState.success("Profile Updated"));
      add(const ProfileEvent.loadProfile());
    });
  }

  Future<void> _deleteUser(
    Emitter<ProfileState> emit, {
    required String id,
  }) async {
    emit(const ProfileState.loading());

    final result = await _repository.deleteUser(id);

    result.fold(
      (failure) => emit(ProfileState.error(failure.message)),
      (_) => emit(const ProfileState.success("User Deleted")),
    );
  }
}
