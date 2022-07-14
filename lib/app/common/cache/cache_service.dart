abstract class CacheService {

  Future<void> saveToken(String token);

  Future<String?> getToken();
}
