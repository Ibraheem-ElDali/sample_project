import 'package:dartz/dartz.dart';
import '../../../../common/constants/locators.dart';
import '../../../../common/errors/exceptions.dart';
import '../../../../common/errors/failures.dart';
import '../../../../common/http/http_helper.dart';
import '../../../../common/http/http_service_impl.dart';
import '../../../../common/styles/app_labels.dart';
import '../../domain/repository/workouts_repository.dart';
import '../datasources/remote_data_source.dart';
import '../models/exercise_details/exercise_details_model.dart';
import '../models/workout_exercise/workouts_model.dart';

class WorkoutsRepositoryImpl extends HttpServiceImpl
    implements WorkoutsRepository {
  WorkoutsRepositoryImpl(this.remoteDataSource);
  final WorkoutsRemoteDataSource remoteDataSource;

  @override
  Future<Either<Failure, WorkoutsModel>> getWorkouts() async {
    if (await Locators.network.isConnected) {
      try {
        final body = await remoteDataSource.getWorkouts();
        return Right(WorkoutsModel.fromJson(body));
      } on ServerException catch (error) {
        var failure = HttpHelper.handleStatusCodeResponse(error.code);
        return Left(failure);
      }
    } else {
      var failure = NoInternetConnectionFailure(msg: AppLabel.noConnection);
      return Left(failure);
    }
  }

  @override
  Future<Either<Failure, WorkoutsModel>> getWorkoutExercises(
      String workoutId) async {
    if (await Locators.network.isConnected) {
      try {
        final body = await remoteDataSource.getWorkoutExercises(workoutId);
        return Right(WorkoutsModel.fromJson(body));
      } on ServerException catch (error) {
        var failure = HttpHelper.handleStatusCodeResponse(error.code);
        return Left(failure);
      }
    } else {
      var failure = NoInternetConnectionFailure(msg: AppLabel.noConnection);
      return Left(failure);
    }
  }

  @override
  Future<Either<Failure, ExerciseDetailsModel>> getExerciseDetails(
      String exercisesId) async {
    if (await Locators.network.isConnected) {
      try {
        final body = await remoteDataSource.getExerciseDetails(exercisesId);
        return Right(ExerciseDetailsModel.fromJson(body));
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
