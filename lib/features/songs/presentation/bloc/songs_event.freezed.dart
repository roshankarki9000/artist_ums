// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'songs_event.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$SongEvent {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SongEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'SongEvent()';
}


}

/// @nodoc
class $SongEventCopyWith<$Res>  {
$SongEventCopyWith(SongEvent _, $Res Function(SongEvent) __);
}


/// Adds pattern-matching-related methods to [SongEvent].
extension SongEventPatterns on SongEvent {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _LoadSongs value)?  loadSongs,TResult Function( _FilterSongByArtist value)?  filterSongByArtist,TResult Function( _CreateSong value)?  createSong,TResult Function( _UpdateSong value)?  updateSong,TResult Function( _DeleteSong value)?  deleteSong,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _LoadSongs() when loadSongs != null:
return loadSongs(_that);case _FilterSongByArtist() when filterSongByArtist != null:
return filterSongByArtist(_that);case _CreateSong() when createSong != null:
return createSong(_that);case _UpdateSong() when updateSong != null:
return updateSong(_that);case _DeleteSong() when deleteSong != null:
return deleteSong(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _LoadSongs value)  loadSongs,required TResult Function( _FilterSongByArtist value)  filterSongByArtist,required TResult Function( _CreateSong value)  createSong,required TResult Function( _UpdateSong value)  updateSong,required TResult Function( _DeleteSong value)  deleteSong,}){
final _that = this;
switch (_that) {
case _LoadSongs():
return loadSongs(_that);case _FilterSongByArtist():
return filterSongByArtist(_that);case _CreateSong():
return createSong(_that);case _UpdateSong():
return updateSong(_that);case _DeleteSong():
return deleteSong(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _LoadSongs value)?  loadSongs,TResult? Function( _FilterSongByArtist value)?  filterSongByArtist,TResult? Function( _CreateSong value)?  createSong,TResult? Function( _UpdateSong value)?  updateSong,TResult? Function( _DeleteSong value)?  deleteSong,}){
final _that = this;
switch (_that) {
case _LoadSongs() when loadSongs != null:
return loadSongs(_that);case _FilterSongByArtist() when filterSongByArtist != null:
return filterSongByArtist(_that);case _CreateSong() when createSong != null:
return createSong(_that);case _UpdateSong() when updateSong != null:
return updateSong(_that);case _DeleteSong() when deleteSong != null:
return deleteSong(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  loadSongs,TResult Function( String id)?  filterSongByArtist,TResult Function( String artistId,  String title,  String? album,  File? coverUrl)?  createSong,TResult Function( String id,  String artistId,  String title,  String? album,  File? coverUrl)?  updateSong,TResult Function( String id)?  deleteSong,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _LoadSongs() when loadSongs != null:
return loadSongs();case _FilterSongByArtist() when filterSongByArtist != null:
return filterSongByArtist(_that.id);case _CreateSong() when createSong != null:
return createSong(_that.artistId,_that.title,_that.album,_that.coverUrl);case _UpdateSong() when updateSong != null:
return updateSong(_that.id,_that.artistId,_that.title,_that.album,_that.coverUrl);case _DeleteSong() when deleteSong != null:
return deleteSong(_that.id);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  loadSongs,required TResult Function( String id)  filterSongByArtist,required TResult Function( String artistId,  String title,  String? album,  File? coverUrl)  createSong,required TResult Function( String id,  String artistId,  String title,  String? album,  File? coverUrl)  updateSong,required TResult Function( String id)  deleteSong,}) {final _that = this;
switch (_that) {
case _LoadSongs():
return loadSongs();case _FilterSongByArtist():
return filterSongByArtist(_that.id);case _CreateSong():
return createSong(_that.artistId,_that.title,_that.album,_that.coverUrl);case _UpdateSong():
return updateSong(_that.id,_that.artistId,_that.title,_that.album,_that.coverUrl);case _DeleteSong():
return deleteSong(_that.id);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  loadSongs,TResult? Function( String id)?  filterSongByArtist,TResult? Function( String artistId,  String title,  String? album,  File? coverUrl)?  createSong,TResult? Function( String id,  String artistId,  String title,  String? album,  File? coverUrl)?  updateSong,TResult? Function( String id)?  deleteSong,}) {final _that = this;
switch (_that) {
case _LoadSongs() when loadSongs != null:
return loadSongs();case _FilterSongByArtist() when filterSongByArtist != null:
return filterSongByArtist(_that.id);case _CreateSong() when createSong != null:
return createSong(_that.artistId,_that.title,_that.album,_that.coverUrl);case _UpdateSong() when updateSong != null:
return updateSong(_that.id,_that.artistId,_that.title,_that.album,_that.coverUrl);case _DeleteSong() when deleteSong != null:
return deleteSong(_that.id);case _:
  return null;

}
}

}

