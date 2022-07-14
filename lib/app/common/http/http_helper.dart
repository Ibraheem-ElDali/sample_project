import 'package:dio/dio.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import '../constants/api_routes.dart';
import '../constants/locators.dart';
import '../errors/failures.dart';

class HttpHelper {
  static const int connectTimeout = 40000,
      receiveTimeout = 40000,
      sendTimeout = 40000;

  static BaseOptions options() {
    return BaseOptions(
      receiveTimeout: receiveTimeout,
      sendTimeout: sendTimeout,
      connectTimeout: connectTimeout,
      baseUrl: ApiRoutes.baseUrl,
      followRedirects: false,
      validateStatus: (status) {
        return status! <= 500;
      },
    );
  }

  static InterceptorsWrapper buildInterceptor() {
    return InterceptorsWrapper(
      onRequest: onRequest,
      onResponse: onResponse,
    );
  }

  static void onRequest(
      RequestOptions options, RequestInterceptorHandler handler) async {
    try {
      var token = await _getToken();
      options.headers.addAll({
        'Authorization': 'Bearer $token',
        'content-type': 'application/json',
        'Accept': 'application/json',
      });
    } finally {
      handler.next(options);
    }
  }

  static void onResponse(
      Response response, ResponseInterceptorHandler handler) {
    handler.next(response); //continue
  }

  static PrettyDioLogger getPrettyDioLogger() {
    return PrettyDioLogger(
      requestHeader: true,
      requestBody: true,
      responseBody: true,
      responseHeader: false,
      error: true,
      compact: true,
      maxWidth: 90,
      request: true,
    );
  }

  static Failure handleStatusCodeResponse(int statusCode) {
    switch (statusCode) {
      case 500:
        return InternalServerErrorFailure(msg: 'Server error');
      case 400:
        return BadRequestFailure(msg: 'Bad request');
      case 401:
        return UnauthorizedFailure(msg: 'unAuthorized');
      case 404:
        return NotFoundFailure(msg: 'Not found');
      case 405:
        return MethodNotAllowedFailure(msg: 'Method not allowed');
      case 408:
        return ConnectionTimeoutFailure(msg: 'Request timeout');
      default:
        return NoInternetConnectionFailure(msg: 'No internet connection');
    }
  }

  static Future<String> _getToken() async {
    return await Locators.cache.getToken() ?? '';
  }

  static Future<bool> refreshToken() {
    return Future.value(true);
  }
}
