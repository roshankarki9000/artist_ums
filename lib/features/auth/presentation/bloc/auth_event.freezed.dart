// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'auth_event.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$AuthEvent {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AuthEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'AuthEvent()';
}


}

/// @nodoc
class $AuthEventCopyWith<$Res>  {
$AuthEventCopyWith(AuthEvent _, $Res Function(AuthEvent) __);
}


/// Adds pattern-matching-related methods to [AuthEvent].
extension AuthEventPatterns on AuthEvent {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _Started value)?  started,TResult Function( _CheckSession value)?  checkSession,TResult Function( _Login value)?  login,TResult Function( _Register value)?  register,TResult Function( _LoginWithGoogle value)?  loginWithGoogle,TResult Function( _Logout value)?  logout,TResult Function( _ResetPassword value)?  resetPassword,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Started() when started != null:
return started(_that);case _CheckSession() when checkSession != null:
return checkSession(_that);case _Login() when login != null:
return login(_that);case _Register() when register != null:
return register(_that);case _LoginWithGoogle() when loginWithGoogle != null:
return loginWithGoogle(_that);case _Logout() when logout != null:
return logout(_that);case _ResetPassword() when resetPassword != null:
return resetPassword(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _Started value)  started,required TResult Function( _CheckSession value)  checkSession,required TResult Function( _Login value)  login,required TResult Function( _Register value)  register,required TResult Function( _LoginWithGoogle value)  loginWithGoogle,required TResult Function( _Logout value)  logout,required TResult Function( _ResetPassword value)  resetPassword,}){
final _that = this;
switch (_that) {
case _Started():
return started(_that);case _CheckSession():
return checkSession(_that);case _Login():
return login(_that);case _Register():
return register(_that);case _LoginWithGoogle():
return loginWithGoogle(_that);case _Logout():
return logout(_that);case _ResetPassword():
return resetPassword(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _Started value)?  started,TResult? Function( _CheckSession value)?  checkSession,TResult? Function( _Login value)?  login,TResult? Function( _Register value)?  register,TResult? Function( _LoginWithGoogle value)?  loginWithGoogle,TResult? Function( _Logout value)?  logout,TResult? Function( _ResetPassword value)?  resetPassword,}){
final _that = this;
switch (_that) {
case _Started() when started != null:
return started(_that);case _CheckSession() when checkSession != null:
return checkSession(_that);case _Login() when login != null:
return login(_that);case _Register() when register != null:
return register(_that);case _LoginWithGoogle() when loginWithGoogle != null:
return loginWithGoogle(_that);case _Logout() when logout != null:
return logout(_that);case _ResetPassword() when resetPassword != null:
return resetPassword(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  started,TResult Function()?  checkSession,TResult Function( String email,  String password)?  login,TResult Function( String name,  String email,  String password)?  register,TResult Function()?  loginWithGoogle,TResult Function()?  logout,TResult Function( String password)?  resetPassword,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Started() when started != null:
return started();case _CheckSession() when checkSession != null:
return checkSession();case _Login() when login != null:
return login(_that.email,_that.password);case _Register() when register != null:
return register(_that.name,_that.email,_that.password);case _LoginWithGoogle() when loginWithGoogle != null:
return loginWithGoogle();case _Logout() when logout != null:
return logout();case _ResetPassword() when resetPassword != null:
return resetPassword(_that.password);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  started,required TResult Function()  checkSession,required TResult Function( String email,  String password)  login,required TResult Function( String name,  String email,  String password)  register,required TResult Function()  loginWithGoogle,required TResult Function()  logout,required TResult Function( String password)  resetPassword,}) {final _that = this;
switch (_that) {
case _Started():
return started();case _CheckSession():
return checkSession();case _Login():
return login(_that.email,_that.password);case _Register():
return register(_that.name,_that.email,_that.password);case _LoginWithGoogle():
return loginWithGoogle();case _Logout():
return logout();case _ResetPassword():
return resetPassword(_that.password);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  started,TResult? Function()?  checkSession,TResult? Function( String email,  String password)?  login,TResult? Function( String name,  String email,  String password)?  register,TResult? Function()?  loginWithGoogle,TResult? Function()?  logout,TResult? Function( String password)?  resetPassword,}) {final _that = this;
switch (_that) {
case _Started() when started != null:
return started();case _CheckSession() when checkSession != null:
return checkSession();case _Login() when login != null:
return login(_that.email,_that.password);case _Register() when register != null:
return register(_that.name,_that.email,_that.password);case _LoginWithGoogle() when loginWithGoogle != null:
return loginWithGoogle();case _Logout() when logout != null:
return logout();case _ResetPassword() when resetPassword != null:
return resetPassword(_that.password);case _:
  return null;

}
}

}

