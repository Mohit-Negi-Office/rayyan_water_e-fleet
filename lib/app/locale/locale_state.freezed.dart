// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'locale_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$LocaleState {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LocaleState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'LocaleState()';
}


}

/// @nodoc
class $LocaleStateCopyWith<$Res>  {
$LocaleStateCopyWith(LocaleState _, $Res Function(LocaleState) __);
}


/// Adds pattern-matching-related methods to [LocaleState].
extension LocaleStatePatterns on LocaleState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( LocaleUnset value)?  unset,TResult Function( LocaleSelected value)?  selected,required TResult orElse(),}){
final _that = this;
switch (_that) {
case LocaleUnset() when unset != null:
return unset(_that);case LocaleSelected() when selected != null:
return selected(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( LocaleUnset value)  unset,required TResult Function( LocaleSelected value)  selected,}){
final _that = this;
switch (_that) {
case LocaleUnset():
return unset(_that);case LocaleSelected():
return selected(_that);}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( LocaleUnset value)?  unset,TResult? Function( LocaleSelected value)?  selected,}){
final _that = this;
switch (_that) {
case LocaleUnset() when unset != null:
return unset(_that);case LocaleSelected() when selected != null:
return selected(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  unset,TResult Function( AppLanguage language)?  selected,required TResult orElse(),}) {final _that = this;
switch (_that) {
case LocaleUnset() when unset != null:
return unset();case LocaleSelected() when selected != null:
return selected(_that.language);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  unset,required TResult Function( AppLanguage language)  selected,}) {final _that = this;
switch (_that) {
case LocaleUnset():
return unset();case LocaleSelected():
return selected(_that.language);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  unset,TResult? Function( AppLanguage language)?  selected,}) {final _that = this;
switch (_that) {
case LocaleUnset() when unset != null:
return unset();case LocaleSelected() when selected != null:
return selected(_that.language);case _:
  return null;

}
}

}

/// @nodoc


class LocaleUnset implements LocaleState {
  const LocaleUnset();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LocaleUnset);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'LocaleState.unset()';
}


}




/// @nodoc


class LocaleSelected implements LocaleState {
  const LocaleSelected(this.language);
  

 final  AppLanguage language;

/// Create a copy of LocaleState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$LocaleSelectedCopyWith<LocaleSelected> get copyWith => _$LocaleSelectedCopyWithImpl<LocaleSelected>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LocaleSelected&&(identical(other.language, language) || other.language == language));
}


@override
int get hashCode => Object.hash(runtimeType,language);

@override
String toString() {
  return 'LocaleState.selected(language: $language)';
}


}

/// @nodoc
abstract mixin class $LocaleSelectedCopyWith<$Res> implements $LocaleStateCopyWith<$Res> {
  factory $LocaleSelectedCopyWith(LocaleSelected value, $Res Function(LocaleSelected) _then) = _$LocaleSelectedCopyWithImpl;
@useResult
$Res call({
 AppLanguage language
});




}
/// @nodoc
class _$LocaleSelectedCopyWithImpl<$Res>
    implements $LocaleSelectedCopyWith<$Res> {
  _$LocaleSelectedCopyWithImpl(this._self, this._then);

  final LocaleSelected _self;
  final $Res Function(LocaleSelected) _then;

/// Create a copy of LocaleState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? language = null,}) {
  return _then(LocaleSelected(
null == language ? _self.language : language // ignore: cast_nullable_to_non_nullable
as AppLanguage,
  ));
}


}

// dart format on
