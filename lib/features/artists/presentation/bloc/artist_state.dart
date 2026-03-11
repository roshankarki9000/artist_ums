import 'package:freezed_annotation/freezed_annotation.dart';
import '../../domain/entities/artist_model.dart';

part 'artist_state.freezed.dart';

@freezed
class ArtistState with _$ArtistState {
  const factory ArtistState.initial() = _Initial;

  const factory ArtistState.loading() = _Loading;

  const factory ArtistState.loaded(List<ArtistModel> artists) = _Loaded;

  const factory ArtistState.success(String message) = _Success;

  const factory ArtistState.error(String message) = _Error;
}
