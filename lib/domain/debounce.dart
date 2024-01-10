import 'dart:async';

class Debounce {
  final Duration duration;
  Timer? timer;

  Debounce(this.duration);

  void onEvent(void Function() callback) {
    if (timer?.isActive ?? false) {
      timer?.cancel();
    }
    timer = Timer(duration, () => callback());
  }
}