/// @nodoc


class _LoadSongs implements SongEvent {
  const _LoadSongs();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _LoadSongs);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'SongEvent.loadSongs()';
}


}




/// @nodoc


class _FilterSongByArtist implements SongEvent {
  const _FilterSongByArtist({required this.id});
  

 final  String id;

/// Create a copy of SongEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$FilterSongByArtistCopyWith<_FilterSongByArtist> get copyWith => __$FilterSongByArtistCopyWithImpl<_FilterSongByArtist>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _FilterSongByArtist&&(identical(other.id, id) || other.id == id));
}


@override
int get hashCode => Object.hash(runtimeType,id);

@override
String toString() {
  return 'SongEvent.filterSongByArtist(id: $id)';
}


}

/// @nodoc
abstract mixin class _$FilterSongByArtistCopyWith<$Res> implements $SongEventCopyWith<$Res> {
  factory _$FilterSongByArtistCopyWith(_FilterSongByArtist value, $Res Function(_FilterSongByArtist) _then) = __$FilterSongByArtistCopyWithImpl;
@useResult
$Res call({
 String id
});




}
/// @nodoc
class __$FilterSongByArtistCopyWithImpl<$Res>
    implements _$FilterSongByArtistCopyWith<$Res> {
  __$FilterSongByArtistCopyWithImpl(this._self, this._then);

  final _FilterSongByArtist _self;
  final $Res Function(_FilterSongByArtist) _then;

/// Create a copy of SongEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? id = null,}) {
  return _then(_FilterSongByArtist(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class _CreateSong implements SongEvent {
  const _CreateSong({required this.artistId, required this.title, this.album, this.coverUrl});
  

 final  String artistId;
 final  String title;
 final  String? album;
 final  File? coverUrl;

/// Create a copy of SongEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CreateSongCopyWith<_CreateSong> get copyWith => __$CreateSongCopyWithImpl<_CreateSong>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CreateSong&&(identical(other.artistId, artistId) || other.artistId == artistId)&&(identical(other.title, title) || other.title == title)&&(identical(other.album, album) || other.album == album)&&(identical(other.coverUrl, coverUrl) || other.coverUrl == coverUrl));
}


@override
int get hashCode => Object.hash(runtimeType,artistId,title,album,coverUrl);

@override
String toString() {
  return 'SongEvent.createSong(artistId: $artistId, title: $title, album: $album, coverUrl: $coverUrl)';
}


}

/// @nodoc
abstract mixin class _$CreateSongCopyWith<$Res> implements $SongEventCopyWith<$Res> {
  factory _$CreateSongCopyWith(_CreateSong value, $Res Function(_CreateSong) _then) = __$CreateSongCopyWithImpl;
@useResult
$Res call({
 String artistId, String title, String? album, File? coverUrl
});




}
/// @nodoc
class __$CreateSongCopyWithImpl<$Res>
    implements _$CreateSongCopyWith<$Res> {
  __$CreateSongCopyWithImpl(this._self, this._then);

  final _CreateSong _self;
  final $Res Function(_CreateSong) _then;

/// Create a copy of SongEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? artistId = null,Object? title = null,Object? album = freezed,Object? coverUrl = freezed,}) {
  return _then(_CreateSong(
artistId: null == artistId ? _self.artistId : artistId // ignore: cast_nullable_to_non_nullable
as String,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,album: freezed == album ? _self.album : album // ignore: cast_nullable_to_non_nullable
as String?,coverUrl: freezed == coverUrl ? _self.coverUrl : coverUrl // ignore: cast_nullable_to_non_nullable
as File?,
  ));
}


}

/// @nodoc


class _UpdateSong implements SongEvent {
  const _UpdateSong({required this.id, required this.artistId, required this.title, this.album, this.coverUrl});
  

 final  String id;
 final  String artistId;
 final  String title;
 final  String? album;
 final  File? coverUrl;

/// Create a copy of SongEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$UpdateSongCopyWith<_UpdateSong> get copyWith => __$UpdateSongCopyWithImpl<_UpdateSong>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _UpdateSong&&(identical(other.id, id) || other.id == id)&&(identical(other.artistId, artistId) || other.artistId == artistId)&&(identical(other.title, title) || other.title == title)&&(identical(other.album, album) || other.album == album)&&(identical(other.coverUrl, coverUrl) || other.coverUrl == coverUrl));
}


@override
int get hashCode => Object.hash(runtimeType,id,artistId,title,album,coverUrl);

@override
String toString() {
  return 'SongEvent.updateSong(id: $id, artistId: $artistId, title: $title, album: $album, coverUrl: $coverUrl)';
}


}

