import 'dart:async';

import '../constants.dart';

const _defaultInterval = kDefaultPollingInterval;

/// Wraps a [fetcher] in a [Stream] that fires on a periodic [interval].
///
/// The interval is driven by [samplingIntervalSeconds] from the last received
/// [SensorEnvelope]; callers should update it via [updateInterval].
///
/// Errors from [fetcher] are emitted to [errors] and do NOT cancel the loop.
class PollingService<T> {
  PollingService({
    required this._fetcher,
    this._interval = _defaultInterval,
  });

  final Future<T> Function() _fetcher;
  Duration _interval;

  final _controller = StreamController<T>.broadcast();
  final _errorController = StreamController<Object>.broadcast();

  StreamSubscription<void>? _subscription;

  Stream<T> get stream => _controller.stream;
  Stream<Object> get errors => _errorController.stream;

  void start() {
    _subscription?.cancel();
    _subscription = Stream.periodic(_interval).listen((_) => _fetch());
    _fetch(); // emit immediately on start
  }

  void updateInterval(Duration newInterval) {
    if (newInterval == _interval) return;
    _interval = newInterval;
    if (_subscription != null) {
      // restart loop with updated interval
      start();
    }
  }

  void stop() {
    _subscription?.cancel();
    _subscription = null;
  }

  Future<void> _fetch() async {
    try {
      final result = await _fetcher();
      if (!_controller.isClosed) _controller.add(result);
    } catch (e) {
      if (!_errorController.isClosed) _errorController.add(e);
    }
  }

  void dispose() {
    stop();
    _controller.close();
    _errorController.close();
  }
}
