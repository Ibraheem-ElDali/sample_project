import 'package:dartz/dartz.dart';
import '../../../../common/errors/failures.dart';
import '../../data/models/exercise_details/exercise_details_model.dart';
import '../../data/models/workout_exercise/workouts_model.dart';
import '../repository/workouts_repository.dart';

class WorkoutsUseCase {
  WorkoutsUseCase(this.repo);
  final WorkoutsRepository repo;

  /// workouts
  Future<Either<Failure, WorkoutsModel>> getWorkouts() => repo.getWorkouts();

  /// workout exercises
  Future<Either<Failure, WorkoutsModel>> getWorkoutExercises(
          String workoutId) =>
      repo.getWorkoutExercises(workoutId);

  /// workout exercises details
  Future<Either<Failure, ExerciseDetailsModel>> getExerciseDetails(
          String exercisesId) =>
      repo.getExerciseDetails(exercisesId);
}
