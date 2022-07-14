import 'package:flutter/material.dart';
import '../../common/styles/app_colors.dart';
import '../../common/styles/app_fonts.dart';
import '../../common/utils/app_utils.dart';
import '../../common/utils/extensions.dart';
import 'custom_text.dart';

class CustomSnackBar {
  static show(String msg) {
    final _snackBar = SnackBar(
      content: CustomText.medium(
        text: msg,
        color: AppColor.white,
        size: AppFont.font16,
      ),
      padding: EdgeInsets.symmetric(
        vertical: 20.h,
        horizontal: 12.w,
      ),
      elevation: 0.0,
      behavior: SnackBarBehavior.fixed,
      duration: const Duration(seconds: 2),
    );
    return ScaffoldMessenger.of(context).showSnackBar(_snackBar);
  }
}
