import 'dart:async';

import 'package:bloc/bloc.dart';

/// Waits until events stop arriving for [duration], then handles only the
/// latest one (search-as-you-type).
EventTransformer<E> debounce<E>(Duration duration) {
  return (events, mapper) =>
      events.transform(_Debounce<E>(duration)).asyncExpand(mapper);
}

class _Debounce<E> extends StreamTransformerBase<E, E> {
  const _Debounce(this.duration);

  final Duration duration;

  @override
  Stream<E> bind(Stream<E> stream) {
    Timer? timer;
    late final StreamController<E> controller;
    StreamSubscription<E>? subscription;
    controller = StreamController<E>(
      onListen: () {
        subscription = stream.listen(
          (event) {
            timer?.cancel();
            timer = Timer(duration, () => controller.add(event));
          },
          onError: controller.addError,
          onDone: () {
            timer?.cancel();
            controller.close();
          },
        );
      },
      onCancel: () {
        timer?.cancel();
        return subscription?.cancel();
      },
    );
    return controller.stream;
  }
}
