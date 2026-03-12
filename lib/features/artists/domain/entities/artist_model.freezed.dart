// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'artist_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ArtistModel {

 String get id; String get name; String? get bio; String? get createdBy; DateTime? get createdAt;@JsonKey(name: "cover_url") String? get coverUrl;
/// Create a copy of ArtistModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ArtistModelCopyWith<ArtistModel> get copyWith => _$ArtistModelCopyWithImpl<ArtistModel>(this as ArtistModel, _$identity);

  /// Serializes this ArtistModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ArtistModel&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.bio, bio) || other.bio == bio)&&(identical(other.createdBy, createdBy) || other.createdBy == createdBy)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.coverUrl, coverUrl) || other.coverUrl == coverUrl));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,bio,createdBy,createdAt,coverUrl);

@override
String toString() {
  return 'ArtistModel(id: $id, name: $name, bio: $bio, createdBy: $createdBy, createdAt: $createdAt, coverUrl: $coverUrl)';
}


}

/// @nodoc
abstract mixin class $ArtistModelCopyWith<$Res>  {
  factory $ArtistModelCopyWith(ArtistModel value, $Res Function(ArtistModel) _then) = _$ArtistModelCopyWithImpl;
@useResult
$Res call({
 String id, String name, String? bio, String? createdBy, DateTime? createdAt,@JsonKey(name: "cover_url") String? coverUrl
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
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? name = null,Object? bio = freezed,Object? createdBy = freezed,Object? createdAt = freezed,Object? coverUrl = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,bio: freezed == bio ? _self.bio : bio // ignore: cast_nullable_to_non_nullable
as String?,createdBy: freezed == createdBy ? _self.createdBy : createdBy // ignore: cast_nullable_to_non_nullable
as String?,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime?,coverUrl: freezed == coverUrl ? _self.coverUrl : coverUrl // ignore: cast_nullable_to_non_nullable
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String name,  String? bio,  String? createdBy,  DateTime? createdAt, @JsonKey(name: "cover_url")  String? coverUrl)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ArtistModel() when $default != null:
return $default(_that.id,_that.name,_that.bio,_that.createdBy,_that.createdAt,_that.coverUrl);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String name,  String? bio,  String? createdBy,  DateTime? createdAt, @JsonKey(name: "cover_url")  String? coverUrl)  $default,) {final _that = this;
switch (_that) {
case _ArtistModel():
return $default(_that.id,_that.name,_that.bio,_that.createdBy,_that.createdAt,_that.coverUrl);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String name,  String? bio,  String? createdBy,  DateTime? createdAt, @JsonKey(name: "cover_url")  String? coverUrl)?  $default,) {final _that = this;
switch (_that) {
case _ArtistModel() when $default != null:
return $default(_that.id,_that.name,_that.bio,_that.createdBy,_that.createdAt,_that.coverUrl);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ArtistModel implements ArtistModel {
  const _ArtistModel({required this.id, required this.name, this.bio, this.createdBy, this.createdAt, @JsonKey(name: "cover_url") this.coverUrl});
  factory _ArtistModel.fromJson(Map<String, dynamic> json) => _$ArtistModelFromJson(json);

@override final  String id;
@override final  String name;
@override final  String? bio;
@override final  String? createdBy;
@override final  DateTime? createdAt;
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
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ArtistModel&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.bio, bio) || other.bio == bio)&&(identical(other.createdBy, createdBy) || other.createdBy == createdBy)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.coverUrl, coverUrl) || other.coverUrl == coverUrl));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,bio,createdBy,createdAt,coverUrl);

@override
String toString() {
  return 'ArtistModel(id: $id, name: $name, bio: $bio, createdBy: $createdBy, createdAt: $createdAt, coverUrl: $coverUrl)';
}


}

/// @nodoc
abstract mixin class _$ArtistModelCopyWith<$Res> implements $ArtistModelCopyWith<$Res> {
  factory _$ArtistModelCopyWith(_ArtistModel value, $Res Function(_ArtistModel) _then) = __$ArtistModelCopyWithImpl;
@override @useResult
$Res call({
 String id, String name, String? bio, String? createdBy, DateTime? createdAt,@JsonKey(name: "cover_url") String? coverUrl
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
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? name = null,Object? bio = freezed,Object? createdBy = freezed,Object? createdAt = freezed,Object? coverUrl = freezed,}) {
  return _then(_ArtistModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,bio: freezed == bio ? _self.bio : bio // ignore: cast_nullable_to_non_nullable
as String?,createdBy: freezed == createdBy ? _self.createdBy : createdBy // ignore: cast_nullable_to_non_nullable
as String?,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime?,coverUrl: freezed == coverUrl ? _self.coverUrl : coverUrl // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
