// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'fail_delivery_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$FailDeliveryState {

 FailReason? get reason; String get note; bool get isSubmitting; Failure? get failure; OrderDetail? get result;/// Submit was tapped without a usable reason.
 bool get isReasonMissing;
/// Create a copy of FailDeliveryState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$FailDeliveryStateCopyWith<FailDeliveryState> get copyWith => _$FailDeliveryStateCopyWithImpl<FailDeliveryState>(this as FailDeliveryState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is FailDeliveryState&&(identical(other.reason, reason) || other.reason == reason)&&(identical(other.note, note) || other.note == note)&&(identical(other.isSubmitting, isSubmitting) || other.isSubmitting == isSubmitting)&&(identical(other.failure, failure) || other.failure == failure)&&(identical(other.result, result) || other.result == result)&&(identical(other.isReasonMissing, isReasonMissing) || other.isReasonMissing == isReasonMissing));
}


@override
int get hashCode => Object.hash(runtimeType,reason,note,isSubmitting,failure,result,isReasonMissing);

@override
String toString() {
  return 'FailDeliveryState(reason: $reason, note: $note, isSubmitting: $isSubmitting, failure: $failure, result: $result, isReasonMissing: $isReasonMissing)';
}


}

/// @nodoc
abstract mixin class $FailDeliveryStateCopyWith<$Res>  {
  factory $FailDeliveryStateCopyWith(FailDeliveryState value, $Res Function(FailDeliveryState) _then) = _$FailDeliveryStateCopyWithImpl;
@useResult
$Res call({
 FailReason? reason, String note, bool isSubmitting, Failure? failure, OrderDetail? result, bool isReasonMissing
});




}
/// @nodoc
class _$FailDeliveryStateCopyWithImpl<$Res>
    implements $FailDeliveryStateCopyWith<$Res> {
  _$FailDeliveryStateCopyWithImpl(this._self, this._then);

  final FailDeliveryState _self;
  final $Res Function(FailDeliveryState) _then;

/// Create a copy of FailDeliveryState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? reason = freezed,Object? note = null,Object? isSubmitting = null,Object? failure = freezed,Object? result = freezed,Object? isReasonMissing = null,}) {
  return _then(_self.copyWith(
reason: freezed == reason ? _self.reason : reason // ignore: cast_nullable_to_non_nullable
as FailReason?,note: null == note ? _self.note : note // ignore: cast_nullable_to_non_nullable
as String,isSubmitting: null == isSubmitting ? _self.isSubmitting : isSubmitting // ignore: cast_nullable_to_non_nullable
as bool,failure: freezed == failure ? _self.failure : failure // ignore: cast_nullable_to_non_nullable
as Failure?,result: freezed == result ? _self.result : result // ignore: cast_nullable_to_non_nullable
as OrderDetail?,isReasonMissing: null == isReasonMissing ? _self.isReasonMissing : isReasonMissing // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


/// Adds pattern-matching-related methods to [FailDeliveryState].
extension FailDeliveryStatePatterns on FailDeliveryState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _FailDeliveryState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _FailDeliveryState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _FailDeliveryState value)  $default,){
final _that = this;
switch (_that) {
case _FailDeliveryState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _FailDeliveryState value)?  $default,){
final _that = this;
switch (_that) {
case _FailDeliveryState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( FailReason? reason,  String note,  bool isSubmitting,  Failure? failure,  OrderDetail? result,  bool isReasonMissing)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _FailDeliveryState() when $default != null:
return $default(_that.reason,_that.note,_that.isSubmitting,_that.failure,_that.result,_that.isReasonMissing);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( FailReason? reason,  String note,  bool isSubmitting,  Failure? failure,  OrderDetail? result,  bool isReasonMissing)  $default,) {final _that = this;
switch (_that) {
case _FailDeliveryState():
return $default(_that.reason,_that.note,_that.isSubmitting,_that.failure,_that.result,_that.isReasonMissing);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( FailReason? reason,  String note,  bool isSubmitting,  Failure? failure,  OrderDetail? result,  bool isReasonMissing)?  $default,) {final _that = this;
switch (_that) {
case _FailDeliveryState() when $default != null:
return $default(_that.reason,_that.note,_that.isSubmitting,_that.failure,_that.result,_that.isReasonMissing);case _:
  return null;

}
}

}

/// @nodoc


class _FailDeliveryState extends FailDeliveryState {
  const _FailDeliveryState({this.reason, this.note = '', this.isSubmitting = false, this.failure, this.result, this.isReasonMissing = false}): super._();
  

@override final  FailReason? reason;
@override@JsonKey() final  String note;
@override@JsonKey() final  bool isSubmitting;
@override final  Failure? failure;
@override final  OrderDetail? result;
/// Submit was tapped without a usable reason.
@override@JsonKey() final  bool isReasonMissing;

/// Create a copy of FailDeliveryState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$FailDeliveryStateCopyWith<_FailDeliveryState> get copyWith => __$FailDeliveryStateCopyWithImpl<_FailDeliveryState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _FailDeliveryState&&(identical(other.reason, reason) || other.reason == reason)&&(identical(other.note, note) || other.note == note)&&(identical(other.isSubmitting, isSubmitting) || other.isSubmitting == isSubmitting)&&(identical(other.failure, failure) || other.failure == failure)&&(identical(other.result, result) || other.result == result)&&(identical(other.isReasonMissing, isReasonMissing) || other.isReasonMissing == isReasonMissing));
}


@override
int get hashCode => Object.hash(runtimeType,reason,note,isSubmitting,failure,result,isReasonMissing);

@override
String toString() {
  return 'FailDeliveryState(reason: $reason, note: $note, isSubmitting: $isSubmitting, failure: $failure, result: $result, isReasonMissing: $isReasonMissing)';
}


}

/// @nodoc
abstract mixin class _$FailDeliveryStateCopyWith<$Res> implements $FailDeliveryStateCopyWith<$Res> {
  factory _$FailDeliveryStateCopyWith(_FailDeliveryState value, $Res Function(_FailDeliveryState) _then) = __$FailDeliveryStateCopyWithImpl;
@override @useResult
$Res call({
 FailReason? reason, String note, bool isSubmitting, Failure? failure, OrderDetail? result, bool isReasonMissing
});




}
/// @nodoc
class __$FailDeliveryStateCopyWithImpl<$Res>
    implements _$FailDeliveryStateCopyWith<$Res> {
  __$FailDeliveryStateCopyWithImpl(this._self, this._then);

  final _FailDeliveryState _self;
  final $Res Function(_FailDeliveryState) _then;

/// Create a copy of FailDeliveryState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? reason = freezed,Object? note = null,Object? isSubmitting = null,Object? failure = freezed,Object? result = freezed,Object? isReasonMissing = null,}) {
  return _then(_FailDeliveryState(
reason: freezed == reason ? _self.reason : reason // ignore: cast_nullable_to_non_nullable
as FailReason?,note: null == note ? _self.note : note // ignore: cast_nullable_to_non_nullable
as String,isSubmitting: null == isSubmitting ? _self.isSubmitting : isSubmitting // ignore: cast_nullable_to_non_nullable
as bool,failure: freezed == failure ? _self.failure : failure // ignore: cast_nullable_to_non_nullable
as Failure?,result: freezed == result ? _self.result : result // ignore: cast_nullable_to_non_nullable
as OrderDetail?,isReasonMissing: null == isReasonMissing ? _self.isReasonMissing : isReasonMissing // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

// dart format on
