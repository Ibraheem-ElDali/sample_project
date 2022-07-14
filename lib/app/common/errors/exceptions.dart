class ServerException implements Exception {
  ServerException(this.code);
  final int code;
}

class OfflineException implements Exception {
  OfflineException(this.message);
  final String message;
}

class CustomException implements Exception {
  CustomException(this.message);
  final String message;
}

class CacheException implements Exception {}
