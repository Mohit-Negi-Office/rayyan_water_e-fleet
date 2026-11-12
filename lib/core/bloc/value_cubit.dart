import 'package:flutter_bloc/flutter_bloc.dart';

/// Holds one value a sheet is choosing ("Deliver Until", "Delivery Slot",
/// a date range) until it is confirmed. Created by the sheet; not in DI.
class ValueCubit<T> extends Cubit<T> {
  ValueCubit(super.initial);

  void set(T value) => emit(value);
}
