import 'package:flutter_project/services/user_cache_service/data/datasource/user_local_datasource.dart';
import 'package:flutter_project/services/user_cache_service/data/repositories/user_repository_impl.dart';
import 'package:flutter_project/services/user_cache_service/domain/repositories/user_cache_repository.dart';
import 'package:flutter_project/shared/data/local/storage_service.dart';
import 'package:flutter_project/shared/domain/providers/shared_preferences_storage_service_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

//Cho phép bạn tạo provider mà có tham số truyền vào khi gọi .watch() hoặc .read().
// Ở đây tham số là StorageService.
final userDatasourceProvider = Provider.family<UserDataSource, StorageService>(
  (_, networkService) => UserLocalDatasource(networkService),
);
//Provider.family<UserDataSource, StorageService>
//
// UserDataSource là kiểu giá trị trả về.
//
// StorageService là kiểu tham số cần truyền vào khi gọi provider này.
//
// _ (thay vì ref) vì trong body provider này không dùng đến ref của Riverpod.
//
// networkService thực chất là giá trị tham số mà bạn truyền khi gọi ref.watch(userDatasourceProvider(storageService)).


// provider không có tham số (Provider<UserRepository>).
final userLocalRepositoryProvider = Provider<UserRepository>((ref) {
  final storageService = ref.watch(storageServiceProvider); //Lấy ra một instance StorageService từ storageServiceProvider (provider này định nghĩa ở nơi khác, có thể wrap SharedPreferences hoặc SQLite).

  final datasource = ref.watch(userDatasourceProvider(storageService)); //Gọi userDatasourceProvider ở trên và truyền storageService vào → nhận được UserLocalDatasource.

  final repository = UserRepositoryImpl(datasource);

  return repository;
});
/*UI / Logic Layer
      ↓
UserRepository (interface)
      ↓
UserRepositoryImpl (implementation)
      ↓
UserDataSource (local data)
      ↓
StorageService (shared_preferences hoặc storage khác)

 Provider bình thường
Với Riverpod, một Provider<T> sẽ tạo ra và quản lý một instance kiểu T duy nhất (theo scope của ProviderScope).
final configProvider = Provider<Config>((ref) {                -> khi gọi final config = ref.watch(configProvider);
  return Config(env: "prod");                                   ->  Luôn trả về cùng một Config.
});
Provider.family là một dạng đặc biệt của Provider cho phép bạn truyền tham số khi gọi .watch() hoặc .read().
Điểm khác biệt:
Provider → chỉ định nghĩa một instance duy nhất cho kiểu dữ liệu đó.
Provider.family → có thể tạo ra nhiều instance khác nhau tùy theo tham số truyền vào.

final myProvider = Provider.family<ReturnType, ParamType>(
  (ref, param) {
    // param chính là giá trị bạn truyền vào khi gọi ref.watch()
    return ReturnType(param);
  },
);
final obj1 = ref.watch(myProvider(paramA)); // tạo instance dựa trên paramA
final obj2 = ref.watch(myProvider(paramB)); // tạo instance dựa trên paramB

 */