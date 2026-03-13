// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'profile_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ProfileModel {

 String get id; String get name; String get email; String get role;@JsonKey(name: 'cover_url') String? get coverUrl;@JsonKey(name: 'creator_user_id') String get creatorUserId;@JsonKey(name: 'created_at') DateTime get createdAt;@JsonKey(name: 'is_active') bool get isActive;@JsonKey(name: 'password_reset_done') bool get passwordResetDone;@JsonKey(fromJson: _artistsFromJson) List<ArtistModel> get artists;@JsonKey(fromJson: _songsFromJson) List<SongModel> get songs;@JsonKey(name: 'artists_created') int get artistsCreated;@JsonKey(name: 'songs_created') int get songsCreated;
/// Create a copy of ProfileModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ProfileModelCopyWith<ProfileModel> get copyWith => _$ProfileModelCopyWithImpl<ProfileModel>(this as ProfileModel, _$identity);

  /// Serializes this ProfileModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ProfileModel&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.email, email) || other.email == email)&&(identical(other.role, role) || other.role == role)&&(identical(other.coverUrl, coverUrl) || other.coverUrl == coverUrl)&&(identical(other.creatorUserId, creatorUserId) || other.creatorUserId == creatorUserId)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.isActive, isActive) || other.isActive == isActive)&&(identical(other.passwordResetDone, passwordResetDone) || other.passwordResetDone == passwordResetDone)&&const DeepCollectionEquality().equals(other.artists, artists)&&const DeepCollectionEquality().equals(other.songs, songs)&&(identical(other.artistsCreated, artistsCreated) || other.artistsCreated == artistsCreated)&&(identical(other.songsCreated, songsCreated) || other.songsCreated == songsCreated));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,email,role,coverUrl,creatorUserId,createdAt,isActive,passwordResetDone,const DeepCollectionEquality().hash(artists),const DeepCollectionEquality().hash(songs),artistsCreated,songsCreated);

@override
String toString() {
  return 'ProfileModel(id: $id, name: $name, email: $email, role: $role, coverUrl: $coverUrl, creatorUserId: $creatorUserId, createdAt: $createdAt, isActive: $isActive, passwordResetDone: $passwordResetDone, artists: $artists, songs: $songs, artistsCreated: $artistsCreated, songsCreated: $songsCreated)';
}


}

