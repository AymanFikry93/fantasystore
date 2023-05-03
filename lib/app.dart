import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'core/constants/app_constants.dart';
import 'core/theme/app_theme.dart';
import 'core/utils/route_generator.dart';
import 'features/base/presentation/screens/login_screen.dart';
import 'features/general_management/presentation/screens/splash.dart';
import 'features/general_management/presentation/screens/theme_screen.dart';
export 'package:fantasy_store/core/injection_container.dart';

// ignore_for_file: use_key_in_widget_constructors
class MyApp extends StatefulWidget {
  @override
  MyAppState createState() {
    return MyAppState();
  }
}

class MyAppState extends State<MyApp> {
  ThemeMode themeMode = ThemeMode.system;

  @override
  void initState() {
    super.initState();
    // AppInit().initAfterAppLaunching();
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    return ScreenUtilInit(
        designSize: const Size(375, 812),
        minTextAdapt: false,
        splitScreenMode: true,
        builder: (_, child) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            // localizationsDelegates: context.localizationDelegates,
            supportedLocales: context.supportedLocales,
            locale: context.locale,
            navigatorKey: AppConstants.navigatorKey,
            localizationsDelegates: [
              ...context.localizationDelegates,
            ],
            builder: (BuildContext context, Widget? child) {
              return MediaQuery(
                data: MediaQuery.of(context).copyWith(
                  textScaleFactor: 1,
                ), //, devicePixelRatio: 3.5
                //set desired text scale factor here
                child: child!,
              );
            },
            theme: appThemes[AppTheme.light],
            themeMode: ThemeMode.light,
            initialRoute: ThemeScreen.routeName,
            onGenerateRoute: (routeSettings) =>
                RouteGenerator.generateRoute(routeSettings),
          );
        });
  }
}
