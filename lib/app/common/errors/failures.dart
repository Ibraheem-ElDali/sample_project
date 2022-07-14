abstract class Failure {
  Failure({this.code,this.message});
  final String? message;
  final int? code;
}

class ServerFailure extends Failure {}

class CacheFailure extends Failure {}

// code => 500
class InternalServerErrorFailure extends Failure {
  InternalServerErrorFailure({String? msg}) : super(message: msg);
}

// code => 400
class BadRequestFailure extends Failure {
  BadRequestFailure({String? msg}) : super(message: msg);
}

// code => 401
class UnauthorizedFailure extends Failure {
  UnauthorizedFailure({String? msg}) : super(message: msg);
}

// code => 404
class NotFoundFailure extends Failure {
  NotFoundFailure({String? msg}) : super(message: msg);
}

// code 405
class MethodNotAllowedFailure extends Failure {
  MethodNotAllowedFailure({String? msg}) : super(message: msg);
}

// code 408
class ConnectionTimeoutFailure extends Failure {
  ConnectionTimeoutFailure({String? msg}) : super(message: msg);
}

// socketFailure
class NoInternetConnectionFailure extends Failure {
  NoInternetConnectionFailure({String? msg}) : super(message: msg);
}

// HttpFailure
class HttpFailure extends Failure {
  HttpFailure({String? msg}) : super(message: msg);
}

// HttpFailure
class RequestCanceledFailure extends Failure {
  RequestCanceledFailure({String? msg}) : super(message: msg);
}

// FormatFailure
class FormatFailure extends Failure {
  FormatFailure({String? msg}) : super(message: msg);
}

// UnknownFailure
class UnknownFailure extends Failure {
  UnknownFailure({String? msg}) : super(message: msg);
}

// Need to logout user
class LogoutFailure extends Failure {
  LogoutFailure({String? msg}) : super(message: msg);
}

class CustomFailure extends Failure {
  CustomFailure({String? msg}) : super(message: msg);
}

class OfflineFailure extends Failure {
  OfflineFailure({String? msg}) : super(message: msg);
}

class EncryptionFailure extends Failure {
  EncryptionFailure({this.data}) : super(message: data.toString());
  final dynamic data;
}
