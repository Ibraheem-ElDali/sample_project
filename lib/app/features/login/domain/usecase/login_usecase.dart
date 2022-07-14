import 'package:dartz/dartz.dart';
import '../../../../common/errors/failures.dart';
import '../../data/models/requests/login_request.dart';
import '../repository/login_repository.dart';

class LoginUseCase {
  LoginUseCase(this.repo);
  final LoginRepository repo;

  Future<Either<Failure, bool>> login(LoginRequest request) =>
      repo.login(request);
}
