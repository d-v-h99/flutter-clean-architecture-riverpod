import 'package:alice_dio/alice_dio_adapter.dart';
import 'package:flutter/foundation.dart';

class CountingAliceAdapter extends AliceDioAdapter {
  final ValueNotifier<int> counter;

  CountingAliceAdapter(this.counter);

  @override
  void onResponse(response, handler) {
    counter.value++;
    super.onResponse(response, handler);
  }

  @override
  void onError(err, handler) {
    counter.value++;
    super.onError(err, handler);
  }
}