/// @nodoc
abstract mixin class $ProfileModelCopyWith<$Res>  {
  factory $ProfileModelCopyWith(ProfileModel value, $Res Function(ProfileModel) _then) = _$ProfileModelCopyWithImpl;
@useResult
$Res call({
 String id, String name, String email, String role,@JsonKey(name: 'cover_url') String? coverUrl,@JsonKey(name: 'creator_user_id') String creatorUserId,@JsonKey(name: 'created_at') DateTime createdAt,@JsonKey(name: 'is_active') bool isActive,@JsonKey(name: 'password_reset_done') bool passwordResetDone,@JsonKey(fromJson: _artistsFromJson) List<ArtistModel> artists,@JsonKey(fromJson: _songsFromJson) List<SongModel> songs,@JsonKey(name: 'artists_created') int artistsCreated,@JsonKey(name: 'songs_created') int songsCreated
});




}
/// @nodoc
class _$ProfileModelCopyWithImpl<$Res>
    implements $ProfileModelCopyWith<$Res> {
  _$ProfileModelCopyWithImpl(this._self, this._then);

  final ProfileModel _self;
  final $Res Function(ProfileModel) _then;

/// Create a copy of ProfileModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? name = null,Object? email = null,Object? role = null,Object? coverUrl = freezed,Object? creatorUserId = null,Object? createdAt = null,Object? isActive = null,Object? passwordResetDone = null,Object? artists = null,Object? songs = null,Object? artistsCreated = null,Object? songsCreated = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,email: null == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String,role: null == role ? _self.role : role // ignore: cast_nullable_to_non_nullable
as String,coverUrl: freezed == coverUrl ? _self.coverUrl : coverUrl // ignore: cast_nullable_to_non_nullable
as String?,creatorUserId: null == creatorUserId ? _self.creatorUserId : creatorUserId // ignore: cast_nullable_to_non_nullable
as String,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,isActive: null == isActive ? _self.isActive : isActive // ignore: cast_nullable_to_non_nullable
as bool,passwordResetDone: null == passwordResetDone ? _self.passwordResetDone : passwordResetDone // ignore: cast_nullable_to_non_nullable
as bool,artists: null == artists ? _self.artists : artists // ignore: cast_nullable_to_non_nullable
as List<ArtistModel>,songs: null == songs ? _self.songs : songs // ignore: cast_nullable_to_non_nullable
as List<SongModel>,artistsCreated: null == artistsCreated ? _self.artistsCreated : artistsCreated // ignore: cast_nullable_to_non_nullable
as int,songsCreated: null == songsCreated ? _self.songsCreated : songsCreated // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [ProfileModel].
extension ProfileModelPatterns on ProfileModel {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ProfileModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ProfileModel() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ProfileModel value)  $default,){
final _that = this;
switch (_that) {
case _ProfileModel():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ProfileModel value)?  $default,){
final _that = this;
switch (_that) {
case _ProfileModel() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String name,  String email,  String role, @JsonKey(name: 'cover_url')  String? coverUrl, @JsonKey(name: 'creator_user_id')  String creatorUserId, @JsonKey(name: 'created_at')  DateTime createdAt, @JsonKey(name: 'is_active')  bool isActive, @JsonKey(name: 'password_reset_done')  bool passwordResetDone, @JsonKey(fromJson: _artistsFromJson)  List<ArtistModel> artists, @JsonKey(fromJson: _songsFromJson)  List<SongModel> songs, @JsonKey(name: 'artists_created')  int artistsCreated, @JsonKey(name: 'songs_created')  int songsCreated)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ProfileModel() when $default != null:
return $default(_that.id,_that.name,_that.email,_that.role,_that.coverUrl,_that.creatorUserId,_that.createdAt,_that.isActive,_that.passwordResetDone,_that.artists,_that.songs,_that.artistsCreated,_that.songsCreated);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String name,  String email,  String role, @JsonKey(name: 'cover_url')  String? coverUrl, @JsonKey(name: 'creator_user_id')  String creatorUserId, @JsonKey(name: 'created_at')  DateTime createdAt, @JsonKey(name: 'is_active')  bool isActive, @JsonKey(name: 'password_reset_done')  bool passwordResetDone, @JsonKey(fromJson: _artistsFromJson)  List<ArtistModel> artists, @JsonKey(fromJson: _songsFromJson)  List<SongModel> songs, @JsonKey(name: 'artists_created')  int artistsCreated, @JsonKey(name: 'songs_created')  int songsCreated)  $default,) {final _that = this;
switch (_that) {
case _ProfileModel():
return $default(_that.id,_that.name,_that.email,_that.role,_that.coverUrl,_that.creatorUserId,_that.createdAt,_that.isActive,_that.passwordResetDone,_that.artists,_that.songs,_that.artistsCreated,_that.songsCreated);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String name,  String email,  String role, @JsonKey(name: 'cover_url')  String? coverUrl, @JsonKey(name: 'creator_user_id')  String creatorUserId, @JsonKey(name: 'created_at')  DateTime createdAt, @JsonKey(name: 'is_active')  bool isActive, @JsonKey(name: 'password_reset_done')  bool passwordResetDone, @JsonKey(fromJson: _artistsFromJson)  List<ArtistModel> artists, @JsonKey(fromJson: _songsFromJson)  List<SongModel> songs, @JsonKey(name: 'artists_created')  int artistsCreated, @JsonKey(name: 'songs_created')  int songsCreated)?  $default,) {final _that = this;
switch (_that) {
case _ProfileModel() when $default != null:
return $default(_that.id,_that.name,_that.email,_that.role,_that.coverUrl,_that.creatorUserId,_that.createdAt,_that.isActive,_that.passwordResetDone,_that.artists,_that.songs,_that.artistsCreated,_that.songsCreated);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ProfileModel implements ProfileModel {
  const _ProfileModel({required this.id, required this.name, required this.email, required this.role, @JsonKey(name: 'cover_url') this.coverUrl, @JsonKey(name: 'creator_user_id') required this.creatorUserId, @JsonKey(name: 'created_at') required this.createdAt, @JsonKey(name: 'is_active') required this.isActive, @JsonKey(name: 'password_reset_done') required this.passwordResetDone, @JsonKey(fromJson: _artistsFromJson) final  List<ArtistModel> artists = const [], @JsonKey(fromJson: _songsFromJson) final  List<SongModel> songs = const [], @JsonKey(name: 'artists_created') required this.artistsCreated, @JsonKey(name: 'songs_created') required this.songsCreated}): _artists = artists,_songs = songs;
  factory _ProfileModel.fromJson(Map<String, dynamic> json) => _$ProfileModelFromJson(json);

@override final  String id;
@override final  String name;
@override final  String email;
@override final  String role;
@override@JsonKey(name: 'cover_url') final  String? coverUrl;
@override@JsonKey(name: 'creator_user_id') final  String creatorUserId;
@override@JsonKey(name: 'created_at') final  DateTime createdAt;
@override@JsonKey(name: 'is_active') final  bool isActive;
@override@JsonKey(name: 'password_reset_done') final  bool passwordResetDone;
 final  List<ArtistModel> _artists;
@override@JsonKey(fromJson: _artistsFromJson) List<ArtistModel> get artists {
  if (_artists is EqualUnmodifiableListView) return _artists;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_artists);
}

 final  List<SongModel> _songs;
@override@JsonKey(fromJson: _songsFromJson) List<SongModel> get songs {
  if (_songs is EqualUnmodifiableListView) return _songs;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_songs);
}

@override@JsonKey(name: 'artists_created') final  int artistsCreated;
@override@JsonKey(name: 'songs_created') final  int songsCreated;

/// Create a copy of ProfileModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ProfileModelCopyWith<_ProfileModel> get copyWith => __$ProfileModelCopyWithImpl<_ProfileModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ProfileModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ProfileModel&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.email, email) || other.email == email)&&(identical(other.role, role) || other.role == role)&&(identical(other.coverUrl, coverUrl) || other.coverUrl == coverUrl)&&(identical(other.creatorUserId, creatorUserId) || other.creatorUserId == creatorUserId)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.isActive, isActive) || other.isActive == isActive)&&(identical(other.passwordResetDone, passwordResetDone) || other.passwordResetDone == passwordResetDone)&&const DeepCollectionEquality().equals(other._artists, _artists)&&const DeepCollectionEquality().equals(other._songs, _songs)&&(identical(other.artistsCreated, artistsCreated) || other.artistsCreated == artistsCreated)&&(identical(other.songsCreated, songsCreated) || other.songsCreated == songsCreated));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,email,role,coverUrl,creatorUserId,createdAt,isActive,passwordResetDone,const DeepCollectionEquality().hash(_artists),const DeepCollectionEquality().hash(_songs),artistsCreated,songsCreated);

@override
String toString() {
  return 'ProfileModel(id: $id, name: $name, email: $email, role: $role, coverUrl: $coverUrl, creatorUserId: $creatorUserId, createdAt: $createdAt, isActive: $isActive, passwordResetDone: $passwordResetDone, artists: $artists, songs: $songs, artistsCreated: $artistsCreated, songsCreated: $songsCreated)';
}


}

