import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import '../models/requests/request_data.dart';
import 'http_helper.dart';
import 'http_service.dart';

class HttpServiceImpl implements HttpService {
  HttpServiceImpl() {
    dio.options = HttpHelper.options();
    dio.interceptors.add(HttpHelper.buildInterceptor());
    if (kDebugMode) {
      dio.interceptors.add(HttpHelper.getPrettyDioLogger());
    }
  }
  Dio dio = Dio();

  @override
  Future<Response> get(String url, {RequestData? requestData}) async {
    handleCustomRequestData(requestData);
    Response response = await dio.get(url);
    return response;
  }

  @override
  Future<Response> post(String url, requestBody,
      {RequestData? requestData}) async {
    handleCustomRequestData(requestData);
    Response response = await dio.post(url, data: requestBody);
    return response;
  }

  @override
  Future<Response> delete(String url, {RequestData? requestData}) async {
    handleCustomRequestData(requestData);
    Response response = await dio.delete(url);
    return response;
  }

  @override
  Future<Response> put(String url, Map<String, dynamic> requestBody,
      {RequestData? requestData}) async {
    handleCustomRequestData(requestData);
    Response response = await dio.put(url, data: requestBody);
    return response;
  }

  @override
  Future<Response> patch(String url, Map<String, dynamic> requestBody,
      {RequestData? requestData}) async {
    handleCustomRequestData(requestData);
    Response response = await dio.patch(url, data: requestBody);
    return response;
  }

  @override
  Future<Response> postWithFile(String url, requestBody,
      {RequestData? requestData}) async {
    handleCustomRequestData(requestData);
    Response response =
        await dio.post(url, data: FormData.fromMap(requestBody));
    return response;
  }

  @override
  Future<Response> retry(RequestOptions requestOptions) async {
    final options = Options(
      method: requestOptions.method,
      headers: requestOptions.headers,
    );

    return dio.request<dynamic>(
      requestOptions.path,
      data: requestOptions.data,
      queryParameters: requestOptions.queryParameters,
      options: options,
    );
  }

  void handleCustomRequestData(RequestData? requestData) {
    if (requestData == null) return;
    if (requestData.headers != null && requestData.headers!.isNotEmpty) {
      dio.options.headers.addAll(requestData.headers!);
    }
    if (requestData.contentType != null) {
      dio.options.contentType = requestData.contentType.toString();
    }
  }
}
