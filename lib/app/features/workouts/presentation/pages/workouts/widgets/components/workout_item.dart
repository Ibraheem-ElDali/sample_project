import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../../../../../common/constants/api_routes.dart';
import '../../../../../../../common/styles/app_colors.dart';
import '../../../../../../../common/styles/app_fonts.dart';
import '../../../../../../../common/styles/app_labels.dart';
import '../../../../../../../common/utils/extensions.dart';
import '../../../../../../widgets/custom_text.dart';
import '../../../../../data/models/workout_exercise/result_model.dart';
import '../../../../provider/workouts_provider.dart';

class WorkoutItem extends StatelessWidget {
  const WorkoutItem(this.workout, {Key? key}) : super(key: key);
  final ResultModel workout;
  @override
  Widget build(BuildContext context) {
    final _provider = Provider.of<WorkoutsProvider>(context);
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8.r),
      ),
      elevation: 2.0,
      child: InkWell(
        borderRadius: BorderRadius.circular(8.r),
        onTap: () => _provider.workoutItemTapped(
          workoutId: workout.id.toString(),
          workoutName: workout.name!,
        ),
        child: Padding(
          padding: EdgeInsets.all(8.w),
          child: Column(
            children: [
              Image.network(
                ApiRoutes.workoutLogo(workout.logoUrl!),
                fit: BoxFit.contain,
                height: 100.h,
              ),
              const Spacer(),
              CustomText.semiBold(
                text: _provider.formatWorkoutName(workout.name!),
                size: AppFont.font16,
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 5.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CustomText.medium(
                    text: AppLabel.productCount,
                    size: AppFont.font14,
                  ),
                  CustomText.medium(
                    text: workout.productCount.toString(),
                    size: AppFont.font14,
                    color: AppColor.grey500,
                  ),
                ],
              ),
              const Spacer(),
            ],
          ),
        ),
      ),
    );
  }
}
