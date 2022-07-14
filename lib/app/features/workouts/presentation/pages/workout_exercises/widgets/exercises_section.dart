import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../../../../../common/styles/app_fonts.dart';
import '../../../../../../common/styles/app_labels.dart';
import '../../../../../../common/utils/extensions.dart';
import '../../../../../widgets/custom_text.dart';
import '../../../../data/models/workout_exercise/workouts_model.dart';
import 'components/exercise_item.dart';

class ExercisesSection extends StatelessWidget {
  const ExercisesSection(this.exercises, {Key? key}) : super(key: key);
  final WorkoutsModel exercises;
  @override
  Widget build(BuildContext context) {
    if (exercises.result!.isEmpty) {
      return Center(
        child: CustomText.regular(
          text: AppLabel.noResults,
          size: AppFont.font14,
        ),
      );
    } else {
      return ListView.builder(
        itemCount: exercises.result!.length,
        physics: const BouncingScrollPhysics(),
        padding: EdgeInsets.symmetric(
          vertical: 24.h,
          horizontal: 20.w,
        ),
        itemBuilder: (_, index) => ExerciseItem(
          exercises.result![index],
          time: exercises.time,
        ),
      );
    }
  }
}
