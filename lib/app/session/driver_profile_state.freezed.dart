// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'driver_profile_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$DriverProfileState {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DriverProfileState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'DriverProfileState()';
}


}

/// @nodoc
class $DriverProfileStateCopyWith<$Res>  {
$DriverProfileStateCopyWith(DriverProfileState _, $Res Function(DriverProfileState) __);
}


/// Adds pattern-matching-related methods to [DriverProfileState].
extension DriverProfileStatePatterns on DriverProfileState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( DriverProfileLoading value)?  loading,TResult Function( DriverProfileLoaded value)?  loaded,TResult Function( DriverProfileFailure value)?  failure,required TResult orElse(),}){
final _that = this;
switch (_that) {
case DriverProfileLoading() when loading != null:
return loading(_that);case DriverProfileLoaded() when loaded != null:
return loaded(_that);case DriverProfileFailure() when failure != null:
return failure(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( DriverProfileLoading value)  loading,required TResult Function( DriverProfileLoaded value)  loaded,required TResult Function( DriverProfileFailure value)  failure,}){
final _that = this;
switch (_that) {
case DriverProfileLoading():
return loading(_that);case DriverProfileLoaded():
return loaded(_that);case DriverProfileFailure():
return failure(_that);}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( DriverProfileLoading value)?  loading,TResult? Function( DriverProfileLoaded value)?  loaded,TResult? Function( DriverProfileFailure value)?  failure,}){
final _that = this;
switch (_that) {
case DriverProfileLoading() when loading != null:
return loading(_that);case DriverProfileLoaded() when loaded != null:
return loaded(_that);case DriverProfileFailure() when failure != null:
return failure(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  loading,TResult Function( DriverProfile profile)?  loaded,TResult Function( Failure failure)?  failure,required TResult orElse(),}) {final _that = this;
switch (_that) {
case DriverProfileLoading() when loading != null:
return loading();case DriverProfileLoaded() when loaded != null:
return loaded(_that.profile);case DriverProfileFailure() when failure != null:
return failure(_that.failure);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  loading,required TResult Function( DriverProfile profile)  loaded,required TResult Function( Failure failure)  failure,}) {final _that = this;
switch (_that) {
case DriverProfileLoading():
return loading();case DriverProfileLoaded():
return loaded(_that.profile);case DriverProfileFailure():
return failure(_that.failure);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  loading,TResult? Function( DriverProfile profile)?  loaded,TResult? Function( Failure failure)?  failure,}) {final _that = this;
switch (_that) {
case DriverProfileLoading() when loading != null:
return loading();case DriverProfileLoaded() when loaded != null:
return loaded(_that.profile);case DriverProfileFailure() when failure != null:
return failure(_that.failure);case _:
  return null;

}
}

}

/// @nodoc


class DriverProfileLoading extends DriverProfileState {
  const DriverProfileLoading(): super._();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DriverProfileLoading);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'DriverProfileState.loading()';
}


}




/// @nodoc


class DriverProfileLoaded extends DriverProfileState {
  const DriverProfileLoaded(this.profile): super._();
  

 final  DriverProfile profile;

/// Create a copy of DriverProfileState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$DriverProfileLoadedCopyWith<DriverProfileLoaded> get copyWith => _$DriverProfileLoadedCopyWithImpl<DriverProfileLoaded>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DriverProfileLoaded&&(identical(other.profile, profile) || other.profile == profile));
}


@override
int get hashCode => Object.hash(runtimeType,profile);

@override
String toString() {
  return 'DriverProfileState.loaded(profile: $profile)';
}


}

/// @nodoc
abstract mixin class $DriverProfileLoadedCopyWith<$Res> implements $DriverProfileStateCopyWith<$Res> {
  factory $DriverProfileLoadedCopyWith(DriverProfileLoaded value, $Res Function(DriverProfileLoaded) _then) = _$DriverProfileLoadedCopyWithImpl;
@useResult
$Res call({
 DriverProfile profile
});




}
/// @nodoc
class _$DriverProfileLoadedCopyWithImpl<$Res>
    implements $DriverProfileLoadedCopyWith<$Res> {
  _$DriverProfileLoadedCopyWithImpl(this._self, this._then);

  final DriverProfileLoaded _self;
  final $Res Function(DriverProfileLoaded) _then;

/// Create a copy of DriverProfileState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? profile = null,}) {
  return _then(DriverProfileLoaded(
null == profile ? _self.profile : profile // ignore: cast_nullable_to_non_nullable
as DriverProfile,
  ));
}


}

/// @nodoc


class DriverProfileFailure extends DriverProfileState {
  const DriverProfileFailure(this.failure): super._();
  

 final  Failure failure;

/// Create a copy of DriverProfileState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$DriverProfileFailureCopyWith<DriverProfileFailure> get copyWith => _$DriverProfileFailureCopyWithImpl<DriverProfileFailure>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DriverProfileFailure&&(identical(other.failure, failure) || other.failure == failure));
}


@override
int get hashCode => Object.hash(runtimeType,failure);

@override
String toString() {
  return 'DriverProfileState.failure(failure: $failure)';
}


}

/// @nodoc
abstract mixin class $DriverProfileFailureCopyWith<$Res> implements $DriverProfileStateCopyWith<$Res> {
  factory $DriverProfileFailureCopyWith(DriverProfileFailure value, $Res Function(DriverProfileFailure) _then) = _$DriverProfileFailureCopyWithImpl;
@useResult
$Res call({
 Failure failure
});




}
/// @nodoc
class _$DriverProfileFailureCopyWithImpl<$Res>
    implements $DriverProfileFailureCopyWith<$Res> {
  _$DriverProfileFailureCopyWithImpl(this._self, this._then);

  final DriverProfileFailure _self;
  final $Res Function(DriverProfileFailure) _then;

/// Create a copy of DriverProfileState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? failure = null,}) {
  return _then(DriverProfileFailure(
null == failure ? _self.failure : failure // ignore: cast_nullable_to_non_nullable
as Failure,
  ));
}


}

// dart format on
