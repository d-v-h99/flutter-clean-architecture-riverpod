import 'dart:async';

import 'package:flutter_project/shared/data/local/storage_service.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefsService implements StorageService {
  SharedPreferences? sharedPreferences;

  final Completer<SharedPreferences> initCompleter =
      Completer<SharedPreferences>(); //initCompleter sẽ giữ một Future<SharedPreferences> mà tất cả các hàm get/set... đều dùng
  //initCompleter là một Completer giữ Future<SharedPreferences>.
  // Nó cho phép bạn gọi .future ở nhiều chỗ mà chỉ cần complete() một lần khi đã có instance.

  @override
  void init() {
    //), bạn hoàn thành (complete) initCompleter bằng SharedPreferences.getInstance() (Future).
    //Lưu ý: Ở đây bạn đang complete với một Future, chứ không phải giá trị SharedPreferences đã resolve → nghĩa là khi await initCompleter.future ở các hàm khác, bạn nhận được một SharedPreferences đã khởi tạo.
    //
    // Nhược điểm: Không gán sharedPreferences ngay, chỉ gán khi .future được await ở hàm khác.
    initCompleter.complete(SharedPreferences.getInstance());
    //bạn hoàn thành Completer bằng một Future trả về từ SharedPreferences.getInstance().
    //
    // Đây hơi đặc biệt: bạn không await mà complete luôn với một Future → nghĩa là initCompleter.future sẽ resolve khi SharedPreferences.getInstance() xong.
  }

  @override
  bool get hasInitialized => sharedPreferences != null;

  @override
  Future<Object?> get(String key) async {
    sharedPreferences = await initCompleter.future;
    return sharedPreferences!.get(key);
  }

  @override
  Future<void> clear() async {
    sharedPreferences = await initCompleter.future;
    await sharedPreferences!.clear();
  }

  @override
  Future<bool> has(String key) async {
    sharedPreferences = await initCompleter.future;
    return sharedPreferences?.containsKey(key) ?? false;
  }

  @override
  Future<bool> remove(String key) async {
    sharedPreferences = await initCompleter.future;
    return await sharedPreferences!.remove(key);
  }

  @override
  Future<bool> set(String key, data) async {
    sharedPreferences = await initCompleter.future;
    return await sharedPreferences!.setString(key, data.toString());
  }
}
/* Khái niệm Completer
Trong Dart, Completer<T> là một "trình điều khiển" (controller) cho một Future<T>.

Future là lời hứa về một giá trị sẽ có trong tương lai.

Completer cho phép bạn tự tạo một Future và tự quyết định khi nào hoàn thành (complete) hoặc báo lỗi (completeError).

Nói cách khác:

Future là "đầu ra" cho người tiêu dùng.

Completer là "đầu vào" cho người sản xuất dữ liệu.

Khi nào dùng Completer
Khi bạn muốn tạo một Future nhưng chưa biết khi nào hoặc ở đâu nó sẽ hoàn thành.

Khi kết quả đến từ một callback (event) và bạn muốn biến callback thành Future.

Khi muốn nhiều nơi cùng đợi chung một kết quả khởi tạo (lazy init).
Đảm bảo tất cả các phương thức get, set, remove... chỉ chạy khi SharedPreferences đã khởi tạo.

Nhiều hàm gọi await initCompleter.future vẫn dùng chung một quá trình khởi tạo → tránh gọi SharedPreferences.getInstance() nhiều lần.*/