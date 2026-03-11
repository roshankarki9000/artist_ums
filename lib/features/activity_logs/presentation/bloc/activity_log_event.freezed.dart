// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'activity_log_event.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$ActivityLogEvent {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ActivityLogEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ActivityLogEvent()';
}


}

/// @nodoc
class $ActivityLogEventCopyWith<$Res>  {
$ActivityLogEventCopyWith(ActivityLogEvent _, $Res Function(ActivityLogEvent) __);
}


/// Adds pattern-matching-related methods to [ActivityLogEvent].
extension ActivityLogEventPatterns on ActivityLogEvent {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _Started value)?  started,TResult Function( _LogsReceived value)?  logsReceived,TResult Function( _ErrorOccurred value)?  errorOccurred,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Started() when started != null:
return started(_that);case _LogsReceived() when logsReceived != null:
return logsReceived(_that);case _ErrorOccurred() when errorOccurred != null:
return errorOccurred(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _Started value)  started,required TResult Function( _LogsReceived value)  logsReceived,required TResult Function( _ErrorOccurred value)  errorOccurred,}){
final _that = this;
switch (_that) {
case _Started():
return started(_that);case _LogsReceived():
return logsReceived(_that);case _ErrorOccurred():
return errorOccurred(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _Started value)?  started,TResult? Function( _LogsReceived value)?  logsReceived,TResult? Function( _ErrorOccurred value)?  errorOccurred,}){
final _that = this;
switch (_that) {
case _Started() when started != null:
return started(_that);case _LogsReceived() when logsReceived != null:
return logsReceived(_that);case _ErrorOccurred() when errorOccurred != null:
return errorOccurred(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  started,TResult Function( List<ActivityLogModel> logs)?  logsReceived,TResult Function( String message)?  errorOccurred,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Started() when started != null:
return started();case _LogsReceived() when logsReceived != null:
return logsReceived(_that.logs);case _ErrorOccurred() when errorOccurred != null:
return errorOccurred(_that.message);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  started,required TResult Function( List<ActivityLogModel> logs)  logsReceived,required TResult Function( String message)  errorOccurred,}) {final _that = this;
switch (_that) {
case _Started():
return started();case _LogsReceived():
return logsReceived(_that.logs);case _ErrorOccurred():
return errorOccurred(_that.message);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  started,TResult? Function( List<ActivityLogModel> logs)?  logsReceived,TResult? Function( String message)?  errorOccurred,}) {final _that = this;
switch (_that) {
case _Started() when started != null:
return started();case _LogsReceived() when logsReceived != null:
return logsReceived(_that.logs);case _ErrorOccurred() when errorOccurred != null:
return errorOccurred(_that.message);case _:
  return null;

}
}

}

/// @nodoc


class _Started implements ActivityLogEvent {
  const _Started();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Started);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ActivityLogEvent.started()';
}


}




/// @nodoc


class _LogsReceived implements ActivityLogEvent {
  const _LogsReceived(final  List<ActivityLogModel> logs): _logs = logs;
  

 final  List<ActivityLogModel> _logs;
 List<ActivityLogModel> get logs {
  if (_logs is EqualUnmodifiableListView) return _logs;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_logs);
}


/// Create a copy of ActivityLogEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$LogsReceivedCopyWith<_LogsReceived> get copyWith => __$LogsReceivedCopyWithImpl<_LogsReceived>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _LogsReceived&&const DeepCollectionEquality().equals(other._logs, _logs));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_logs));

@override
String toString() {
  return 'ActivityLogEvent.logsReceived(logs: $logs)';
}


}

/// @nodoc
abstract mixin class _$LogsReceivedCopyWith<$Res> implements $ActivityLogEventCopyWith<$Res> {
  factory _$LogsReceivedCopyWith(_LogsReceived value, $Res Function(_LogsReceived) _then) = __$LogsReceivedCopyWithImpl;
@useResult
$Res call({
 List<ActivityLogModel> logs
});




}
/// @nodoc
class __$LogsReceivedCopyWithImpl<$Res>
    implements _$LogsReceivedCopyWith<$Res> {
  __$LogsReceivedCopyWithImpl(this._self, this._then);

  final _LogsReceived _self;
  final $Res Function(_LogsReceived) _then;

/// Create a copy of ActivityLogEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? logs = null,}) {
  return _then(_LogsReceived(
null == logs ? _self._logs : logs // ignore: cast_nullable_to_non_nullable
as List<ActivityLogModel>,
  ));
}


}

/// @nodoc


class _ErrorOccurred implements ActivityLogEvent {
  const _ErrorOccurred(this.message);
  

 final  String message;

/// Create a copy of ActivityLogEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ErrorOccurredCopyWith<_ErrorOccurred> get copyWith => __$ErrorOccurredCopyWithImpl<_ErrorOccurred>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ErrorOccurred&&(identical(other.message, message) || other.message == message));
}


@override
int get hashCode => Object.hash(runtimeType,message);

@override
String toString() {
  return 'ActivityLogEvent.errorOccurred(message: $message)';
}


}

/// @nodoc
abstract mixin class _$ErrorOccurredCopyWith<$Res> implements $ActivityLogEventCopyWith<$Res> {
  factory _$ErrorOccurredCopyWith(_ErrorOccurred value, $Res Function(_ErrorOccurred) _then) = __$ErrorOccurredCopyWithImpl;
@useResult
$Res call({
 String message
});




}
/// @nodoc
class __$ErrorOccurredCopyWithImpl<$Res>
    implements _$ErrorOccurredCopyWith<$Res> {
  __$ErrorOccurredCopyWithImpl(this._self, this._then);

  final _ErrorOccurred _self;
  final $Res Function(_ErrorOccurred) _then;

/// Create a copy of ActivityLogEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? message = null,}) {
  return _then(_ErrorOccurred(
null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
