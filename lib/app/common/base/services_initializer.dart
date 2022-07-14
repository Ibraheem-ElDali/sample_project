import 'package:flutter/services.dart';
import '../styles/app_colors.dart';
import 'service_locator.dart';

class ServiceInitializer {
  initializeServices() async {
    await initLocators();
    await initializeScreensOrientation();
    await initializeStatusBarColor();
  }

  initLocators() async {
    initDI();
  }

  initializeScreensOrientation() async {
    SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp],
    );
  }

  initializeStatusBarColor() async {
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: AppColor.transparent,
    ));
  }
}
