import 'package:flutter/material.dart';
import '../../../../common/styles/app_colors.dart';
import '../../../../common/styles/app_fonts.dart';
import '../../../../common/styles/app_labels.dart';
import '../../../../common/utils/extensions.dart';
import '../../../widgets/custom_text.dart';

class TitleSection extends StatelessWidget {
  const TitleSection({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Padding(
        padding: EdgeInsets.only(top: 80.h),
        child: CustomText.bold(
          text: AppLabel.loginTitle,
          color: AppColor.grey900,
          size: AppFont.font40,
        ),
      ),
    );
  }
}
