import 'package:get_storage/get_storage.dart';

class LocalStorageService {
  static final LocalStorageService _instance = LocalStorageService._internal();
  factory LocalStorageService() => _instance;

  late GetStorage _storage;

  LocalStorageService._internal();

  /// Initialize before runApp
  static Future<void> init() async {
    await GetStorage.init();
    _instance._storage = GetStorage();
    print(_instance.read('user'));
  }

  // ✅ Write data
  Future<void> write(String key, dynamic value) async {
    await _storage.write(key, value);
  }

  // ✅ Read data (with optional default value)
  T? read<T>(String key, {T? defaultValue}) {
    return _storage.read<T>(key) ?? defaultValue;
  }

  // ✅ Check if key exists
  bool hasData(String key) {
    return _storage.hasData(key);
  }

  // ✅ Remove specific key
  Future<void> remove(String key) async {
    await _storage.remove(key);
  }

  // ✅ Clear everything
  Future<void> clearAll() async {
    await _storage.erase();
  }
}
