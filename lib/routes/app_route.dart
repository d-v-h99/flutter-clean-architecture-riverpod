import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import '../features/authentication/presentation/screens/login_screen.dart';
import '../features/dashboard/presentation/screens/dashboard_screen.dart';
import '../features/splash/presentation/screens/splash_screen.dart';
part 'app_route.gr.dart';
// @MaterialAutoRouter(
//   replaceInRouteName: 'Page,Route',
//   routes: [
//     MaterialRoute(page: SplashScreen, initial: true),
//     MaterialRoute(page: LoginScreen, path: LoginScreen.routeName),
//     MaterialRoute(page: DashboardScreen, path: DashboardScreen.routeName),
//   ],
// )

@AutoRouterConfig(replaceInRouteName: 'Screen,Route')
//nếu bạn có SplashScreen thì route được generate thành SplashRoute (tự động đổi hậu tố Screen thành Route).
//AppRouter kế thừa _$AppRouter (class này sinh ra từ file .gr.dart sau khi chạy build runner).
class AppRouter extends _$AppRouter {
// @override
// replaceInRouteName

  @override
  RouteType get defaultRouteType =>
      const RouteType.material(); //.cupertino, .adaptive ..etc
  //MaterialPageRoute (hiệu ứng chuyển trang kiểu Android).
  // Có thể đổi thành .cupertino() (iOS-style) hoặc .adaptive() (tự chọn theo platform).

  @override
  List<AutoRoute> get routes => [
        /// routes go here
        AutoRoute(page: SplashRoute.page, initial: true),//Route splash, mở đầu app. - được generate từ SplashScreen.
        AutoRoute(page: LoginRoute.page),
        AutoRoute(page: DashboardRoute.page),
      ];
}
