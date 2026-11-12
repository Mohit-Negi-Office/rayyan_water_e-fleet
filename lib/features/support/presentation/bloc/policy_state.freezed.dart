// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'policy_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$PolicyState {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PolicyState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'PolicyState()';
}


}

/// @nodoc
class $PolicyStateCopyWith<$Res>  {
$PolicyStateCopyWith(PolicyState _, $Res Function(PolicyState) __);
}


/// Adds pattern-matching-related methods to [PolicyState].
extension PolicyStatePatterns on PolicyState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( PolicyLoading value)?  loading,TResult Function( PolicyLoaded value)?  loaded,TResult Function( PolicyFailure value)?  failure,required TResult orElse(),}){
final _that = this;
switch (_that) {
case PolicyLoading() when loading != null:
return loading(_that);case PolicyLoaded() when loaded != null:
return loaded(_that);case PolicyFailure() when failure != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( PolicyLoading value)  loading,required TResult Function( PolicyLoaded value)  loaded,required TResult Function( PolicyFailure value)  failure,}){
final _that = this;
switch (_that) {
case PolicyLoading():
return loading(_that);case PolicyLoaded():
return loaded(_that);case PolicyFailure():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( PolicyLoading value)?  loading,TResult? Function( PolicyLoaded value)?  loaded,TResult? Function( PolicyFailure value)?  failure,}){
final _that = this;
switch (_that) {
case PolicyLoading() when loading != null:
return loading(_that);case PolicyLoaded() when loaded != null:
return loaded(_that);case PolicyFailure() when failure != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  loading,TResult Function( PolicyDocument document)?  loaded,TResult Function( Failure failure)?  failure,required TResult orElse(),}) {final _that = this;
switch (_that) {
case PolicyLoading() when loading != null:
return loading();case PolicyLoaded() when loaded != null:
return loaded(_that.document);case PolicyFailure() when failure != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  loading,required TResult Function( PolicyDocument document)  loaded,required TResult Function( Failure failure)  failure,}) {final _that = this;
switch (_that) {
case PolicyLoading():
return loading();case PolicyLoaded():
return loaded(_that.document);case PolicyFailure():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  loading,TResult? Function( PolicyDocument document)?  loaded,TResult? Function( Failure failure)?  failure,}) {final _that = this;
switch (_that) {
case PolicyLoading() when loading != null:
return loading();case PolicyLoaded() when loaded != null:
return loaded(_that.document);case PolicyFailure() when failure != null:
return failure(_that.failure);case _:
  return null;

}
}

}

/// @nodoc


class PolicyLoading implements PolicyState {
  const PolicyLoading();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PolicyLoading);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'PolicyState.loading()';
}


}




/// @nodoc


class PolicyLoaded implements PolicyState {
  const PolicyLoaded(this.document);
  

 final  PolicyDocument document;

/// Create a copy of PolicyState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PolicyLoadedCopyWith<PolicyLoaded> get copyWith => _$PolicyLoadedCopyWithImpl<PolicyLoaded>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PolicyLoaded&&(identical(other.document, document) || other.document == document));
}


@override
int get hashCode => Object.hash(runtimeType,document);

@override
String toString() {
  return 'PolicyState.loaded(document: $document)';
}


}

/// @nodoc
abstract mixin class $PolicyLoadedCopyWith<$Res> implements $PolicyStateCopyWith<$Res> {
  factory $PolicyLoadedCopyWith(PolicyLoaded value, $Res Function(PolicyLoaded) _then) = _$PolicyLoadedCopyWithImpl;
@useResult
$Res call({
 PolicyDocument document
});




}
/// @nodoc
class _$PolicyLoadedCopyWithImpl<$Res>
    implements $PolicyLoadedCopyWith<$Res> {
  _$PolicyLoadedCopyWithImpl(this._self, this._then);

  final PolicyLoaded _self;
  final $Res Function(PolicyLoaded) _then;

/// Create a copy of PolicyState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? document = null,}) {
  return _then(PolicyLoaded(
null == document ? _self.document : document // ignore: cast_nullable_to_non_nullable
as PolicyDocument,
  ));
}


}

/// @nodoc


class PolicyFailure implements PolicyState {
  const PolicyFailure(this.failure);
  

 final  Failure failure;

/// Create a copy of PolicyState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PolicyFailureCopyWith<PolicyFailure> get copyWith => _$PolicyFailureCopyWithImpl<PolicyFailure>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PolicyFailure&&(identical(other.failure, failure) || other.failure == failure));
}


@override
int get hashCode => Object.hash(runtimeType,failure);

@override
String toString() {
  return 'PolicyState.failure(failure: $failure)';
}


}

/// @nodoc
abstract mixin class $PolicyFailureCopyWith<$Res> implements $PolicyStateCopyWith<$Res> {
  factory $PolicyFailureCopyWith(PolicyFailure value, $Res Function(PolicyFailure) _then) = _$PolicyFailureCopyWithImpl;
@useResult
$Res call({
 Failure failure
});




}
/// @nodoc
class _$PolicyFailureCopyWithImpl<$Res>
    implements $PolicyFailureCopyWith<$Res> {
  _$PolicyFailureCopyWithImpl(this._self, this._then);

  final PolicyFailure _self;
  final $Res Function(PolicyFailure) _then;

/// Create a copy of PolicyState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? failure = null,}) {
  return _then(PolicyFailure(
null == failure ? _self.failure : failure // ignore: cast_nullable_to_non_nullable
as Failure,
  ));
}


}

// dart format on
