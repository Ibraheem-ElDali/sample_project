import 'package:flutter/material.dart';
import '../../../../common/constants/locators.dart';
import '../../../../common/constants/route_paths.dart';
import '../../domain/usecase/workouts_usecase.dart';

class WorkoutsProvider extends ChangeNotifier {
  WorkoutsProvider(this._useCase);

  final WorkoutsUseCase _useCase;

  /// workouts
  bool refreshWorkouts = false;
  String formatWorkoutName(String name) {
    return name.split('{"ar":"').toList()[1].split('"}').toList()[0];
  }

  void workoutItemTapped({String? workoutName, String? workoutId}) {
    Locators.navigation.navigateToNamed(
      RoutePaths.workoutExercises,
      argument: {'workoutName': workoutName!, 'workoutId': workoutId},
    );
  }

  void refreshWorkoutsFun() {
    refreshWorkouts = !refreshWorkouts;
    notifyListeners();
  }

  getWorkouts() async {
    return await _useCase.getWorkouts();
  }

  /// workout exercises
  bool refreshWorkoutExercises = false;
  void refreshWorkoutExercisesFun() {
    refreshWorkoutExercises = !refreshWorkoutExercises;
    notifyListeners();
  }

  void exerciseItemTapped({String? exercisesId,String? exercisesName}) {
    Locators.navigation.navigateToNamed(RoutePaths.exerciseDetails,argument: {
      'exercisesId': exercisesId,
      'exercisesName': exercisesName,
    });
  }

  getWorkoutExercises(String workoutId) async {
    return await _useCase.getWorkoutExercises(workoutId);
  }

  /// workout exercises details
  bool refreshExerciseDetails = false;
  void refreshExerciseDetailsFun() {
    refreshExerciseDetails = !refreshExerciseDetails;
    notifyListeners();
  }

  String formatExerciseDetailsName(String name) {
    return name.substring(0, name.length - 1);
  }

  getExerciseDetails(String exercisesId) async {
    return await _useCase.getExerciseDetails(exercisesId);
  }
}
