// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user_event.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$UserEvent {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is UserEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'UserEvent()';
}


}

/// @nodoc
class $UserEventCopyWith<$Res>  {
$UserEventCopyWith(UserEvent _, $Res Function(UserEvent) __);
}


/// Adds pattern-matching-related methods to [UserEvent].
extension UserEventPatterns on UserEvent {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( GetUsers value)?  getUsers,TResult Function( GetCurrentUser value)?  getCurrentUser,TResult Function( CreateUser value)?  createUser,TResult Function( UpdateUser value)?  updateUser,TResult Function( DeleteUser value)?  deleteUser,required TResult orElse(),}){
final _that = this;
switch (_that) {
case GetUsers() when getUsers != null:
return getUsers(_that);case GetCurrentUser() when getCurrentUser != null:
return getCurrentUser(_that);case CreateUser() when createUser != null:
return createUser(_that);case UpdateUser() when updateUser != null:
return updateUser(_that);case DeleteUser() when deleteUser != null:
return deleteUser(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( GetUsers value)  getUsers,required TResult Function( GetCurrentUser value)  getCurrentUser,required TResult Function( CreateUser value)  createUser,required TResult Function( UpdateUser value)  updateUser,required TResult Function( DeleteUser value)  deleteUser,}){
final _that = this;
switch (_that) {
case GetUsers():
return getUsers(_that);case GetCurrentUser():
return getCurrentUser(_that);case CreateUser():
return createUser(_that);case UpdateUser():
return updateUser(_that);case DeleteUser():
return deleteUser(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( GetUsers value)?  getUsers,TResult? Function( GetCurrentUser value)?  getCurrentUser,TResult? Function( CreateUser value)?  createUser,TResult? Function( UpdateUser value)?  updateUser,TResult? Function( DeleteUser value)?  deleteUser,}){
final _that = this;
switch (_that) {
case GetUsers() when getUsers != null:
return getUsers(_that);case GetCurrentUser() when getCurrentUser != null:
return getCurrentUser(_that);case CreateUser() when createUser != null:
return createUser(_that);case UpdateUser() when updateUser != null:
return updateUser(_that);case DeleteUser() when deleteUser != null:
return deleteUser(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  getUsers,TResult Function()?  getCurrentUser,TResult Function( String name,  String email)?  createUser,TResult Function( String id,  String name)?  updateUser,TResult Function( String id)?  deleteUser,required TResult orElse(),}) {final _that = this;
switch (_that) {
case GetUsers() when getUsers != null:
return getUsers();case GetCurrentUser() when getCurrentUser != null:
return getCurrentUser();case CreateUser() when createUser != null:
return createUser(_that.name,_that.email);case UpdateUser() when updateUser != null:
return updateUser(_that.id,_that.name);case DeleteUser() when deleteUser != null:
return deleteUser(_that.id);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  getUsers,required TResult Function()  getCurrentUser,required TResult Function( String name,  String email)  createUser,required TResult Function( String id,  String name)  updateUser,required TResult Function( String id)  deleteUser,}) {final _that = this;
switch (_that) {
case GetUsers():
return getUsers();case GetCurrentUser():
return getCurrentUser();case CreateUser():
return createUser(_that.name,_that.email);case UpdateUser():
return updateUser(_that.id,_that.name);case DeleteUser():
return deleteUser(_that.id);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  getUsers,TResult? Function()?  getCurrentUser,TResult? Function( String name,  String email)?  createUser,TResult? Function( String id,  String name)?  updateUser,TResult? Function( String id)?  deleteUser,}) {final _that = this;
switch (_that) {
case GetUsers() when getUsers != null:
return getUsers();case GetCurrentUser() when getCurrentUser != null:
return getCurrentUser();case CreateUser() when createUser != null:
return createUser(_that.name,_that.email);case UpdateUser() when updateUser != null:
return updateUser(_that.id,_that.name);case DeleteUser() when deleteUser != null:
return deleteUser(_that.id);case _:
  return null;

}
}

}

/// @nodoc


class GetUsers implements UserEvent {
  const GetUsers();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is GetUsers);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'UserEvent.getUsers()';
}


}




