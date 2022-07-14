import 'package:flutter/material.dart';
import '../../common/styles/app_colors.dart';

class CustomText {
  static regular({
    required String text,
    required double size,
    Color? color = AppColor.grey900,
    TextAlign? textAlign = TextAlign.start,
  }) {
    return Text(
      text,
      textAlign: textAlign,
      style: TextStyle(
        fontSize: size,
        color: color,
        fontWeight: FontWeight.w400,
      ),
    );
  }

  static medium({
    required String text,
    required double size,
    Color? color = AppColor.grey900,
    TextAlign? textAlign = TextAlign.start,
  }) {
    return Text(
      text,
      textAlign: textAlign,
      style: TextStyle(
        fontSize: size,
        color: color,
        fontWeight: FontWeight.w500,
      ),
    );
  }

  static semiBold({
    required String text,
    required double size,
    Color? color = AppColor.grey900,
    TextAlign? textAlign = TextAlign.start,
  }) {
    return Text(
      text,
      textAlign: textAlign,
      style: TextStyle(
        fontSize: size,
        color: color,
        fontWeight: FontWeight.w600,
      ),
    );
  }

  static bold({
    required String text,
    required double size,
    Color? color = AppColor.grey900,
    TextAlign? textAlign = TextAlign.start,
  }) {
    return Text(
      text,
      textAlign: textAlign,
      style: TextStyle(
        fontSize: size,
        color: color,
        fontWeight: FontWeight.w700,
      ),
    );
  }
}
