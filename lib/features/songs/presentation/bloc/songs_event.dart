import 'package:freezed_annotation/freezed_annotation.dart';

part 'songs_event.freezed.dart';

@freezed
class SongEvent with _$SongEvent {
  const factory SongEvent.loadSongs() = _LoadSongs;

  const factory SongEvent.createSong({
    required String artistId,
    required String title,
    String? album,
    String? coverUrl,
  }) = _CreateSong;

  const factory SongEvent.updateSong({
    required String id,
    required String artistId,
    required String title,
    String? album,
    String? coverUrl,
  }) = _UpdateSong;

  const factory SongEvent.deleteSong({required String id}) = _DeleteSong;
}
