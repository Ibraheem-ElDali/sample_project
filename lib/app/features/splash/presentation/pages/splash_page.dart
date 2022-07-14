import 'package:flutter/material.dart';
import '../../../../common/constants/locators.dart';
import '../../../../common/constants/route_paths.dart';
import '../../../../common/styles/app_colors.dart';
import '../../../../common/styles/app_fonts.dart';
import '../../../../common/styles/app_labels.dart';
import '../../../../common/utils/app_utils.dart';
import '../../../widgets/custom_text.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    Future.delayed(const Duration(seconds: 1), () {
      Locators.navigation.navigateReplacementNamed(RoutePaths.login);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    AppUtils.screenWidth = MediaQuery.of(context).size.width;
    AppUtils.screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: AppColor.red,
      body: Center(
        child: CustomText.bold(
          text: AppLabel.appTitle,
          size: AppFont.font24,
          color: AppColor.white,
        ),
      ),
    );
  }
}
