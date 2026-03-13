import 'dart:io';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../../domain/repository/artist_repository.dart';
import 'artist_event.dart';
import 'artist_state.dart';

@injectable
class ArtistBloc extends Bloc<ArtistEvent, ArtistState> {
  final ArtistRepository _repository;

  ArtistBloc(this._repository) : super(const ArtistState.initial()) {
    on<ArtistEvent>((event, emit) async {
      await event.when(
        loadArtists: () => _loadArtists(emit),
        createArtist: (name, bio, coverUrl) =>
            _createArtist(emit, name: name, bio: bio, coverUrl: coverUrl),
        updateArtist: (id, name, bio, coverUrl) => _updateArtist(
          emit,
          id: id,
          name: name,
          bio: bio,
          coverUrl: coverUrl,
        ),
        deleteArtist: (id) => _deleteArtist(emit, id: id),
      );
    });
  }

  Future<void> _loadArtists(Emitter<ArtistState> emit) async {
    emit(const ArtistState.loading());

    final result = await _repository.getArtists();

    result.fold(
      (failure) => emit(ArtistState.error(failure.message)),
      (artists) => emit(ArtistState.loaded(artists)),
    );
  }

  Future<void> _createArtist(
    Emitter<ArtistState> emit, {
    required String name,
    required String? bio,
    required File? coverUrl,
  }) async {
    emit(const ArtistState.loading());
    String? coverUrl_;
    if (coverUrl != null) {
      final uploadResult = await _repository.uploadArtistCover(file: coverUrl);
      uploadResult.fold(
        (failure) => emit(ArtistState.error(failure.message)),
        (url) => coverUrl_ = url,
      );
    }

    final result = await _repository.createArtist(
      name: name,
      bio: bio,
      coverUrl: coverUrl_,
    );

    result.fold((failure) => emit(ArtistState.error(failure.message)), (_) {
      emit(const ArtistState.success('Artist Added Successfully'));
      add(const ArtistEvent.loadArtists());
    });
  }

  Future<void> _updateArtist(
    Emitter<ArtistState> emit, {
    required String id,
    required String name,
    required String? bio,
    required File? coverUrl,
  }) async {
    emit(const ArtistState.loading());

    final result = await _repository.updateArtist(id: id, name: name, bio: bio);

    result.fold((failure) => emit(ArtistState.error(failure.message)), (_) {
      emit(const ArtistState.success('Artist Updated Successfully'));
      add(const ArtistEvent.loadArtists());
    });
  }

  Future<void> _deleteArtist(
    Emitter<ArtistState> emit, {
    required String id,
  }) async {
    emit(const ArtistState.loading());

    final result = await _repository.deleteArtist(id);

    result.fold(
      (failure) => emit(ArtistState.error(failure.message)),
      (_) => add(const ArtistEvent.loadArtists()),
    );
  }
}
