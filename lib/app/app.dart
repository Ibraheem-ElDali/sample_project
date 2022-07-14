import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'common/base/service_locator.dart';
import 'common/constants/route_paths.dart';
import 'common/navigation/app_router.dart';
import 'common/styles/app_colors.dart';
import 'common/styles/app_labels.dart';
import 'common/utils/app_utils.dart';
import 'features/login/presentation/providers/login_provider.dart';
import 'features/workouts/presentation/provider/workouts_provider.dart';

class FlutterTask extends StatelessWidget {
  const FlutterTask({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => LoginProvider(sl()),
        ),
        ChangeNotifierProvider(
          create: (_) => WorkoutsProvider(sl()),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: AppLabel.appTitle,
        navigatorKey: AppUtils.navigatorKey,
        initialRoute: RoutePaths.splash,
        onGenerateRoute: AppRouter.generateRoute,
        theme: ThemeData(
          scaffoldBackgroundColor: AppColor.white,
        ),
      ),
    );
  }
}
