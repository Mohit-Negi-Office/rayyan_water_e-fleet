// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'orders_list_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$OrdersLoad {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is OrdersLoad);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'OrdersLoad()';
}


}

/// @nodoc
class $OrdersLoadCopyWith<$Res>  {
$OrdersLoadCopyWith(OrdersLoad _, $Res Function(OrdersLoad) __);
}


/// Adds pattern-matching-related methods to [OrdersLoad].
extension OrdersLoadPatterns on OrdersLoad {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( OrdersLoading value)?  loading,TResult Function( OrdersLoaded value)?  loaded,TResult Function( OrdersFailure value)?  failure,required TResult orElse(),}){
final _that = this;
switch (_that) {
case OrdersLoading() when loading != null:
return loading(_that);case OrdersLoaded() when loaded != null:
return loaded(_that);case OrdersFailure() when failure != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( OrdersLoading value)  loading,required TResult Function( OrdersLoaded value)  loaded,required TResult Function( OrdersFailure value)  failure,}){
final _that = this;
switch (_that) {
case OrdersLoading():
return loading(_that);case OrdersLoaded():
return loaded(_that);case OrdersFailure():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( OrdersLoading value)?  loading,TResult? Function( OrdersLoaded value)?  loaded,TResult? Function( OrdersFailure value)?  failure,}){
final _that = this;
switch (_that) {
case OrdersLoading() when loading != null:
return loading(_that);case OrdersLoaded() when loaded != null:
return loaded(_that);case OrdersFailure() when failure != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  loading,TResult Function( List<DeliveryOrder> orders)?  loaded,TResult Function( Failure failure)?  failure,required TResult orElse(),}) {final _that = this;
switch (_that) {
case OrdersLoading() when loading != null:
return loading();case OrdersLoaded() when loaded != null:
return loaded(_that.orders);case OrdersFailure() when failure != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  loading,required TResult Function( List<DeliveryOrder> orders)  loaded,required TResult Function( Failure failure)  failure,}) {final _that = this;
switch (_that) {
case OrdersLoading():
return loading();case OrdersLoaded():
return loaded(_that.orders);case OrdersFailure():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  loading,TResult? Function( List<DeliveryOrder> orders)?  loaded,TResult? Function( Failure failure)?  failure,}) {final _that = this;
switch (_that) {
case OrdersLoading() when loading != null:
return loading();case OrdersLoaded() when loaded != null:
return loaded(_that.orders);case OrdersFailure() when failure != null:
return failure(_that.failure);case _:
  return null;

}
}

}

/// @nodoc


class OrdersLoading implements OrdersLoad {
  const OrdersLoading();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is OrdersLoading);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'OrdersLoad.loading()';
}


}




/// @nodoc


class OrdersLoaded implements OrdersLoad {
  const OrdersLoaded(final  List<DeliveryOrder> orders): _orders = orders;
  

 final  List<DeliveryOrder> _orders;
 List<DeliveryOrder> get orders {
  if (_orders is EqualUnmodifiableListView) return _orders;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_orders);
}


/// Create a copy of OrdersLoad
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$OrdersLoadedCopyWith<OrdersLoaded> get copyWith => _$OrdersLoadedCopyWithImpl<OrdersLoaded>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is OrdersLoaded&&const DeepCollectionEquality().equals(other._orders, _orders));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_orders));

@override
String toString() {
  return 'OrdersLoad.loaded(orders: $orders)';
}


}

/// @nodoc
abstract mixin class $OrdersLoadedCopyWith<$Res> implements $OrdersLoadCopyWith<$Res> {
  factory $OrdersLoadedCopyWith(OrdersLoaded value, $Res Function(OrdersLoaded) _then) = _$OrdersLoadedCopyWithImpl;
@useResult
$Res call({
 List<DeliveryOrder> orders
});




}
/// @nodoc
class _$OrdersLoadedCopyWithImpl<$Res>
    implements $OrdersLoadedCopyWith<$Res> {
  _$OrdersLoadedCopyWithImpl(this._self, this._then);

  final OrdersLoaded _self;
  final $Res Function(OrdersLoaded) _then;

/// Create a copy of OrdersLoad
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? orders = null,}) {
  return _then(OrdersLoaded(
null == orders ? _self._orders : orders // ignore: cast_nullable_to_non_nullable
as List<DeliveryOrder>,
  ));
}


}

