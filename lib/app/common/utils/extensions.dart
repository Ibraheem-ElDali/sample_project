import '../constants/locators.dart';

extension SizeExtension on num {

  double get w => Locators.responsive.scaleWidth * this;

  double get h => Locators.responsive.scaleHeight * this;

  double get r => Locators.responsive.scaleRadius * this;

  double get sp => Locators.responsive.scaleText * this;

  double get sw => Locators.responsive.screenWidth * this;

  double get sh => Locators.responsive.screenHeight * this;
}
