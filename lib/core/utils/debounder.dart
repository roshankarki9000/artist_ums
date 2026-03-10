import 'dart:async';

class Debouncer {
  final Duration delay;
  Timer? _timer;

  Debouncer({required this.delay});

  factory Debouncer.short() =>
      Debouncer(delay: const Duration(milliseconds: 300));

  factory Debouncer.medium() =>
      Debouncer(delay: const Duration(milliseconds: 600));

  factory Debouncer.long() => Debouncer(delay: const Duration(seconds: 1));

  void call(void Function() action) {
    _timer?.cancel();
    _timer = Timer(delay, action);
  }

  void callAsync(Future<void> Function() action) {
    _timer?.cancel();
    _timer = Timer(delay, () async {
      await action();
    });
  }

  void cancel() => _timer?.cancel();

  void dispose() {
    _timer?.cancel();
    _timer = null;
  }

  bool get isActive => _timer?.isActive ?? false;
}
