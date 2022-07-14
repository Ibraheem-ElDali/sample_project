import 'package:dio/dio.dart';
import '../../../../common/constants/api_routes.dart';
import '../../../../common/errors/exceptions.dart';
import '../../../../common/http/http_service_impl.dart';
import '../models/requests/login_request.dart';

class LoginRemoteDataSource extends HttpServiceImpl {
  Future<Map<String, dynamic>> login(LoginRequest request) async {
    Response response = await post(ApiRoutes.login, request.toJson());
    if (response.statusCode == 200) {
      return response.data;
    } else {
      throw ServerException(response.statusCode!);
    }
  }
}
