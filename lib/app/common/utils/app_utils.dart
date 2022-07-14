import 'package:flutter/material.dart';

final BuildContext context = AppUtils.context;

class AppUtils {
  static GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  static get context => navigatorKey.currentState?.context;

  static double screenWidth = 0.0;

  static double screenHeight = 0.0;

  static String namePattern =
      r'^[\u0600-\u065F\u066A-\u06EF\u06FA-\u06FFa-zA-Z]+[\u0600-\u065F\u066A-\u06EF\u06FA-\u06FFa-zA-Z-_]*$';

  static String countryFlagPattern(String code) {
    return code.toUpperCase().replaceAllMapped(RegExp(r'[A-Z]'),
        (match) => String.fromCharCode(match.group(0)!.codeUnitAt(0) + 127397));
  }

  static bool checkPattern({pattern, value}) {
    RegExp regularCheck = RegExp(pattern);
    if (regularCheck.hasMatch(value)) {
      return true;
    }
    return false;
  }

  static void removeAllFocus(BuildContext context) {
    FocusScope.of(context).requestFocus(FocusNode());
  }

  static void removeOverlays(BuildContext context) {
    ScaffoldMessenger.of(context).removeCurrentSnackBar();
  }
}