/// @nodoc
abstract mixin class _$UpdateSongCopyWith<$Res> implements $SongEventCopyWith<$Res> {
  factory _$UpdateSongCopyWith(_UpdateSong value, $Res Function(_UpdateSong) _then) = __$UpdateSongCopyWithImpl;
@useResult
$Res call({
 String id, String artistId, String title, String? album, File? coverUrl
});




}
/// @nodoc
class __$UpdateSongCopyWithImpl<$Res>
    implements _$UpdateSongCopyWith<$Res> {
  __$UpdateSongCopyWithImpl(this._self, this._then);

  final _UpdateSong _self;
  final $Res Function(_UpdateSong) _then;

/// Create a copy of SongEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? id = null,Object? artistId = null,Object? title = null,Object? album = freezed,Object? coverUrl = freezed,}) {
  return _then(_UpdateSong(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,artistId: null == artistId ? _self.artistId : artistId // ignore: cast_nullable_to_non_nullable
as String,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,album: freezed == album ? _self.album : album // ignore: cast_nullable_to_non_nullable
as String?,coverUrl: freezed == coverUrl ? _self.coverUrl : coverUrl // ignore: cast_nullable_to_non_nullable
as File?,
  ));
}


}

/// @nodoc


class _DeleteSong implements SongEvent {
  const _DeleteSong({required this.id});
  

 final  String id;

/// Create a copy of SongEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$DeleteSongCopyWith<_DeleteSong> get copyWith => __$DeleteSongCopyWithImpl<_DeleteSong>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _DeleteSong&&(identical(other.id, id) || other.id == id));
}


@override
int get hashCode => Object.hash(runtimeType,id);

@override
String toString() {
  return 'SongEvent.deleteSong(id: $id)';
}


}

/// @nodoc
abstract mixin class _$DeleteSongCopyWith<$Res> implements $SongEventCopyWith<$Res> {
  factory _$DeleteSongCopyWith(_DeleteSong value, $Res Function(_DeleteSong) _then) = __$DeleteSongCopyWithImpl;
@useResult
$Res call({
 String id
});




}
/// @nodoc
class __$DeleteSongCopyWithImpl<$Res>
    implements _$DeleteSongCopyWith<$Res> {
  __$DeleteSongCopyWithImpl(this._self, this._then);

  final _DeleteSong _self;
  final $Res Function(_DeleteSong) _then;

/// Create a copy of SongEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? id = null,}) {
  return _then(_DeleteSong(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