/// @nodoc


class OrdersFailure implements OrdersLoad {
  const OrdersFailure(this.failure);
  

 final  Failure failure;

/// Create a copy of OrdersLoad
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$OrdersFailureCopyWith<OrdersFailure> get copyWith => _$OrdersFailureCopyWithImpl<OrdersFailure>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is OrdersFailure&&(identical(other.failure, failure) || other.failure == failure));
}


@override
int get hashCode => Object.hash(runtimeType,failure);

@override
String toString() {
  return 'OrdersLoad.failure(failure: $failure)';
}


}

/// @nodoc
abstract mixin class $OrdersFailureCopyWith<$Res> implements $OrdersLoadCopyWith<$Res> {
  factory $OrdersFailureCopyWith(OrdersFailure value, $Res Function(OrdersFailure) _then) = _$OrdersFailureCopyWithImpl;
@useResult
$Res call({
 Failure failure
});




}
/// @nodoc
class _$OrdersFailureCopyWithImpl<$Res>
    implements $OrdersFailureCopyWith<$Res> {
  _$OrdersFailureCopyWithImpl(this._self, this._then);

  final OrdersFailure _self;
  final $Res Function(OrdersFailure) _then;

/// Create a copy of OrdersLoad
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? failure = null,}) {
  return _then(OrdersFailure(
null == failure ? _self.failure : failure // ignore: cast_nullable_to_non_nullable
as Failure,
  ));
}


}

/// @nodoc
mixin _$OrdersListState {

 List<OrderFilter> get filters; OrderFilter get filter; String get query; OrdersLoad get load;
/// Create a copy of OrdersListState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$OrdersListStateCopyWith<OrdersListState> get copyWith => _$OrdersListStateCopyWithImpl<OrdersListState>(this as OrdersListState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is OrdersListState&&const DeepCollectionEquality().equals(other.filters, filters)&&(identical(other.filter, filter) || other.filter == filter)&&(identical(other.query, query) || other.query == query)&&(identical(other.load, load) || other.load == load));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(filters),filter,query,load);

@override
String toString() {
  return 'OrdersListState(filters: $filters, filter: $filter, query: $query, load: $load)';
}


}

/// @nodoc
abstract mixin class $OrdersListStateCopyWith<$Res>  {
  factory $OrdersListStateCopyWith(OrdersListState value, $Res Function(OrdersListState) _then) = _$OrdersListStateCopyWithImpl;
@useResult
$Res call({
 List<OrderFilter> filters, OrderFilter filter, String query, OrdersLoad load
});


$OrdersLoadCopyWith<$Res> get load;

}
/// @nodoc
class _$OrdersListStateCopyWithImpl<$Res>
    implements $OrdersListStateCopyWith<$Res> {
  _$OrdersListStateCopyWithImpl(this._self, this._then);

  final OrdersListState _self;
  final $Res Function(OrdersListState) _then;

/// Create a copy of OrdersListState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? filters = null,Object? filter = null,Object? query = null,Object? load = null,}) {
  return _then(_self.copyWith(
filters: null == filters ? _self.filters : filters // ignore: cast_nullable_to_non_nullable
as List<OrderFilter>,filter: null == filter ? _self.filter : filter // ignore: cast_nullable_to_non_nullable
as OrderFilter,query: null == query ? _self.query : query // ignore: cast_nullable_to_non_nullable
as String,load: null == load ? _self.load : load // ignore: cast_nullable_to_non_nullable
as OrdersLoad,
  ));
}
/// Create a copy of OrdersListState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$OrdersLoadCopyWith<$Res> get load {
  
  return $OrdersLoadCopyWith<$Res>(_self.load, (value) {
    return _then(_self.copyWith(load: value));
  });
}
}


