import 'package:dartz/dartz.dart';
import '../../../../common/errors/failures.dart';
import '../../data/models/exercise_details/exercise_details_model.dart';
import '../../data/models/workout_exercise/workouts_model.dart';

abstract class WorkoutsRepository {
  /// workouts
  Future<Either<Failure, WorkoutsModel>> getWorkouts();

  /// workout exercises
  Future<Either<Failure, WorkoutsModel>> getWorkoutExercises(String workoutId);

  /// workout exercises details
  Future<Either<Failure, ExerciseDetailsModel>> getExerciseDetails(
      String exercisesId);
}
