import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_project/main/app.dart';
import 'package:flutter_project/main/app_env.dart';
import 'package:flutter_project/main/observers.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() => mainCommon(AppEnvironment.DEV);

Future<void> mainCommon(AppEnvironment environment) async {
  WidgetsFlutterBinding.ensureInitialized();
  EnvInfo.initialize(environment);
  SystemChrome.setSystemUIOverlayStyle(
    SystemUiOverlayStyle.light.copyWith(
      statusBarColor: Colors.black,
      statusBarBrightness: Brightness.light,
    ),
  );
  runApp(ProviderScope(
    //à gốc của toàn bộ hệ thống Riverpod:
    //
    // Giữ toàn bộ provider state.
    //
    // Cho phép override provider ở cấp gốc (hữu ích khi test).
    observers: [
      Observers(),
    ],
    child: MyApp(),
  ));
}