/// Adds pattern-matching-related methods to [OrdersListState].
extension OrdersListStatePatterns on OrdersListState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _OrdersListState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _OrdersListState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _OrdersListState value)  $default,){
final _that = this;
switch (_that) {
case _OrdersListState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _OrdersListState value)?  $default,){
final _that = this;
switch (_that) {
case _OrdersListState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( List<OrderFilter> filters,  OrderFilter filter,  String query,  OrdersLoad load)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _OrdersListState() when $default != null:
return $default(_that.filters,_that.filter,_that.query,_that.load);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( List<OrderFilter> filters,  OrderFilter filter,  String query,  OrdersLoad load)  $default,) {final _that = this;
switch (_that) {
case _OrdersListState():
return $default(_that.filters,_that.filter,_that.query,_that.load);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( List<OrderFilter> filters,  OrderFilter filter,  String query,  OrdersLoad load)?  $default,) {final _that = this;
switch (_that) {
case _OrdersListState() when $default != null:
return $default(_that.filters,_that.filter,_that.query,_that.load);case _:
  return null;

}
}

}

/// @nodoc


class _OrdersListState implements OrdersListState {
  const _OrdersListState({required final  List<OrderFilter> filters, this.filter = OrderFilter.all, this.query = '', this.load = const OrdersLoad.loading()}): _filters = filters;
  

 final  List<OrderFilter> _filters;
@override List<OrderFilter> get filters {
  if (_filters is EqualUnmodifiableListView) return _filters;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_filters);
}

@override@JsonKey() final  OrderFilter filter;
@override@JsonKey() final  String query;
@override@JsonKey() final  OrdersLoad load;

/// Create a copy of OrdersListState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$OrdersListStateCopyWith<_OrdersListState> get copyWith => __$OrdersListStateCopyWithImpl<_OrdersListState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _OrdersListState&&const DeepCollectionEquality().equals(other._filters, _filters)&&(identical(other.filter, filter) || other.filter == filter)&&(identical(other.query, query) || other.query == query)&&(identical(other.load, load) || other.load == load));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_filters),filter,query,load);

@override
String toString() {
  return 'OrdersListState(filters: $filters, filter: $filter, query: $query, load: $load)';
}


}

/// @nodoc
abstract mixin class _$OrdersListStateCopyWith<$Res> implements $OrdersListStateCopyWith<$Res> {
  factory _$OrdersListStateCopyWith(_OrdersListState value, $Res Function(_OrdersListState) _then) = __$OrdersListStateCopyWithImpl;
@override @useResult
$Res call({
 List<OrderFilter> filters, OrderFilter filter, String query, OrdersLoad load
});


@override $OrdersLoadCopyWith<$Res> get load;

}
/// @nodoc
class __$OrdersListStateCopyWithImpl<$Res>
    implements _$OrdersListStateCopyWith<$Res> {
  __$OrdersListStateCopyWithImpl(this._self, this._then);

  final _OrdersListState _self;
  final $Res Function(_OrdersListState) _then;

/// Create a copy of OrdersListState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? filters = null,Object? filter = null,Object? query = null,Object? load = null,}) {
  return _then(_OrdersListState(
filters: null == filters ? _self._filters : filters // ignore: cast_nullable_to_non_nullable
as List<OrderFilter>,filter: null == filter ? _self.filter : filter // ignore: cast_nullable_to_non_nullable
as OrderFilter,query: null == query ? _self.query : query // ignore: cast_nullable_to_non_nullable
as String,load: null == load ? _self.load : load // ignore: cast_nullable_to_non_nullable
as OrdersLoad,
  ));
}

/// Create a copy of OrdersListState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$OrdersLoadCopyWith<$Res> get load {
  
  return $OrdersLoadCopyWith<$Res>(_self.load, (value) {
    return _then(_self.copyWith(load: value));
  });
}
}

// dart format on