/// @nodoc


class _Started implements AuthEvent {
  const _Started();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Started);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'AuthEvent.started()';
}


}




/// @nodoc


class _CheckSession implements AuthEvent {
  const _CheckSession();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CheckSession);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'AuthEvent.checkSession()';
}


}




/// @nodoc


class _Login implements AuthEvent {
  const _Login({required this.email, required this.password});
  

 final  String email;
 final  String password;

/// Create a copy of AuthEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$LoginCopyWith<_Login> get copyWith => __$LoginCopyWithImpl<_Login>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Login&&(identical(other.email, email) || other.email == email)&&(identical(other.password, password) || other.password == password));
}


@override
int get hashCode => Object.hash(runtimeType,email,password);

@override
String toString() {
  return 'AuthEvent.login(email: $email, password: $password)';
}


}

/// @nodoc
abstract mixin class _$LoginCopyWith<$Res> implements $AuthEventCopyWith<$Res> {
  factory _$LoginCopyWith(_Login value, $Res Function(_Login) _then) = __$LoginCopyWithImpl;
@useResult
$Res call({
 String email, String password
});




}
/// @nodoc
class __$LoginCopyWithImpl<$Res>
    implements _$LoginCopyWith<$Res> {
  __$LoginCopyWithImpl(this._self, this._then);

  final _Login _self;
  final $Res Function(_Login) _then;

/// Create a copy of AuthEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? email = null,Object? password = null,}) {
  return _then(_Login(
email: null == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String,password: null == password ? _self.password : password // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class _Register implements AuthEvent {
  const _Register({required this.name, required this.email, required this.password});
  

 final  String name;
 final  String email;
 final  String password;

/// Create a copy of AuthEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$RegisterCopyWith<_Register> get copyWith => __$RegisterCopyWithImpl<_Register>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Register&&(identical(other.name, name) || other.name == name)&&(identical(other.email, email) || other.email == email)&&(identical(other.password, password) || other.password == password));
}


@override
int get hashCode => Object.hash(runtimeType,name,email,password);

@override
String toString() {
  return 'AuthEvent.register(name: $name, email: $email, password: $password)';
}


}

/// @nodoc
abstract mixin class _$RegisterCopyWith<$Res> implements $AuthEventCopyWith<$Res> {
  factory _$RegisterCopyWith(_Register value, $Res Function(_Register) _then) = __$RegisterCopyWithImpl;
@useResult
$Res call({
 String name, String email, String password
});




}
/// @nodoc
class __$RegisterCopyWithImpl<$Res>
    implements _$RegisterCopyWith<$Res> {
  __$RegisterCopyWithImpl(this._self, this._then);

  final _Register _self;
  final $Res Function(_Register) _then;

/// Create a copy of AuthEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? name = null,Object? email = null,Object? password = null,}) {
  return _then(_Register(
name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,email: null == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String,password: null == password ? _self.password : password // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class _LoginWithGoogle implements AuthEvent {
  const _LoginWithGoogle();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _LoginWithGoogle);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'AuthEvent.loginWithGoogle()';
}


}




/// @nodoc


class _Logout implements AuthEvent {
  const _Logout();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Logout);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'AuthEvent.logout()';
}


}




/// @nodoc


class _ResetPassword implements AuthEvent {
  const _ResetPassword({required this.password});
  

 final  String password;

/// Create a copy of AuthEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ResetPasswordCopyWith<_ResetPassword> get copyWith => __$ResetPasswordCopyWithImpl<_ResetPassword>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ResetPassword&&(identical(other.password, password) || other.password == password));
}


@override
int get hashCode => Object.hash(runtimeType,password);

@override
String toString() {
  return 'AuthEvent.resetPassword(password: $password)';
}


}

/// @nodoc
abstract mixin class _$ResetPasswordCopyWith<$Res> implements $AuthEventCopyWith<$Res> {
  factory _$ResetPasswordCopyWith(_ResetPassword value, $Res Function(_ResetPassword) _then) = __$ResetPasswordCopyWithImpl;
@useResult
$Res call({
 String password
});




}
/// @nodoc
class __$ResetPasswordCopyWithImpl<$Res>
    implements _$ResetPasswordCopyWith<$Res> {
  __$ResetPasswordCopyWithImpl(this._self, this._then);

  final _ResetPassword _self;
  final $Res Function(_ResetPassword) _then;

/// Create a copy of AuthEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? password = null,}) {
  return _then(_ResetPassword(
password: null == password ? _self.password : password // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
