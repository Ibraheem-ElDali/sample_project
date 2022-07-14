import 'package:dartz/dartz.dart';
import '../../../../common/constants/locators.dart';
import '../../../../common/errors/exceptions.dart';
import '../../../../common/errors/failures.dart';
import '../../../../common/http/http_helper.dart';
import '../../../../common/http/http_service_impl.dart';
import '../../../../common/styles/app_labels.dart';
import '../../domain/repository/login_repository.dart';
import '../datasources/remote_data_source.dart';
import '../models/requests/login_request.dart';

class LoginRepositoryImpl extends HttpServiceImpl implements LoginRepository {
  LoginRepositoryImpl(this.remoteDataSource);
  final LoginRemoteDataSource remoteDataSource;

  @override
  Future<Either<Failure, bool>> login(LoginRequest request) async {
    if (await Locators.network.isConnected) {
      try {
        final body = await remoteDataSource.login(request);
        Locators.cache.saveToken(body['result']['token']);
        return const Right(true);
      } on ServerException catch (error) {
        var failure = HttpHelper.handleStatusCodeResponse(error.code);
        return Left(failure);
      }
    } else {
      var failure = NoInternetConnectionFailure(msg: AppLabel.noConnection);
      return Left(failure);
    }
  }
}
