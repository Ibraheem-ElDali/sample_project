import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import '../constants/storage_keys.dart';
import 'cache_service.dart';

class CacheServiceImpl implements CacheService {
  CacheServiceImpl(this.storage) {
    getToken();
  }

  final FlutterSecureStorage storage;

  @override
  Future<void> saveToken(String token) async {
    await storage.write(key: StorageKeys.token, value: token);
  }

  @override
  Future<String?> getToken() async {
    return (await storage.read(key: StorageKeys.token)) ?? '';
  }
}
