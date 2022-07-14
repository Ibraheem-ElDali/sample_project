import 'package:flutter/material.dart';
import '../../../../../../common/styles/app_fonts.dart';
import '../../../../../../common/utils/extensions.dart';
import '../../../../../widgets/custom_text.dart';
import '../../../../data/models/exercise_details/exercise_details_model.dart';

class DetailsSection extends StatelessWidget {
  const DetailsSection(this.details,{Key? key}) : super(key: key);
  final ExerciseDetailsModel details;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.network(details.result!.defaultImageUri!),
          CustomText.medium(
            text: details.result!.name!,
            size: AppFont.font16,
          ),
          SizedBox(height: 10.h),
          CustomText.medium(
            text: details.result!.description!,
            size: AppFont.font16,
          ),
          SizedBox(height: 10.h),
          CustomText.medium(
            text: details.result!.fat.toString(),
            size: AppFont.font16,
          ),
        ],
      ),
    );
  }
}
