import 'dart:io';

import 'package:freezed_annotation/freezed_annotation.dart';

part 'artist_event.freezed.dart';

@freezed
class ArtistEvent with _$ArtistEvent {
  const factory ArtistEvent.loadArtists() = _LoadArtists;

  const factory ArtistEvent.createArtist({
    required String name,
    String? bio,
    File? coverUrl,
  }) = _CreateArtist;

  const factory ArtistEvent.updateArtist({
    required String id,
    required String name,
    String? bio,
    File? coverUrl,
  }) = _UpdateArtist;

  const factory ArtistEvent.deleteArtist({required String id}) = _DeleteArtist;
}