/// @nodoc


class GetCurrentUser implements UserEvent {
  const GetCurrentUser();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is GetCurrentUser);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'UserEvent.getCurrentUser()';
}


}




/// @nodoc


class CreateUser implements UserEvent {
  const CreateUser({required this.name, required this.email});
  

 final  String name;
 final  String email;

/// Create a copy of UserEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CreateUserCopyWith<CreateUser> get copyWith => _$CreateUserCopyWithImpl<CreateUser>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CreateUser&&(identical(other.name, name) || other.name == name)&&(identical(other.email, email) || other.email == email));
}


@override
int get hashCode => Object.hash(runtimeType,name,email);

@override
String toString() {
  return 'UserEvent.createUser(name: $name, email: $email)';
}


}

/// @nodoc
abstract mixin class $CreateUserCopyWith<$Res> implements $UserEventCopyWith<$Res> {
  factory $CreateUserCopyWith(CreateUser value, $Res Function(CreateUser) _then) = _$CreateUserCopyWithImpl;
@useResult
$Res call({
 String name, String email
});




}
/// @nodoc
class _$CreateUserCopyWithImpl<$Res>
    implements $CreateUserCopyWith<$Res> {
  _$CreateUserCopyWithImpl(this._self, this._then);

  final CreateUser _self;
  final $Res Function(CreateUser) _then;

/// Create a copy of UserEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? name = null,Object? email = null,}) {
  return _then(CreateUser(
name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,email: null == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class UpdateUser implements UserEvent {
  const UpdateUser({required this.id, required this.name});
  

 final  String id;
 final  String name;

/// Create a copy of UserEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$UpdateUserCopyWith<UpdateUser> get copyWith => _$UpdateUserCopyWithImpl<UpdateUser>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is UpdateUser&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name));
}


@override
int get hashCode => Object.hash(runtimeType,id,name);

@override
String toString() {
  return 'UserEvent.updateUser(id: $id, name: $name)';
}


}

/// @nodoc
abstract mixin class $UpdateUserCopyWith<$Res> implements $UserEventCopyWith<$Res> {
  factory $UpdateUserCopyWith(UpdateUser value, $Res Function(UpdateUser) _then) = _$UpdateUserCopyWithImpl;
@useResult
$Res call({
 String id, String name
});




}
/// @nodoc
class _$UpdateUserCopyWithImpl<$Res>
    implements $UpdateUserCopyWith<$Res> {
  _$UpdateUserCopyWithImpl(this._self, this._then);

  final UpdateUser _self;
  final $Res Function(UpdateUser) _then;

/// Create a copy of UserEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? id = null,Object? name = null,}) {
  return _then(UpdateUser(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class DeleteUser implements UserEvent {
  const DeleteUser({required this.id});
  

 final  String id;

/// Create a copy of UserEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$DeleteUserCopyWith<DeleteUser> get copyWith => _$DeleteUserCopyWithImpl<DeleteUser>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DeleteUser&&(identical(other.id, id) || other.id == id));
}


@override
int get hashCode => Object.hash(runtimeType,id);

@override
String toString() {
  return 'UserEvent.deleteUser(id: $id)';
}


}

/// @nodoc
abstract mixin class $DeleteUserCopyWith<$Res> implements $UserEventCopyWith<$Res> {
  factory $DeleteUserCopyWith(DeleteUser value, $Res Function(DeleteUser) _then) = _$DeleteUserCopyWithImpl;
@useResult
$Res call({
 String id
});




}
/// @nodoc
class _$DeleteUserCopyWithImpl<$Res>
    implements $DeleteUserCopyWith<$Res> {
  _$DeleteUserCopyWithImpl(this._self, this._then);

  final DeleteUser _self;
  final $Res Function(DeleteUser) _then;

/// Create a copy of UserEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? id = null,}) {
  return _then(DeleteUser(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
