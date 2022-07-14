import 'package:flutter/material.dart';
import '../../common/styles/app_colors.dart';
import '../../common/styles/app_fonts.dart';
import '../../common/utils/extensions.dart';
import 'custom_text.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    required this.buttonLabel,
    required this.onPressed,
    this.labelSize,
    this.buttonWidth,
    this.buttonHeight,
    this.radius,
    this.buttonColor = AppColor.red,
    this.labelColor = AppColor.white,
    this.borderColor = AppColor.transparent,
    Key? key,
  }) : super(key: key);

  final String buttonLabel;
  final Color buttonColor;
  final Color labelColor;
  final Color borderColor;
  final double? labelSize;
  final double? buttonHeight;
  final double? buttonWidth;
  final double? radius;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: onPressed,
      height: buttonHeight ?? 54.h,
      minWidth: buttonWidth ?? 1.sw,
      color: buttonColor,
      elevation: 0.0,
      highlightElevation: 0.0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(radius ?? 1.sw / 2),
        side: BorderSide(color: borderColor, width: 1.w),
      ),
      child: CustomText.bold(
        text: buttonLabel,
        color: labelColor,
        size: labelSize ?? AppFont.font16,
      ),
    );
  }
}
