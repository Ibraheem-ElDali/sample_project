import 'package:dio/dio.dart';
import '../../../../common/constants/api_routes.dart';
import '../../../../common/errors/exceptions.dart';
import '../../../../common/http/http_service_impl.dart';

class WorkoutsRemoteDataSource extends HttpServiceImpl {
  Future<Map<String, dynamic>> getWorkouts() async {
    Response response = await get(ApiRoutes.workout);
    if (response.statusCode == 200) {
      return response.data;
    } else {
      throw ServerException(response.statusCode!);
    }
  }

  Future<Map<String, dynamic>> getWorkoutExercises(String workoutId) async {
    Response response = await get(ApiRoutes.workoutExercises(workoutId));
    if (response.statusCode == 200) {
      return response.data;
    } else {
      throw ServerException(response.statusCode!);
    }
  }

  Future<Map<String, dynamic>> getExerciseDetails(String exercisesId) async {
    Response response = await get(ApiRoutes.exerciseDetails(exercisesId));
    if (response.statusCode == 200) {
      return response.data;
    } else {
      throw ServerException(response.statusCode!);
    }
  }
}
