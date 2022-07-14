import 'package:flutter/material.dart';
import '../utils/app_utils.dart';
import 'navigation_service.dart';

class NavigationServiceImpl implements NavigationService {
  final _navigatorKey = AppUtils.navigatorKey;

  @override
  void navigateBack<T>({T? data}) {
    return _navigatorKey.currentState!.pop();
  }

  @override
  Future<dynamic> navigateReplacementNamed<T>(String? route, {T? argument}) {
    return WidgetsBinding.instance!.waitUntilFirstFrameRasterized.then((value) {
      return _navigatorKey.currentState!
          .pushReplacementNamed(route!, arguments: argument);
    });
  }

  @override
  Future<dynamic> navigateToNamed<T>(String? route, {T? argument}) {
    return WidgetsBinding.instance!.waitUntilFirstFrameRasterized.then((value) {
      return _navigatorKey.currentState!.pushNamed(route!, arguments: argument);
    });
  }

  @override
  Future<dynamic> navigateToNamedRemoveUntil<T>(String? route, {T? argument}) {
    return WidgetsBinding.instance!.waitUntilFirstFrameRasterized.then((value) {
      return _navigatorKey.currentState!
          .pushNamedAndRemoveUntil(route!, (Route<dynamic> route) => false);
    });
  }

  void pop<T>({T? data}) {
    if (Navigator.canPop(_navigatorKey.currentContext!)) {
      _navigatorKey.currentState!.pop(data);
    }
  }

  /// pushes the page to the top of the stack
  @override
  Future<T?> push<T>(Widget page) {
    return WidgetsBinding.instance!.waitUntilFirstFrameRasterized.then((value) {
      return _navigatorKey.currentState!
          .push(MaterialPageRoute<T>(builder: (context) => page));
    });
  }

  /// removes the current page from the stack and push new page in stack
  @override
  Future<T?> pushReplacement<T>(Widget page) {
    return WidgetsBinding.instance!.waitUntilFirstFrameRasterized.then((value) {
      return _navigatorKey.currentState!
          .pushReplacement(MaterialPageRoute<T>(builder: (context) => page));
    });
  }

  /// removes all pages on the stack and pushes the page to it
  @override
  Future<T?> setRootPage<T>(Widget page) {
    return WidgetsBinding.instance!.waitUntilFirstFrameRasterized.then((value) {
      return _navigatorKey.currentState!.pushAndRemoveUntil(
          MaterialPageRoute(builder: (context) => page),
          (Route<dynamic> route) => false);
    });
  }
}
