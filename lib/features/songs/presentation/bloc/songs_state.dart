import 'package:freezed_annotation/freezed_annotation.dart';
import '../../domain/entities/song_model.dart';

part 'songs_state.freezed.dart';

@freezed
class SongState with _$SongState {
  const factory SongState.initial() = _Initial;

  const factory SongState.loading() = _Loading;

  const factory SongState.loaded(List<SongModel> songs) = _Loaded;

  const factory SongState.success(String message) = _Success;

  const factory SongState.error(String message) = _Error;
}
