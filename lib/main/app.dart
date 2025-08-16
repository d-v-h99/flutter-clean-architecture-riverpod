import 'package:flutter/material.dart';
import 'package:flutter_project/shared/theme/app_theme.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../alice_button.dart';
import '../alice_service.dart';
import '../routes/app_route.dart';
import '../shared/domain/providers/dio_network_service_provider.dart';

// Ngoài class, chỉ tạo 1 lần!
final appRouter = AppRouter(navigatorKey: AliceService.navigatorKey);

class MyApp extends ConsumerWidget {
  //Dùng Riverpod nên kế thừa ConsumerWidget để có WidgetRef ref – từ đó watch/read các provider.
  MyApp({super.key});

  // final appRouter = AppRouter( navigatorKey: AliceService.navigatorKey,);//o router cho toàn app (kiểu này thường là auto_route).
  //dùng API Router hiện đại của Flutter.
  //
  // routeInformationParser: appRouter.defaultRouteParser()
  // Chuyển đổi URL → thông tin route (deep link, web URL).
  //
  // routerDelegate: appRouter.delegate()
  // Xử lý stack điều hướng thực tế (đẩy/push, pop…).

  //navigatorKey là cách để bạn truy cập và điều khiển Navigator (điều hướng) ở bất kỳ đâu trong app Flutter, mà không cần phải có context.
  // Nó được dùng để:
  // Push, pop, show dialog... ở bất kỳ đâu, kể cả trong service, controller, hoặc background code.
  // Đặc biệt hữu ích cho các package/phần mềm giám sát request như Alice, hoặc các toast/dialog global, v.v.
  //Trong Flutter, mỗi Navigator (hệ thống quản lý stack trang/màn hình) đều có thể gán một GlobalKey<NavigatorState>.
  //ể dùng navigatorKey.currentState để gọi:
  // push()
  // pop()
  // showDialog()
  // ... mà không cần context.

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
      // MyApp build(...)
      builder: (context, child) {
        // Toạ độ ban đầu (right=16, bottom=100)
        final pos = ValueNotifier<Offset>(const Offset(16, 100));

        return Stack(
          children: [
            if (child != null) child,

            Overlay(
              initialEntries: [
                OverlayEntry(
                  builder: (ctx) {
                    final size = MediaQuery.of(ctx).size;
                    final bottomSafe = MediaQuery.of(ctx).padding.bottom;

                    return ValueListenableBuilder<Offset>(
                      valueListenable: pos,
                      builder: (_, offset, __) {
                        // Clamp toạ độ trong màn hình
                        final right = offset.dx.clamp(12.0, size.width - 72.0);
                        final bottom = (offset.dy + bottomSafe)
                            .clamp(12.0, size.height - (72.0 + bottomSafe));

                        return Positioned(
                          right: right,
                          bottom: bottom,
                          child: AliceFloatingButton(
                            counter: requestCounter,
                            onDragEnd: (globalOffset) {
                              // Chuyển global top-left → right/bottom tương đối
                              // 56 = kích thước mặc định FAB (mini ~40, thường ~56)
                              const bubbleSize = 56.0;
                              final newRight = (size.width - globalOffset.dx - bubbleSize);
                              final newBottom = (size.height - globalOffset.dy - bubbleSize - bottomSafe);
                              pos.value = Offset(newRight, newBottom);
                            },
                          ),
                        );
                      },
                    );
                  },
                ),
              ],
            ),
          ],
        );
      },

    );
  }
}
