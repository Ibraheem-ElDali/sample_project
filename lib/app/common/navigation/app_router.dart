import 'package:flutter/material.dart';
import '../../features/login/presentation/pages/login_page.dart';
import '../../features/splash/presentation/pages/splash_page.dart';
import '../../features/workouts/presentation/pages/exercise_details/exercise_details_page.dart';
import '../../features/workouts/presentation/pages/workout_exercises/workout_exercises_page.dart';
import '../../features/workouts/presentation/pages/workouts/workouts_page.dart';
import '../constants/route_paths.dart';
import 'navigation_transition.dart';

class AppRouter {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      // splash
      case RoutePaths.splash:
        return NavigationSlideFromSide(const SplashPage());

      // login
      case RoutePaths.login:
        return NavigationSlideFromSide(const LoginPage());
      // workouts
      case RoutePaths.workouts:
        return NavigationSlideFromSide(const WorkoutsPage());
      case RoutePaths.workoutExercises:
        var args = settings.arguments as Map;
        return NavigationSlideFromSide(
          WorkoutExercisesPage(
            workoutName: args['workoutName'],
            workoutId: args['workoutId'],
          ),
        );
      case RoutePaths.exerciseDetails:
        var args = settings.arguments as Map;
        return NavigationSlideFromSide(
          ExerciseDetailsPage(
            exercisesId: args['exercisesId'],
            exercisesName: args['exercisesName'],
          ),
        );

      default:
        return NavigationSlideFromSide(const LoginPage());
    }
  }
}
