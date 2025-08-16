import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_project/features/authentication/presentation/providers/auth_providers.dart';
import 'package:flutter_project/features/authentication/presentation/providers/state/auth_state.dart';
import 'package:flutter_project/features/authentication/presentation/widgets/auth_field.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../routes/app_route.dart';

@RoutePage()
class LoginScreen extends ConsumerWidget {//tương ứng với StatelessWidget
  static const routeName = '/loginScreen';

  LoginScreen({Key? key}) : super(key: key);

  final TextEditingController usernameController =
      TextEditingController(text: 'kminchelle');
  final TextEditingController passwordController =
      TextEditingController(text: '0lelplR');
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(authStateNotifierProvider); //AuthState để render UI (ví dụ show spinner/enable nút).
    ref.listen( //→ không gây rebuild UI, chỉ dùng cho side‑effects:
      authStateNotifierProvider.select((value) => value),
      ((previous, next) {
        //show Snackbar on failure
        if (next is Failure) {
          ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text(next.exception.message.toString())));
        } else if (next is Success) {
          AutoRouter.of(context)
              .pushAndPopUntil(const DashboardRoute(), predicate: (_) => false);
          // viet gon context.router.replaceAll([const DashboardRoute()]);
        }
      }),
    );
    return Scaffold(
      appBar: AppBar(
        title: const Text('TDD with Riverpod'),
      ),
      body: SafeArea(
        child: Column(
          children: [
            AuthField(
              hintText: 'Username',
              controller: usernameController,
            ),
            AuthField(
              hintText: 'Password',
              obscureText: true,
              controller: passwordController,
            ),
            //Khi Loading → spinner.
            //
            // Còn lại → hiện nút “Login”.
            // Freezed map → bắt buộc liệt kê đủ tất cả các case (initial, loading, failure, success).
            //
            // maybeMap → cho phép bạn chỉ xử lý một số case nhất định, còn lại thì fallback qua orElse.
            state.maybeMap(
              loading: (_) => const Center(child: CircularProgressIndicator()),
              orElse: () => loginButton(ref),
            ),
          ],
        ),
      ),
    );
  }

  Widget loginButton(WidgetRef ref) {
    return ElevatedButton(
      onPressed: () {
        // validate email and password
        ref.read(authStateNotifierProvider.notifier).loginUser(
              usernameController.text,
              passwordController.text,
            );
      },
      child: const Text('Login'),
    );
  }
}
