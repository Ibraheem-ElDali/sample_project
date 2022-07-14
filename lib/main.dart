import 'package:flutter/material.dart';
import 'app/app.dart';
import 'app/common/base/services_initializer.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await ServiceInitializer().initializeServices();
  runApp(const FlutterTask());
}

// see the analysis_options file , i added important rules for good coding.
// api's is not working yet because they Expired. if we tried another api's
// it will work normally
