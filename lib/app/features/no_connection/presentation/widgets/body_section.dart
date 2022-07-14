import 'package:flutter/material.dart';
import '../../../../common/constants/locators.dart';
import '../../../../common/styles/app_colors.dart';
import '../../../../common/styles/app_fonts.dart';
import '../../../../common/styles/app_images.dart';
import '../../../../common/styles/app_labels.dart';
import '../../../../common/utils/extensions.dart';
import '../../../widgets/custom_button.dart';
import '../../../widgets/custom_text.dart';

class BodySection extends StatelessWidget {
  const BodySection(this.callback, {Key? key}) : super(key: key);
  final VoidCallback callback;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(AppImages.noConnection),
          CustomText.bold(
            text: AppLabel.oops,
            size: AppFont.font28,
          ),
          CustomText.medium(
            text: AppLabel.noConnection,
            size: AppFont.font16,
            color: AppColor.grey500,
          ),
          SizedBox(height: 40.h),
          CustomButton(
            buttonLabel: AppLabel.retry,
            buttonWidth: 100.w,
            onPressed: () async {
              if (await Locators.network.isConnected) {
                Locators.navigation.navigateBack();
                callback.call();
              }
            },
          ),
        ],
      ),
    );
  }
}
