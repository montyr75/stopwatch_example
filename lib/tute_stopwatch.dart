import 'dart:html';
import 'dart:async';
import 'package:polymer/polymer.dart';

@CustomTag('tute-stopwatch')
class TuteStopwatch extends PolymerElement {

  static const CLASS_NAME = "TuteStopwatch";

  @observable String counter = "00:00";
  @observable bool watchRunning = false;

  Stopwatch _watch = new Stopwatch();
  Timer _timer;

  TuteStopwatch.created() : super.created();

  @override void attached() {
    super.attached();
    print("$CLASS_NAME::attached()");
  }

  @override void detached() {
    super.detached();

    _cancelTimer();
  }

  void start(Event e, var detail, Node target) {
    _watch.start();
    _timer = new Timer.periodic(new Duration(seconds: 1), _updateTime);
    watchRunning = true;
  }

  void stop([Event e, var detail, Node target]) {
    _watch.stop();
    _cancelTimer();
    watchRunning = false;
  }

  void reset(Event e, var detail, Node target) {
    _watch.reset();
    counter = '00:00';
    stop();
  }

  void _updateTime(Timer timer) {
    // The operator ~/ divides and returns an integer.
    int s = _watch.elapsedMilliseconds ~/ 1000;
    int m = 0;

    if (s >= 60) {
      m = s ~/ 60;
      s = s % 60;
    }

    String minute = (m <= 9) ? "0$m" : "$m";
    String second = (s <= 9) ? "0$s" : "$s";
    counter = "$minute:$second";
  }

  void _cancelTimer() {
    if (_timer != null) {
      _timer.cancel();
    }
  }
}
