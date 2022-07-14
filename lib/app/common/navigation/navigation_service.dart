import 'package:flutter/material.dart';

abstract class NavigationService {

  void navigateBack<T>({T? data});

  Future<dynamic> navigateToNamed<T>(String? route, {T? argument});

  Future<dynamic> navigateReplacementNamed<T>(String? route, {T? argument});

  Future<dynamic> navigateToNamedRemoveUntil<T>(String? route, {T? argument});

  Future<T?> push<T>(Widget page);

  Future<T?> pushReplacement<T>(Widget page);

  Future<T?> setRootPage<T>(Widget page);
}
