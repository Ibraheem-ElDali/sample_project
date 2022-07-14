import 'dart:io';

class RequestData {

  RequestData({this.headers, this.contentType, this.requestParameters});

  final Map<String, dynamic>? headers;
  final Map<String, dynamic>? requestParameters;
  final ContentType? contentType;
}
