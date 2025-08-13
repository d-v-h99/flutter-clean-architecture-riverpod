import 'package:flutter_project/shared/data/local/shared_prefs_storage_service.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final storageServiceProvider = Provider((ref) {
  final SharedPrefsService prefsService = SharedPrefsService();
  prefsService.init();
  return prefsService;
});
/*Provider không reactive (loại cơ bản trong Riverpod)
* nó không tự rebuild khi giá trị bên trong thay đổi, và cũng không theo dõi state — nó chỉ đơn thuần cung cấp một dependency cố định (giống như một singleton được Riverpod quản lý vòng đời).
* | Loại Provider                                    | Reactive? | Dùng để...                                                                                          |
| ------------------------------------------------ | --------- | --------------------------------------------------------------------------------------------------- |
| **Provider**                                     | ❌ Không   | Inject dependency tĩnh (service, repository, config...). Không rebuild khi data bên trong thay đổi. |
| **StateProvider**                                | ✅ Có      | Lưu state đơn giản (biến có thể set/get, trigger rebuild).                                          |
| **FutureProvider**                               | ✅ Có      | Cung cấp giá trị từ async Future, tự rebuild khi future thay đổi.                                   |
| **StreamProvider**                               | ✅ Có      | Lắng nghe stream, rebuild khi có dữ liệu mới.                                                       |
| **NotifierProvider** / **StateNotifierProvider** | ✅ Có      | Quản lý state phức tạp qua class Notifier hoặc StateNotifier.                                       |

Lần đầu ref.read(apiServiceProvider) → Provider tạo ra instance.

Sau đó, dù object bên trong thay đổi field, UI không rebuild vì Provider này không lắng nghe sự thay đổi đó.

Nó chỉ tạo lại khi bạn override hoặc khi ProviderScope được rebuild toàn bộ.

| Provider Type             | Dùng khi…                                                        |
| ------------------------- | ---------------------------------------------------------------- |
| **Provider**              | Inject dependency (Dio, Repository…) — không reactive.           |
| **StateProvider**         | Biến đơn giản (`bool isLoading`, `int counter`).                 |
| **FutureProvider**        | Giá trị từ API/Future (chỉ cần load + hiển thị).                 |
| **StreamProvider**        | Lắng nghe stream (socket, firestore…).                           |
| **StateNotifierProvider** | State phức tạp, nhiều field, nhiều logic (giống ViewModel/BLoC). |

*/