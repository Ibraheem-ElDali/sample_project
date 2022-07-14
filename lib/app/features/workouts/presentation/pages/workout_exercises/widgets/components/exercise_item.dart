import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../../../../../common/constants/api_routes.dart';
import '../../../../../../../common/styles/app_colors.dart';
import '../../../../../../../common/styles/app_fonts.dart';
import '../../../../../../../common/styles/app_labels.dart';
import '../../../../../../../common/utils/extensions.dart';
import '../../../../../../../common/utils/time_ago.dart';
import '../../../../../../widgets/custom_text.dart';
import '../../../../../data/models/workout_exercise/result_model.dart';
import '../../../../provider/workouts_provider.dart';

class ExerciseItem extends StatelessWidget {
  const ExerciseItem(this.exercise, {this.time, Key? key}) : super(key: key);
  final ResultModel exercise;
  final String? time;
  @override
  Widget build(BuildContext context) {
    final _provider = Provider.of<WorkoutsProvider>(context);
    return InkWell(
      onTap: () => _provider.exerciseItemTapped(
        exercisesId: exercise.id.toString(),
        exercisesName: exercise.name,
      ),
      child: Container(
        height: 100.h,
        margin: EdgeInsets.only(bottom: 10.h),
        padding: EdgeInsets.symmetric(vertical: 10.h),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8.r),
          border: Border.all(color: AppColor.grey100),
        ),
        child: Row(
          children: [
            Image.network(
              ApiRoutes.workoutLogo(exercise.logoUrl!),
              fit: BoxFit.contain,
            ),
            SizedBox(width: 20.w),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CustomText.semiBold(
                  text: _provider.formatWorkoutName(exercise.name!),
                  size: AppFont.font16,
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 3.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CustomText.medium(
                      text: AppLabel.productCount,
                      size: AppFont.font14,
                    ),
                    CustomText.medium(
                      text: exercise.productCount.toString(),
                      size: AppFont.font14,
                      color: AppColor.grey500,
                    ),
                  ],
                ),
                const Spacer(),
                CustomText.regular(
                  text: TimeAgo.timeAgoSinceDate(time!),
                  size: AppFont.font14,
                  color: AppColor.grey500,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
