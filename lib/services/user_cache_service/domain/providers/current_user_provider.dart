import 'package:flutter_project/services/user_cache_service/domain/providers/user_cache_provider.dart';
import 'package:flutter_project/shared/domain/models/models.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// khai báo một provider bất đồng bộ, trả về AsyncValue<User?>. Bên trong chạy 1 Future để lấy user hiện tại.
final currentUserProvider = FutureProvider<User?>((ref) async {
  final repository = ref.watch(userLocalRepositoryProvider); //lấy UserRepository đã cấu hình (ở provider trước đó). watch giúp UI tự rebuild khi repository thay đổi (hiếm khi đổi, nhưng đúng “chuẩn” DI của Riverpod).
  final eitherType = (await repository.fetchUser()); //hàm domain trả về kết quả kiểu Either<Failure, User> (đoán theo tên biến eitherType).

  return eitherType.fold((l) => null, (r) => r);
  // chuyển Either thành User?:
  // Nếu Left (lỗi) → trả về null
  // Nếu Right (thành công) → trả về User
});
