import 'package:dartz/dartz.dart';
import '../../../../common/errors/failures.dart';
import '../../data/models/requests/login_request.dart';

abstract class LoginRepository {
  Future<Either<Failure, bool>> login(LoginRequest request);
}
