import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../../widgets/custom_app_bar.dart';
import '../../../../widgets/custom_loading.dart';
import '../../../../widgets/no_connection_widget.dart';
import '../../provider/workouts_provider.dart';
import 'widgets/exercises_section.dart';

class WorkoutExercisesPage extends StatelessWidget {
  const WorkoutExercisesPage({this.workoutName, this.workoutId, Key? key})
      : super(key: key);
  final String? workoutName;
  final String? workoutId;
  @override
  Widget build(BuildContext context) {
    final _provider = Provider.of<WorkoutsProvider>(context, listen: true);
    return Scaffold(
      appBar: CustomAppBar(
        title: AppBarData.title(
          _provider.formatWorkoutName(workoutName!),
        ),
        leading: AppBarData.arrowBackIcon(),
      ),
      body: (_provider.refreshWorkoutExercises ||
              !_provider.refreshWorkoutExercises)
          ? FutureBuilder(
              future: _provider.getWorkoutExercises(workoutId!),
              builder: (context, snapshot) {
                if (!snapshot.hasData) {
                  return const CustomLoading();
                }
                else {
                  if (snapshot.data is Right) {
                    return ExercisesSection((snapshot.data as Right).value);
                  } else {
                    return NoConnectionWidget(
                          () => _provider.refreshWorkoutExercisesFun(),
                    );
                  }
                }
              },
            )
          : Container(),
    );
  }
}
