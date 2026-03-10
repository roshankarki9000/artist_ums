// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'connectivity_event.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$ConnectivityEvent {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ConnectivityEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ConnectivityEvent()';
}


}

/// @nodoc
class $ConnectivityEventCopyWith<$Res>  {
$ConnectivityEventCopyWith(ConnectivityEvent _, $Res Function(ConnectivityEvent) __);
}


/// Adds pattern-matching-related methods to [ConnectivityEvent].
extension ConnectivityEventPatterns on ConnectivityEvent {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _Started value)?  started,TResult Function( _CheckRequested value)?  checkRequested,TResult Function( _ConnectionChanged value)?  connectionChanged,TResult Function( _ShowDisconnected value)?  showDisconnected,TResult Function( _RetryPressed value)?  retryPressed,TResult Function( _FailureReceived value)?  failureReceived,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Started() when started != null:
return started(_that);case _CheckRequested() when checkRequested != null:
return checkRequested(_that);case _ConnectionChanged() when connectionChanged != null:
return connectionChanged(_that);case _ShowDisconnected() when showDisconnected != null:
return showDisconnected(_that);case _RetryPressed() when retryPressed != null:
return retryPressed(_that);case _FailureReceived() when failureReceived != null:
return failureReceived(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _Started value)  started,required TResult Function( _CheckRequested value)  checkRequested,required TResult Function( _ConnectionChanged value)  connectionChanged,required TResult Function( _ShowDisconnected value)  showDisconnected,required TResult Function( _RetryPressed value)  retryPressed,required TResult Function( _FailureReceived value)  failureReceived,}){
final _that = this;
switch (_that) {
case _Started():
return started(_that);case _CheckRequested():
return checkRequested(_that);case _ConnectionChanged():
return connectionChanged(_that);case _ShowDisconnected():
return showDisconnected(_that);case _RetryPressed():
return retryPressed(_that);case _FailureReceived():
return failureReceived(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _Started value)?  started,TResult? Function( _CheckRequested value)?  checkRequested,TResult? Function( _ConnectionChanged value)?  connectionChanged,TResult? Function( _ShowDisconnected value)?  showDisconnected,TResult? Function( _RetryPressed value)?  retryPressed,TResult? Function( _FailureReceived value)?  failureReceived,}){
final _that = this;
switch (_that) {
case _Started() when started != null:
return started(_that);case _CheckRequested() when checkRequested != null:
return checkRequested(_that);case _ConnectionChanged() when connectionChanged != null:
return connectionChanged(_that);case _ShowDisconnected() when showDisconnected != null:
return showDisconnected(_that);case _RetryPressed() when retryPressed != null:
return retryPressed(_that);case _FailureReceived() when failureReceived != null:
return failureReceived(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  started,TResult Function()?  checkRequested,TResult Function( bool isConnected)?  connectionChanged,TResult Function()?  showDisconnected,TResult Function()?  retryPressed,TResult Function( String message)?  failureReceived,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Started() when started != null:
return started();case _CheckRequested() when checkRequested != null:
return checkRequested();case _ConnectionChanged() when connectionChanged != null:
return connectionChanged(_that.isConnected);case _ShowDisconnected() when showDisconnected != null:
return showDisconnected();case _RetryPressed() when retryPressed != null:
return retryPressed();case _FailureReceived() when failureReceived != null:
return failureReceived(_that.message);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  started,required TResult Function()  checkRequested,required TResult Function( bool isConnected)  connectionChanged,required TResult Function()  showDisconnected,required TResult Function()  retryPressed,required TResult Function( String message)  failureReceived,}) {final _that = this;
switch (_that) {
case _Started():
return started();case _CheckRequested():
return checkRequested();case _ConnectionChanged():
return connectionChanged(_that.isConnected);case _ShowDisconnected():
return showDisconnected();case _RetryPressed():
return retryPressed();case _FailureReceived():
return failureReceived(_that.message);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  started,TResult? Function()?  checkRequested,TResult? Function( bool isConnected)?  connectionChanged,TResult? Function()?  showDisconnected,TResult? Function()?  retryPressed,TResult? Function( String message)?  failureReceived,}) {final _that = this;
switch (_that) {
case _Started() when started != null:
return started();case _CheckRequested() when checkRequested != null:
return checkRequested();case _ConnectionChanged() when connectionChanged != null:
return connectionChanged(_that.isConnected);case _ShowDisconnected() when showDisconnected != null:
return showDisconnected();case _RetryPressed() when retryPressed != null:
return retryPressed();case _FailureReceived() when failureReceived != null:
return failureReceived(_that.message);case _:
  return null;

}
}

}

