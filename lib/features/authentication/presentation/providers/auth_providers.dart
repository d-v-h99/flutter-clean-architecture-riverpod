import 'package:flutter_project/features/authentication/domain/providers/login_provider.dart';
import 'package:flutter_project/features/authentication/domain/repositories/auth_repository.dart';
import 'package:flutter_project/features/authentication/presentation/providers/state/auth_notifier.dart';
import 'package:flutter_project/features/authentication/presentation/providers/state/auth_state.dart';
import 'package:flutter_project/services/user_cache_service/domain/providers/user_cache_provider.dart';
import 'package:flutter_project/services/user_cache_service/domain/repositories/user_cache_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
//StateNotifierProvider của Riverpod:
// Notifier: AuthNotifier (class quản lý logic đăng nhập/đăng xuất).
// State: AuthState (union/sealed state: Initial, Loading, Failure, Success, …).
final authStateNotifierProvider =
    StateNotifierProvider<AuthNotifier, AuthState>(
  (ref) {
    //Lấy 2 dependency:
    // authRepositoryProvider → trả AuthenticationRepository
    // userLocalRepositoryProvider → trả UserRepository (cache local)
    // Khởi tạo AuthNotifier(authRepository, userRepository).
    final AuthenticationRepository authenticationRepository =
        ref.watch(authRepositoryProvider);
    final UserRepository userRepository =
        ref.watch(userLocalRepositoryProvider);
    return AuthNotifier(
      authRepository: authenticationRepository,
      userRepository: userRepository,
    );
  },
);
/*
StateNotifierProvider là một loại provider trong Riverpod dùng để:

Quản lý state bất biến (immutable state).

Chứa logic cập nhật state bên trong một class StateNotifier.

Giúp tách biệt UI và business logic.
UI  <-->  StateNotifierProvider  <-->  StateNotifier  <-->  State
 Các thành phần
StateNotifier<T>

Class generic (T là kiểu state).

Quản lý state hiện tại qua biến state.

Cập nhật state bằng cách gán state = ....

StateNotifierProvider<Notifier, State>

Kết nối StateNotifier với UI.

Cho phép UI:

Xem state qua ref.watch(...).

Gọi hàm trong Notifier qua .notifier.
 */