/// @nodoc
abstract mixin class _$ProfileModelCopyWith<$Res> implements $ProfileModelCopyWith<$Res> {
  factory _$ProfileModelCopyWith(_ProfileModel value, $Res Function(_ProfileModel) _then) = __$ProfileModelCopyWithImpl;
@override @useResult
$Res call({
 String id, String name, String email, String role,@JsonKey(name: 'cover_url') String? coverUrl,@JsonKey(name: 'creator_user_id') String creatorUserId,@JsonKey(name: 'created_at') DateTime createdAt,@JsonKey(name: 'is_active') bool isActive,@JsonKey(name: 'password_reset_done') bool passwordResetDone,@JsonKey(fromJson: _artistsFromJson) List<ArtistModel> artists,@JsonKey(fromJson: _songsFromJson) List<SongModel> songs,@JsonKey(name: 'artists_created') int artistsCreated,@JsonKey(name: 'songs_created') int songsCreated
});




}
/// @nodoc
class __$ProfileModelCopyWithImpl<$Res>
    implements _$ProfileModelCopyWith<$Res> {
  __$ProfileModelCopyWithImpl(this._self, this._then);

  final _ProfileModel _self;
  final $Res Function(_ProfileModel) _then;

/// Create a copy of ProfileModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? name = null,Object? email = null,Object? role = null,Object? coverUrl = freezed,Object? creatorUserId = null,Object? createdAt = null,Object? isActive = null,Object? passwordResetDone = null,Object? artists = null,Object? songs = null,Object? artistsCreated = null,Object? songsCreated = null,}) {
  return _then(_ProfileModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,email: null == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String,role: null == role ? _self.role : role // ignore: cast_nullable_to_non_nullable
as String,coverUrl: freezed == coverUrl ? _self.coverUrl : coverUrl // ignore: cast_nullable_to_non_nullable
as String?,creatorUserId: null == creatorUserId ? _self.creatorUserId : creatorUserId // ignore: cast_nullable_to_non_nullable
as String,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,isActive: null == isActive ? _self.isActive : isActive // ignore: cast_nullable_to_non_nullable
as bool,passwordResetDone: null == passwordResetDone ? _self.passwordResetDone : passwordResetDone // ignore: cast_nullable_to_non_nullable
as bool,artists: null == artists ? _self._artists : artists // ignore: cast_nullable_to_non_nullable
as List<ArtistModel>,songs: null == songs ? _self._songs : songs // ignore: cast_nullable_to_non_nullable
as List<SongModel>,artistsCreated: null == artistsCreated ? _self.artistsCreated : artistsCreated // ignore: cast_nullable_to_non_nullable
as int,songsCreated: null == songsCreated ? _self.songsCreated : songsCreated // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}


/// @nodoc
mixin _$SongModel {

 String get id; String get title; String get album;@JsonKey(name: 'cover_url') String? get coverUrl;@JsonKey(name: 'artist_id') String get artistId;@JsonKey(name: 'artist_name') String get artistName;@JsonKey(name: 'artist_cover') String? get artistCover;@JsonKey(name: 'created_at') DateTime get createdAt;
/// Create a copy of SongModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SongModelCopyWith<SongModel> get copyWith => _$SongModelCopyWithImpl<SongModel>(this as SongModel, _$identity);

  /// Serializes this SongModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SongModel&&(identical(other.id, id) || other.id == id)&&(identical(other.title, title) || other.title == title)&&(identical(other.album, album) || other.album == album)&&(identical(other.coverUrl, coverUrl) || other.coverUrl == coverUrl)&&(identical(other.artistId, artistId) || other.artistId == artistId)&&(identical(other.artistName, artistName) || other.artistName == artistName)&&(identical(other.artistCover, artistCover) || other.artistCover == artistCover)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,title,album,coverUrl,artistId,artistName,artistCover,createdAt);

@override
String toString() {
  return 'SongModel(id: $id, title: $title, album: $album, coverUrl: $coverUrl, artistId: $artistId, artistName: $artistName, artistCover: $artistCover, createdAt: $createdAt)';
}


}

/// @nodoc
abstract mixin class $SongModelCopyWith<$Res>  {
  factory $SongModelCopyWith(SongModel value, $Res Function(SongModel) _then) = _$SongModelCopyWithImpl;
@useResult
$Res call({
 String id, String title, String album,@JsonKey(name: 'cover_url') String? coverUrl,@JsonKey(name: 'artist_id') String artistId,@JsonKey(name: 'artist_name') String artistName,@JsonKey(name: 'artist_cover') String? artistCover,@JsonKey(name: 'created_at') DateTime createdAt
});




}
/// @nodoc
class _$SongModelCopyWithImpl<$Res>
    implements $SongModelCopyWith<$Res> {
  _$SongModelCopyWithImpl(this._self, this._then);

  final SongModel _self;
  final $Res Function(SongModel) _then;

/// Create a copy of SongModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? title = null,Object? album = null,Object? coverUrl = freezed,Object? artistId = null,Object? artistName = null,Object? artistCover = freezed,Object? createdAt = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,album: null == album ? _self.album : album // ignore: cast_nullable_to_non_nullable
as String,coverUrl: freezed == coverUrl ? _self.coverUrl : coverUrl // ignore: cast_nullable_to_non_nullable
as String?,artistId: null == artistId ? _self.artistId : artistId // ignore: cast_nullable_to_non_nullable
as String,artistName: null == artistName ? _self.artistName : artistName // ignore: cast_nullable_to_non_nullable
as String,artistCover: freezed == artistCover ? _self.artistCover : artistCover // ignore: cast_nullable_to_non_nullable
as String?,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}

}


/// Adds pattern-matching-related methods to [SongModel].
extension SongModelPatterns on SongModel {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _SongModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _SongModel() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _SongModel value)  $default,){
final _that = this;
switch (_that) {
case _SongModel():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _SongModel value)?  $default,){
final _that = this;
switch (_that) {
case _SongModel() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String title,  String album, @JsonKey(name: 'cover_url')  String? coverUrl, @JsonKey(name: 'artist_id')  String artistId, @JsonKey(name: 'artist_name')  String artistName, @JsonKey(name: 'artist_cover')  String? artistCover, @JsonKey(name: 'created_at')  DateTime createdAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _SongModel() when $default != null:
return $default(_that.id,_that.title,_that.album,_that.coverUrl,_that.artistId,_that.artistName,_that.artistCover,_that.createdAt);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String title,  String album, @JsonKey(name: 'cover_url')  String? coverUrl, @JsonKey(name: 'artist_id')  String artistId, @JsonKey(name: 'artist_name')  String artistName, @JsonKey(name: 'artist_cover')  String? artistCover, @JsonKey(name: 'created_at')  DateTime createdAt)  $default,) {final _that = this;
switch (_that) {
case _SongModel():
return $default(_that.id,_that.title,_that.album,_that.coverUrl,_that.artistId,_that.artistName,_that.artistCover,_that.createdAt);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String title,  String album, @JsonKey(name: 'cover_url')  String? coverUrl, @JsonKey(name: 'artist_id')  String artistId, @JsonKey(name: 'artist_name')  String artistName, @JsonKey(name: 'artist_cover')  String? artistCover, @JsonKey(name: 'created_at')  DateTime createdAt)?  $default,) {final _that = this;
switch (_that) {
case _SongModel() when $default != null:
return $default(_that.id,_that.title,_that.album,_that.coverUrl,_that.artistId,_that.artistName,_that.artistCover,_that.createdAt);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _SongModel implements SongModel {
  const _SongModel({required this.id, required this.title, required this.album, @JsonKey(name: 'cover_url') this.coverUrl, @JsonKey(name: 'artist_id') required this.artistId, @JsonKey(name: 'artist_name') required this.artistName, @JsonKey(name: 'artist_cover') this.artistCover, @JsonKey(name: 'created_at') required this.createdAt});
  factory _SongModel.fromJson(Map<String, dynamic> json) => _$SongModelFromJson(json);

@override final  String id;
@override final  String title;
@override final  String album;
@override@JsonKey(name: 'cover_url') final  String? coverUrl;
@override@JsonKey(name: 'artist_id') final  String artistId;
@override@JsonKey(name: 'artist_name') final  String artistName;
@override@JsonKey(name: 'artist_cover') final  String? artistCover;
@override@JsonKey(name: 'created_at') final  DateTime createdAt;

/// Create a copy of SongModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SongModelCopyWith<_SongModel> get copyWith => __$SongModelCopyWithImpl<_SongModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$SongModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SongModel&&(identical(other.id, id) || other.id == id)&&(identical(other.title, title) || other.title == title)&&(identical(other.album, album) || other.album == album)&&(identical(other.coverUrl, coverUrl) || other.coverUrl == coverUrl)&&(identical(other.artistId, artistId) || other.artistId == artistId)&&(identical(other.artistName, artistName) || other.artistName == artistName)&&(identical(other.artistCover, artistCover) || other.artistCover == artistCover)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,title,album,coverUrl,artistId,artistName,artistCover,createdAt);

@override
String toString() {
  return 'SongModel(id: $id, title: $title, album: $album, coverUrl: $coverUrl, artistId: $artistId, artistName: $artistName, artistCover: $artistCover, createdAt: $createdAt)';
}


}

/// @nodoc
abstract mixin class _$SongModelCopyWith<$Res> implements $SongModelCopyWith<$Res> {
  factory _$SongModelCopyWith(_SongModel value, $Res Function(_SongModel) _then) = __$SongModelCopyWithImpl;
@override @useResult
$Res call({
 String id, String title, String album,@JsonKey(name: 'cover_url') String? coverUrl,@JsonKey(name: 'artist_id') String artistId,@JsonKey(name: 'artist_name') String artistName,@JsonKey(name: 'artist_cover') String? artistCover,@JsonKey(name: 'created_at') DateTime createdAt
});




}
/// @nodoc
class __$SongModelCopyWithImpl<$Res>
    implements _$SongModelCopyWith<$Res> {
  __$SongModelCopyWithImpl(this._self, this._then);

  final _SongModel _self;
  final $Res Function(_SongModel) _then;

/// Create a copy of SongModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? title = null,Object? album = null,Object? coverUrl = freezed,Object? artistId = null,Object? artistName = null,Object? artistCover = freezed,Object? createdAt = null,}) {
  return _then(_SongModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,album: null == album ? _self.album : album // ignore: cast_nullable_to_non_nullable
as String,coverUrl: freezed == coverUrl ? _self.coverUrl : coverUrl // ignore: cast_nullable_to_non_nullable
as String?,artistId: null == artistId ? _self.artistId : artistId // ignore: cast_nullable_to_non_nullable
as String,artistName: null == artistName ? _self.artistName : artistName // ignore: cast_nullable_to_non_nullable
as String,artistCover: freezed == artistCover ? _self.artistCover : artistCover // ignore: cast_nullable_to_non_nullable
as String?,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}


}


/// @nodoc
mixin _$ArtistModel {

 String get id; String get name; String? get bio; String? get createdBy; DateTime? get createdAt;@JsonKey(name: 'songs_written') int get songsWritten;@JsonKey(name: "cover_url") String? get coverUrl;
/// Create a copy of ArtistModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ArtistModelCopyWith<ArtistModel> get copyWith => _$ArtistModelCopyWithImpl<ArtistModel>(this as ArtistModel, _$identity);

  /// Serializes this ArtistModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ArtistModel&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.bio, bio) || other.bio == bio)&&(identical(other.createdBy, createdBy) || other.createdBy == createdBy)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.songsWritten, songsWritten) || other.songsWritten == songsWritten)&&(identical(other.coverUrl, coverUrl) || other.coverUrl == coverUrl));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,bio,createdBy,createdAt,songsWritten,coverUrl);

@override
String toString() {
  return 'ArtistModel(id: $id, name: $name, bio: $bio, createdBy: $createdBy, createdAt: $createdAt, songsWritten: $songsWritten, coverUrl: $coverUrl)';
}


}

/// @nodoc
abstract mixin class $ArtistModelCopyWith<$Res>  {
  factory $ArtistModelCopyWith(ArtistModel value, $Res Function(ArtistModel) _then) = _$ArtistModelCopyWithImpl;
@useResult
$Res call({
 String id, String name, String? bio, String? createdBy, DateTime? createdAt,@JsonKey(name: 'songs_written') int songsWritten,@JsonKey(name: "cover_url") String? coverUrl
});




}
/// @nodoc
class _$ArtistModelCopyWithImpl<$Res>
    implements $ArtistModelCopyWith<$Res> {
  _$ArtistModelCopyWithImpl(this._self, this._then);

  final ArtistModel _self;
  final $Res Function(ArtistModel) _then;

/// Create a copy of ArtistModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? name = null,Object? bio = freezed,Object? createdBy = freezed,Object? createdAt = freezed,Object? songsWritten = null,Object? coverUrl = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,bio: freezed == bio ? _self.bio : bio // ignore: cast_nullable_to_non_nullable
as String?,createdBy: freezed == createdBy ? _self.createdBy : createdBy // ignore: cast_nullable_to_non_nullable
as String?,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime?,songsWritten: null == songsWritten ? _self.songsWritten : songsWritten // ignore: cast_nullable_to_non_nullable
as int,coverUrl: freezed == coverUrl ? _self.coverUrl : coverUrl // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [ArtistModel].
extension ArtistModelPatterns on ArtistModel {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ArtistModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ArtistModel() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ArtistModel value)  $default,){
final _that = this;
switch (_that) {
case _ArtistModel():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ArtistModel value)?  $default,){
final _that = this;
switch (_that) {
case _ArtistModel() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String name,  String? bio,  String? createdBy,  DateTime? createdAt, @JsonKey(name: 'songs_written')  int songsWritten, @JsonKey(name: "cover_url")  String? coverUrl)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ArtistModel() when $default != null:
return $default(_that.id,_that.name,_that.bio,_that.createdBy,_that.createdAt,_that.songsWritten,_that.coverUrl);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String name,  String? bio,  String? createdBy,  DateTime? createdAt, @JsonKey(name: 'songs_written')  int songsWritten, @JsonKey(name: "cover_url")  String? coverUrl)  $default,) {final _that = this;
switch (_that) {
case _ArtistModel():
return $default(_that.id,_that.name,_that.bio,_that.createdBy,_that.createdAt,_that.songsWritten,_that.coverUrl);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String name,  String? bio,  String? createdBy,  DateTime? createdAt, @JsonKey(name: 'songs_written')  int songsWritten, @JsonKey(name: "cover_url")  String? coverUrl)?  $default,) {final _that = this;
switch (_that) {
case _ArtistModel() when $default != null:
return $default(_that.id,_that.name,_that.bio,_that.createdBy,_that.createdAt,_that.songsWritten,_that.coverUrl);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ArtistModel implements ArtistModel {
  const _ArtistModel({required this.id, required this.name, this.bio, this.createdBy, this.createdAt, @JsonKey(name: 'songs_written') required this.songsWritten, @JsonKey(name: "cover_url") this.coverUrl});
  factory _ArtistModel.fromJson(Map<String, dynamic> json) => _$ArtistModelFromJson(json);

@override final  String id;
@override final  String name;
@override final  String? bio;
@override final  String? createdBy;
@override final  DateTime? createdAt;
@override@JsonKey(name: 'songs_written') final  int songsWritten;
@override@JsonKey(name: "cover_url") final  String? coverUrl;

/// Create a copy of ArtistModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ArtistModelCopyWith<_ArtistModel> get copyWith => __$ArtistModelCopyWithImpl<_ArtistModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ArtistModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ArtistModel&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.bio, bio) || other.bio == bio)&&(identical(other.createdBy, createdBy) || other.createdBy == createdBy)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.songsWritten, songsWritten) || other.songsWritten == songsWritten)&&(identical(other.coverUrl, coverUrl) || other.coverUrl == coverUrl));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,bio,createdBy,createdAt,songsWritten,coverUrl);

@override
String toString() {
  return 'ArtistModel(id: $id, name: $name, bio: $bio, createdBy: $createdBy, createdAt: $createdAt, songsWritten: $songsWritten, coverUrl: $coverUrl)';
}


}

/// @nodoc
abstract mixin class _$ArtistModelCopyWith<$Res> implements $ArtistModelCopyWith<$Res> {
  factory _$ArtistModelCopyWith(_ArtistModel value, $Res Function(_ArtistModel) _then) = __$ArtistModelCopyWithImpl;
@override @useResult
$Res call({
 String id, String name, String? bio, String? createdBy, DateTime? createdAt,@JsonKey(name: 'songs_written') int songsWritten,@JsonKey(name: "cover_url") String? coverUrl
});




}
/// @nodoc
class __$ArtistModelCopyWithImpl<$Res>
    implements _$ArtistModelCopyWith<$Res> {
  __$ArtistModelCopyWithImpl(this._self, this._then);

  final _ArtistModel _self;
  final $Res Function(_ArtistModel) _then;

/// Create a copy of ArtistModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? name = null,Object? bio = freezed,Object? createdBy = freezed,Object? createdAt = freezed,Object? songsWritten = null,Object? coverUrl = freezed,}) {
  return _then(_ArtistModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,bio: freezed == bio ? _self.bio : bio // ignore: cast_nullable_to_non_nullable
as String?,createdBy: freezed == createdBy ? _self.createdBy : createdBy // ignore: cast_nullable_to_non_nullable
as String?,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime?,songsWritten: null == songsWritten ? _self.songsWritten : songsWritten // ignore: cast_nullable_to_non_nullable
as int,coverUrl: freezed == coverUrl ? _self.coverUrl : coverUrl // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
