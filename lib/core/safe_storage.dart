import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class SafeStorage {
  late final FlutterSecureStorage _storage;

  SafeStorage() {
    _storage = FlutterSecureStorage();
  }

  Future<Map<String, String>?> getAll() async {
    return await _storage.readAll();
  }

  Future<String?> getValue(String key) async {
    return await _storage.read(key: key);
  }

  Future<void> write(String key, String value) async {
    await _storage.write(key: key, value: value);
  }

  Future<void> delete(String key) async {
    await _storage.delete(key: key);
  }

  Future<void> deleteAll() async {
    await _storage.deleteAll();
  }
}
