import 'package:flutter/material.dart';
import 'package:flutter_project/shared/theme/app_theme.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../routes/app_route.dart';

class MyApp extends ConsumerWidget {
  //Dùng Riverpod nên kế thừa ConsumerWidget để có WidgetRef ref – từ đó watch/read các provider.
  MyApp({super.key});

  final appRouter = AppRouter();//o router cho toàn app (kiểu này thường là auto_route).
  //dùng API Router hiện đại của Flutter.
  //
  // routeInformationParser: appRouter.defaultRouteParser()
  // Chuyển đổi URL → thông tin route (deep link, web URL).
  //
  // routerDelegate: appRouter.delegate()
  // Xử lý stack điều hướng thực tế (đẩy/push, pop…).

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final themeMode = ref.watch(appThemeProvider);
    //biến thể của MaterialApp dùng Router API (Navigator 2.0).
    // Bạn không dùng home, routes, onGenerateRoute nữa; thay vào đó cấu hình bằng cặp
    // routeInformationParser + routerDelegate (và tùy chọn routeInformationProvider).
    // Ưu điểm: điều hướng khai báo, hỗ trợ deep link/web URL tốt hơn, nested routes mượt.
    return MaterialApp.router(
      title: 'Flutter TDD',
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      themeMode: themeMode,
      //Với auto_route, defaultRouteParser() nhận RouteInformation (chuỗi URL + state từ hệ điều hành/trình duyệt) và parse thành cấu hình route (stack các PageRouteInfo).
      //
      // Công dụng:
      //
      // Hỗ trợ deep link: ví dụ mở trực tiếp myapp://profile/123 hay /profile/123 trên web.
      //
      // Đọc query params (/search?q=abc&page=2) và ghép vào route arguments nếu bạn cấu hình.
      //
      // Kết hợp nested routes để khởi tạo đúng stack ban đầu.
      routeInformationParser: appRouter.defaultRouteParser(),
      //Trái tim của Navigator 2.0: lắng nghe trạng thái điều hướng và xây Navigator.pages (stack trang) tương ứng.
      //
      // Với auto_route:
      //
      // Bạn điều hướng bằng context.router.push(MyRoute(id: 123));, replace, popUntil, v.v.
      //
      // Delegate quản lý back stack, back button, transition, route guards (nếu có)…
      //
      // Delegate là một Listenable/ChangeNotifier: khi bạn push/pop, nó thông báo Flutter để rebuild stack trang.
      //
      // Khi dùng MaterialApp.router, đừng set home, routes, onGenerateRoute—chúng bị bỏ qua trong constructor này.
      routerDelegate: appRouter.delegate(),
      debugShowCheckedModeBanner: false,
    );
  }
}
