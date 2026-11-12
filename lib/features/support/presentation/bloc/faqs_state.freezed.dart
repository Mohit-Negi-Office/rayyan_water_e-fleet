// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'faqs_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$FaqsState {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is FaqsState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'FaqsState()';
}


}

/// @nodoc
class $FaqsStateCopyWith<$Res>  {
$FaqsStateCopyWith(FaqsState _, $Res Function(FaqsState) __);
}


/// Adds pattern-matching-related methods to [FaqsState].
extension FaqsStatePatterns on FaqsState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( FaqsLoading value)?  loading,TResult Function( FaqsLoaded value)?  loaded,TResult Function( FaqsFailure value)?  failure,required TResult orElse(),}){
final _that = this;
switch (_that) {
case FaqsLoading() when loading != null:
return loading(_that);case FaqsLoaded() when loaded != null:
return loaded(_that);case FaqsFailure() when failure != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( FaqsLoading value)  loading,required TResult Function( FaqsLoaded value)  loaded,required TResult Function( FaqsFailure value)  failure,}){
final _that = this;
switch (_that) {
case FaqsLoading():
return loading(_that);case FaqsLoaded():
return loaded(_that);case FaqsFailure():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( FaqsLoading value)?  loading,TResult? Function( FaqsLoaded value)?  loaded,TResult? Function( FaqsFailure value)?  failure,}){
final _that = this;
switch (_that) {
case FaqsLoading() when loading != null:
return loading(_that);case FaqsLoaded() when loaded != null:
return loaded(_that);case FaqsFailure() when failure != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  loading,TResult Function( List<Faq> faqs,  int? expanded)?  loaded,TResult Function( Failure failure)?  failure,required TResult orElse(),}) {final _that = this;
switch (_that) {
case FaqsLoading() when loading != null:
return loading();case FaqsLoaded() when loaded != null:
return loaded(_that.faqs,_that.expanded);case FaqsFailure() when failure != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  loading,required TResult Function( List<Faq> faqs,  int? expanded)  loaded,required TResult Function( Failure failure)  failure,}) {final _that = this;
switch (_that) {
case FaqsLoading():
return loading();case FaqsLoaded():
return loaded(_that.faqs,_that.expanded);case FaqsFailure():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  loading,TResult? Function( List<Faq> faqs,  int? expanded)?  loaded,TResult? Function( Failure failure)?  failure,}) {final _that = this;
switch (_that) {
case FaqsLoading() when loading != null:
return loading();case FaqsLoaded() when loaded != null:
return loaded(_that.faqs,_that.expanded);case FaqsFailure() when failure != null:
return failure(_that.failure);case _:
  return null;

}
}

}

/// @nodoc


class FaqsLoading implements FaqsState {
  const FaqsLoading();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is FaqsLoading);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'FaqsState.loading()';
}


}




/// @nodoc


class FaqsLoaded implements FaqsState {
  const FaqsLoaded(final  List<Faq> faqs, {this.expanded}): _faqs = faqs;
  

 final  List<Faq> _faqs;
 List<Faq> get faqs {
  if (_faqs is EqualUnmodifiableListView) return _faqs;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_faqs);
}

 final  int? expanded;

/// Create a copy of FaqsState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$FaqsLoadedCopyWith<FaqsLoaded> get copyWith => _$FaqsLoadedCopyWithImpl<FaqsLoaded>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is FaqsLoaded&&const DeepCollectionEquality().equals(other._faqs, _faqs)&&(identical(other.expanded, expanded) || other.expanded == expanded));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_faqs),expanded);

@override
String toString() {
  return 'FaqsState.loaded(faqs: $faqs, expanded: $expanded)';
}


}

/// @nodoc
abstract mixin class $FaqsLoadedCopyWith<$Res> implements $FaqsStateCopyWith<$Res> {
  factory $FaqsLoadedCopyWith(FaqsLoaded value, $Res Function(FaqsLoaded) _then) = _$FaqsLoadedCopyWithImpl;
@useResult
$Res call({
 List<Faq> faqs, int? expanded
});




}
/// @nodoc
class _$FaqsLoadedCopyWithImpl<$Res>
    implements $FaqsLoadedCopyWith<$Res> {
  _$FaqsLoadedCopyWithImpl(this._self, this._then);

  final FaqsLoaded _self;
  final $Res Function(FaqsLoaded) _then;

/// Create a copy of FaqsState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? faqs = null,Object? expanded = freezed,}) {
  return _then(FaqsLoaded(
null == faqs ? _self._faqs : faqs // ignore: cast_nullable_to_non_nullable
as List<Faq>,expanded: freezed == expanded ? _self.expanded : expanded // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}


}

/// @nodoc


class FaqsFailure implements FaqsState {
  const FaqsFailure(this.failure);
  

 final  Failure failure;

/// Create a copy of FaqsState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$FaqsFailureCopyWith<FaqsFailure> get copyWith => _$FaqsFailureCopyWithImpl<FaqsFailure>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is FaqsFailure&&(identical(other.failure, failure) || other.failure == failure));
}


@override
int get hashCode => Object.hash(runtimeType,failure);

@override
String toString() {
  return 'FaqsState.failure(failure: $failure)';
}


}

/// @nodoc
abstract mixin class $FaqsFailureCopyWith<$Res> implements $FaqsStateCopyWith<$Res> {
  factory $FaqsFailureCopyWith(FaqsFailure value, $Res Function(FaqsFailure) _then) = _$FaqsFailureCopyWithImpl;
@useResult
$Res call({
 Failure failure
});




}
/// @nodoc
class _$FaqsFailureCopyWithImpl<$Res>
    implements $FaqsFailureCopyWith<$Res> {
  _$FaqsFailureCopyWithImpl(this._self, this._then);

  final FaqsFailure _self;
  final $Res Function(FaqsFailure) _then;

/// Create a copy of FaqsState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? failure = null,}) {
  return _then(FaqsFailure(
null == failure ? _self.failure : failure // ignore: cast_nullable_to_non_nullable
as Failure,
  ));
}


}

// dart format on
