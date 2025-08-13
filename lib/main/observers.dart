import 'dart:developer';

import 'package:flutter_riverpod/flutter_riverpod.dart';
// Riverpod ProviderObserver tùy biến để ghi log mọi thay đổi của provider và khi provider bị dispose.ư
//Ghi log mỗi khi giá trị provider thay đổi (didUpdateProvider).
//
// Ghi log khi provider bị hủy (didDisposeProvider).
class Observers extends ProviderObserver {
  //Được Riverpod gọi mỗi lần provider emit giá trị mới.
  @override
  void didUpdateProvider(
    ProviderBase provider,//chính provider thay đổi.
    Object? previousValue,
    Object? newValue,
    ProviderContainer container,
  ) {
    log('''
{
  "provider": "${provider.name ?? provider.runtimeType}",
  "newValue": "$newValue"
}''');
  }

  @override
  void didDisposeProvider(ProviderBase provider, ProviderContainer container) {
    //thường do autoDispose hoặc vòng đời widget).
    log('''
{
  "provider": "${provider.name ?? provider.runtimeType}",
  "newValue": "disposed"
}''');
    super.didDisposeProvider(provider, container);
  }
}
