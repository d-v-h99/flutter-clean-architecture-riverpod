// alice_service.dart
import 'package:alice/alice.dart';
import 'package:alice/model/alice_configuration.dart';
import 'package:flutter/material.dart';

class AliceService {
  static final navigatorKey = GlobalKey<NavigatorState>();

  static final alice = Alice(
    configuration: AliceConfiguration(
      navigatorKey: navigatorKey,
      showNotification: true,      // muốn có thông báo
      showInspectorOnShake: true,  // lắc để mở (nếu device cho phép)
    ),
  );
}
