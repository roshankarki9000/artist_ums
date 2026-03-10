import 'dart:async';

extension DebounceStreamExtension<T> on Stream<T> {
  Stream<T> debounce(Duration duration) {
    return transform(_DebounceStreamTransformer(duration));
  }
}

class _DebounceStreamTransformer<T> extends StreamTransformerBase<T, T> {
  final Duration duration;

  _DebounceStreamTransformer(this.duration);

  @override
  Stream<T> bind(Stream<T> stream) {
    Timer? timer;
    late StreamController<T> controller;
    late StreamSubscription<T> subscription;

    controller = StreamController<T>(
      onListen: () {
        subscription = stream.listen(
          (event) {
            timer?.cancel();
            timer = Timer(duration, () {
              controller.add(event);
            });
          },
          onError: controller.addError,
          onDone: () {
            timer?.cancel();
            controller.close();
          },
        );
      },
      onCancel: () async {
        timer?.cancel();
        await subscription.cancel();
      },
    );

    return controller.stream;
  }
}
