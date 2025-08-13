import 'package:dio/dio.dart';
import 'package:flutter_project/shared/data/remote/dio_network_service.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final networkServiceProvider = Provider<DioNetworkService>(
  (ref) {
    final Dio dio = Dio();
    return DioNetworkService(dio);
  },
);
/* flutter_riverpod thực chất vừa là state management vừa là một Dependency Injection (DI) framework.
DI (Dependency Injection) nghĩa là cung cấp các dependency (service, repository, API client…) từ một nơi trung tâm để các phần khác của app có thể lấy và dùng mà không phải tự tạo.
Riverpod làm DI   qua:

Provider → đóng gói object/service.

ref.read(...) hoặc ref.watch(...) → lấy dependency ở bất kỳ đâu.

Override → thay thế dependency khi test hoặc ở môi trường khác.
|                          | Riverpod                          | GetIt                          |
| ------------------------ | --------------------------------- | ------------------------------ |
| **State management**     | Có tích hợp sẵn                   | Không                          |
| **Override dễ cho test** | Có                                | Có nhưng hơi thủ công          |
| **Type safety**          | Cao, compile-time                 | Cao                            |
| **Lifecycle management** | Có                                | Có, nhưng quản lý thủ công hơn |
| **Provider scope**       | Có thể giới hạn trong một phần UI | Không mặc định                 |

*/