// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'reassign_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$ReassignState {

 String get reason; bool get isSubmitting; Failure? get failure; OrderDetail? get result;
/// Create a copy of ReassignState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ReassignStateCopyWith<ReassignState> get copyWith => _$ReassignStateCopyWithImpl<ReassignState>(this as ReassignState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ReassignState&&(identical(other.reason, reason) || other.reason == reason)&&(identical(other.isSubmitting, isSubmitting) || other.isSubmitting == isSubmitting)&&(identical(other.failure, failure) || other.failure == failure)&&(identical(other.result, result) || other.result == result));
}


@override
int get hashCode => Object.hash(runtimeType,reason,isSubmitting,failure,result);

@override
String toString() {
  return 'ReassignState(reason: $reason, isSubmitting: $isSubmitting, failure: $failure, result: $result)';
}


}

/// @nodoc
abstract mixin class $ReassignStateCopyWith<$Res>  {
  factory $ReassignStateCopyWith(ReassignState value, $Res Function(ReassignState) _then) = _$ReassignStateCopyWithImpl;
@useResult
$Res call({
 String reason, bool isSubmitting, Failure? failure, OrderDetail? result
});




}
/// @nodoc
class _$ReassignStateCopyWithImpl<$Res>
    implements $ReassignStateCopyWith<$Res> {
  _$ReassignStateCopyWithImpl(this._self, this._then);

  final ReassignState _self;
  final $Res Function(ReassignState) _then;

/// Create a copy of ReassignState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? reason = null,Object? isSubmitting = null,Object? failure = freezed,Object? result = freezed,}) {
  return _then(_self.copyWith(
reason: null == reason ? _self.reason : reason // ignore: cast_nullable_to_non_nullable
as String,isSubmitting: null == isSubmitting ? _self.isSubmitting : isSubmitting // ignore: cast_nullable_to_non_nullable
as bool,failure: freezed == failure ? _self.failure : failure // ignore: cast_nullable_to_non_nullable
as Failure?,result: freezed == result ? _self.result : result // ignore: cast_nullable_to_non_nullable
as OrderDetail?,
  ));
}

}


/// Adds pattern-matching-related methods to [ReassignState].
extension ReassignStatePatterns on ReassignState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ReassignState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ReassignState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ReassignState value)  $default,){
final _that = this;
switch (_that) {
case _ReassignState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ReassignState value)?  $default,){
final _that = this;
switch (_that) {
case _ReassignState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String reason,  bool isSubmitting,  Failure? failure,  OrderDetail? result)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ReassignState() when $default != null:
return $default(_that.reason,_that.isSubmitting,_that.failure,_that.result);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String reason,  bool isSubmitting,  Failure? failure,  OrderDetail? result)  $default,) {final _that = this;
switch (_that) {
case _ReassignState():
return $default(_that.reason,_that.isSubmitting,_that.failure,_that.result);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String reason,  bool isSubmitting,  Failure? failure,  OrderDetail? result)?  $default,) {final _that = this;
switch (_that) {
case _ReassignState() when $default != null:
return $default(_that.reason,_that.isSubmitting,_that.failure,_that.result);case _:
  return null;

}
}

}

/// @nodoc


class _ReassignState extends ReassignState {
  const _ReassignState({this.reason = '', this.isSubmitting = false, this.failure, this.result}): super._();
  

@override@JsonKey() final  String reason;
@override@JsonKey() final  bool isSubmitting;
@override final  Failure? failure;
@override final  OrderDetail? result;

/// Create a copy of ReassignState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ReassignStateCopyWith<_ReassignState> get copyWith => __$ReassignStateCopyWithImpl<_ReassignState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ReassignState&&(identical(other.reason, reason) || other.reason == reason)&&(identical(other.isSubmitting, isSubmitting) || other.isSubmitting == isSubmitting)&&(identical(other.failure, failure) || other.failure == failure)&&(identical(other.result, result) || other.result == result));
}


@override
int get hashCode => Object.hash(runtimeType,reason,isSubmitting,failure,result);

@override
String toString() {
  return 'ReassignState(reason: $reason, isSubmitting: $isSubmitting, failure: $failure, result: $result)';
}


}

/// @nodoc
abstract mixin class _$ReassignStateCopyWith<$Res> implements $ReassignStateCopyWith<$Res> {
  factory _$ReassignStateCopyWith(_ReassignState value, $Res Function(_ReassignState) _then) = __$ReassignStateCopyWithImpl;
@override @useResult
$Res call({
 String reason, bool isSubmitting, Failure? failure, OrderDetail? result
});




}
/// @nodoc
class __$ReassignStateCopyWithImpl<$Res>
    implements _$ReassignStateCopyWith<$Res> {
  __$ReassignStateCopyWithImpl(this._self, this._then);

  final _ReassignState _self;
  final $Res Function(_ReassignState) _then;

/// Create a copy of ReassignState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? reason = null,Object? isSubmitting = null,Object? failure = freezed,Object? result = freezed,}) {
  return _then(_ReassignState(
reason: null == reason ? _self.reason : reason // ignore: cast_nullable_to_non_nullable
as String,isSubmitting: null == isSubmitting ? _self.isSubmitting : isSubmitting // ignore: cast_nullable_to_non_nullable
as bool,failure: freezed == failure ? _self.failure : failure // ignore: cast_nullable_to_non_nullable
as Failure?,result: freezed == result ? _self.result : result // ignore: cast_nullable_to_non_nullable
as OrderDetail?,
  ));
}


}

// dart format on
