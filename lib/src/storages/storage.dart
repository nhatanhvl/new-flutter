import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class SecuredStorage implements LocalStorage {
  SecuredStorage();

  final FlutterSecureStorage _storage = const FlutterSecureStorage();

  @override
  Future<void> clear() {
    return _storage.deleteAll();
  }

  @override
  Future<void> delete(String key) {
    return _storage.delete(key: key);
  }

  @override
  Future<String?> read(String key) {
    return _storage.read(key: key);
  }

  @override
  Future<void> write(String key, String data) {
    return _storage.write(key: key, value: data);
  }
}

abstract class LocalStorage {
  Future<String?> read(String key);
  Future<void> write(String key, String data);
  Future<void> delete(String key);
  Future<void> clear();
}
