import 'package:freezed_annotation/freezed_annotation.dart';

part 'artist_model.freezed.dart';
part 'artist_model.g.dart';

@freezed
abstract class ArtistModel with _$ArtistModel {
  const factory ArtistModel({
    required String id,
    required String name,
    String? bio,
    String? createdBy,
    DateTime? createdAt,
  }) = _ArtistModel;

  factory ArtistModel.fromJson(Map<String, dynamic> json) =>
      _$ArtistModelFromJson(json);
}
