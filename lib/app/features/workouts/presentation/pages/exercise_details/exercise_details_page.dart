import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../../widgets/custom_app_bar.dart';
import '../../../../widgets/custom_loading.dart';
import '../../../../widgets/no_connection_widget.dart';
import '../../provider/workouts_provider.dart';
import 'widgets/details_section.dart';

class ExerciseDetailsPage extends StatelessWidget {
  const ExerciseDetailsPage({
    this.exercisesId,
    this.exercisesName,
    Key? key,
  }) : super(key: key);
  final String? exercisesId;
  final String? exercisesName;
  @override
  Widget build(BuildContext context) {
    final _provider = Provider.of<WorkoutsProvider>(context, listen: true);
    return Scaffold(
      appBar: CustomAppBar(
        title: AppBarData.title(_provider.formatWorkoutName(exercisesName!)),
        leading: AppBarData.arrowBackIcon(),
      ),
      body: (_provider.refreshExerciseDetails ||
              !_provider.refreshExerciseDetails)
          ? FutureBuilder(
              future: _provider.getExerciseDetails(exercisesId!),
              builder: (context, snapshot) {
                if (!snapshot.hasData) {
                  return const CustomLoading();
                } else {
                  if (snapshot.data is Right) {
                    return DetailsSection((snapshot.data as Right).value);
                  } else {
                    return NoConnectionWidget(
                      () => _provider.refreshExerciseDetailsFun(),
                    );
                  }
                }
              },
            )
          : Container(),
    );
  }
}
