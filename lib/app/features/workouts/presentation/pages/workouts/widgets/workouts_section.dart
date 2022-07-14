import 'package:flutter/material.dart';
import '../../../../../../common/utils/extensions.dart';
import '../../../../data/models/workout_exercise/workouts_model.dart';
import 'components/workout_item.dart';

class WorkoutsSection extends StatelessWidget {
  const WorkoutsSection(this.workouts, {Key? key}) : super(key: key);
  final WorkoutsModel workouts;
  @override
  Widget build(BuildContext context) {
    return GridView.count(
      crossAxisCount: 2,
      childAspectRatio: 0.9,
      mainAxisSpacing: 10.h,
      crossAxisSpacing: 10.w,
      padding: EdgeInsets.symmetric(
        vertical: 24.h,
        horizontal: 20.w,
      ),
      physics: const BouncingScrollPhysics(),
      children: List.generate(
        workouts.result!.length,
        (index) => WorkoutItem(workouts.result![index]),
      ),
    );
  }
}
