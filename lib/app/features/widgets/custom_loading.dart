import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import '../../common/styles/app_colors.dart';
import '../../common/utils/extensions.dart';

class CustomLoading extends StatelessWidget {
  const CustomLoading({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        height: 100.h,
        width: 100.h,
        decoration: BoxDecoration(
          color: AppColor.white,
          borderRadius: BorderRadius.circular(12.r),
        ),
        child: SpinKitCircle(
          color: AppColor.red,
          size: 60.sp,
        ),
      ),
    );
  }
}
