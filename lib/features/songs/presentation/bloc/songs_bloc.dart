import 'dart:io';

import 'package:artist_ums/features/songs/domain/repository/songs_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import 'songs_event.dart';
import 'songs_state.dart';

@injectable
class SongBloc extends Bloc<SongEvent, SongState> {
  final SongRepository _repository;

  SongBloc(this._repository) : super(const SongState.initial()) {
    on<SongEvent>((event, emit) async {
      await event.when(
        createSong: (artistId, title, album, coverUrl) => _createSong(
          emit,
          album: album,
          title: title,
          artistId: artistId,
          coverUrl: coverUrl,
        ),
        filterSongByArtist: (id) => _filterSongs(emit, id: id),
        deleteSong: (id) => _deleteSong(emit, id: id),
        loadSongs: () => _loadSongs(emit),
        updateSong: (id, artistId, title, album, coverUrl) => _updateSong(
          emit,
          id: id,
          artistId: artistId,
          title: title,
          album: album,
          coverUrl: coverUrl,
        ),
      );
    });
  }

  Future<void> _loadSongs(Emitter<SongState> emit) async {
    emit(const SongState.loading());
    final result = await _repository.getSongs();
    result.fold(
      (failure) => emit(SongState.error(failure.message)),
      (songs) => emit(SongState.loaded(songs)),
    );
  }

  Future<void> _filterSongs(
    Emitter<SongState> emit, {
    required String id,
  }) async {
    emit(const SongState.loading());
    final result = await _repository.getSongsByArtist(id);
    result.fold(
      (failure) => emit(SongState.error(failure.message)),
      (songs) => emit(SongState.loaded(songs)),
    );
  }

  Future<void> _createSong(
    Emitter<SongState> emit, {
    required String artistId,
    required String title,
    required String? album,
    required File? coverUrl,
  }) async {
    emit(const SongState.loading());
    String? coverUrl_;
    if (coverUrl != null) {
      final uploadResult = await _repository.uploadSongCover(file: coverUrl);
      uploadResult.fold(
        (failure) => emit(SongState.error(failure.message)),
        (url) => coverUrl_ = url,
      );
    }
    final result = await _repository.createSong(
      artistId: artistId,
      title: title,
      album: album,
      coverUrl: coverUrl_,
    );
    result.fold(
      (failure) => emit(SongState.error(failure.message)),
      (_) => add(const SongEvent.loadSongs()),
    );
  }

  Future<void> _updateSong(
    Emitter<SongState> emit, {
    required String id,
    required String artistId,
    required String title,
    required String? album,
    required File? coverUrl,
  }) async {
    emit(const SongState.loading());
    String? coverUrl_;
    if (coverUrl != null) {
      final uploadResult = await _repository.uploadSongCover(file: coverUrl);
      uploadResult.fold(
        (failure) => emit(SongState.error(failure.message)),
        (url) => coverUrl_ = url,
      );
    }
    final result = await _repository.updateSong(
      id: id,
      artistId: artistId,
      title: title,
      album: album,
      coverUrl: coverUrl_,
    );
    result.fold((failure) => emit(SongState.error(failure.message)), (_) {
      emit(const SongState.success('Update Success'));
      add(const SongEvent.loadSongs());
    });
  }

  Future<void> _deleteSong(
    Emitter<SongState> emit, {
    required String id,
  }) async {
    emit(const SongState.loading());
    final result = await _repository.deleteSong(id);
    result.fold(
      (failure) => emit(SongState.error(failure.message)),
      (_) => add(const SongEvent.loadSongs()),
    );
  }
}
