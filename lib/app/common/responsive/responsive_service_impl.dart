import 'dart:math';
import 'package:flutter/material.dart';
import '../utils/app_utils.dart';
import 'responsive_service.dart';

class ResponsiveServiceImpl implements ResponsiveService {
  final Size _uiSize = const Size(428, 926);

  @override
  double get scaleHeight=> AppUtils.screenHeight / _uiSize.height;

  @override
  double get scaleWidth=> AppUtils.screenWidth / _uiSize.width;

  @override
  double get scaleRadius=> min(scaleWidth, scaleHeight);

  @override
  double get scaleText => min(scaleWidth, scaleHeight);

  @override
  double get screenHeight=> AppUtils.screenHeight;

  @override
  double get screenWidth=> AppUtils.screenWidth;
}
