import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_project/features/splash/presentation/providers/splash_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../routes/app_route.dart';

@RoutePage() //Annotation của AutoRoute, dùng để tạo route cho SplashScreen khi build file routes.
class SplashScreen extends ConsumerStatefulWidget { //Giống StatefulWidget nhưng hỗ trợ truy cập ref để đọc Riverpod providers trực tiếp trong widget.
  static const String routeName = '/splashScreen';
  const SplashScreen({Key? key}) : super(key: key);

  @override
  ConsumerState<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends ConsumerState<SplashScreen> {
  final AppRouter appRouter = AppRouter();
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 2), () async {
      final isUserLoggedIn = await ref.read(userLoginCheckProvider.future);
      final route = isUserLoggedIn
          ? const DashboardRoute()
          : LoginRoute() as PageRouteInfo;
      // ignore: use_build_context_synchronously
      AutoRouter.of(context).pushAndPopUntil( //Điều hướng sang route mới và xoá hết stack trước đó
        route,
        predicate: (_) => false, //nghĩa là không giữ lại bất kỳ page nào trước).
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: const Center(
        child: Text(
          'Splash Screen',
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.w600,
            fontSize: 18.0,
          ),
        ),
      ),
    );
  }
}