/// @nodoc


class _Started implements ConnectivityEvent {
  const _Started();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Started);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ConnectivityEvent.started()';
}


}




/// @nodoc


class _CheckRequested implements ConnectivityEvent {
  const _CheckRequested();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CheckRequested);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ConnectivityEvent.checkRequested()';
}


}




/// @nodoc


class _ConnectionChanged implements ConnectivityEvent {
  const _ConnectionChanged(this.isConnected);
  

 final  bool isConnected;

/// Create a copy of ConnectivityEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ConnectionChangedCopyWith<_ConnectionChanged> get copyWith => __$ConnectionChangedCopyWithImpl<_ConnectionChanged>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ConnectionChanged&&(identical(other.isConnected, isConnected) || other.isConnected == isConnected));
}


@override
int get hashCode => Object.hash(runtimeType,isConnected);

@override
String toString() {
  return 'ConnectivityEvent.connectionChanged(isConnected: $isConnected)';
}


}

/// @nodoc
abstract mixin class _$ConnectionChangedCopyWith<$Res> implements $ConnectivityEventCopyWith<$Res> {
  factory _$ConnectionChangedCopyWith(_ConnectionChanged value, $Res Function(_ConnectionChanged) _then) = __$ConnectionChangedCopyWithImpl;
@useResult
$Res call({
 bool isConnected
});




}
/// @nodoc
class __$ConnectionChangedCopyWithImpl<$Res>
    implements _$ConnectionChangedCopyWith<$Res> {
  __$ConnectionChangedCopyWithImpl(this._self, this._then);

  final _ConnectionChanged _self;
  final $Res Function(_ConnectionChanged) _then;

/// Create a copy of ConnectivityEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? isConnected = null,}) {
  return _then(_ConnectionChanged(
null == isConnected ? _self.isConnected : isConnected // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

/// @nodoc


class _ShowDisconnected implements ConnectivityEvent {
  const _ShowDisconnected();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ShowDisconnected);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ConnectivityEvent.showDisconnected()';
}


}




/// @nodoc


class _RetryPressed implements ConnectivityEvent {
  const _RetryPressed();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _RetryPressed);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ConnectivityEvent.retryPressed()';
}


}




/// @nodoc


class _FailureReceived implements ConnectivityEvent {
  const _FailureReceived(this.message);
  

 final  String message;

/// Create a copy of ConnectivityEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$FailureReceivedCopyWith<_FailureReceived> get copyWith => __$FailureReceivedCopyWithImpl<_FailureReceived>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _FailureReceived&&(identical(other.message, message) || other.message == message));
}


@override
int get hashCode => Object.hash(runtimeType,message);

@override
String toString() {
  return 'ConnectivityEvent.failureReceived(message: $message)';
}


}

/// @nodoc
abstract mixin class _$FailureReceivedCopyWith<$Res> implements $ConnectivityEventCopyWith<$Res> {
  factory _$FailureReceivedCopyWith(_FailureReceived value, $Res Function(_FailureReceived) _then) = __$FailureReceivedCopyWithImpl;
@useResult
$Res call({
 String message
});




}
/// @nodoc
class __$FailureReceivedCopyWithImpl<$Res>
    implements _$FailureReceivedCopyWith<$Res> {
  __$FailureReceivedCopyWithImpl(this._self, this._then);

  final _FailureReceived _self;
  final $Res Function(_FailureReceived) _then;

/// Create a copy of ConnectivityEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? message = null,}) {
  return _then(_FailureReceived(
null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
