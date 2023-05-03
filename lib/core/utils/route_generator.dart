import 'package:flutter/material.dart';
import '../../features/base/presentation/screens/login_screen.dart';
import '../../features/general_management/data/model/congrats_model.dart';
import '../../features/general_management/presentation/screens/succes_popup_screen.dart';
import '../../features/general_management/presentation/screens/about_us.dart';
import '../../features/general_management/presentation/screens/splash.dart';
import '../../features/general_management/presentation/screens/home.dart';
import '../../features/general_management/presentation/screens/theme_screen.dart';
import '../../features/store_management/presentation/screens/home/home_screen.dart';
import '../../features/store_management/presentation/screens/splash/splash_screen.dart';

class RouteGenerator {
  static generateRoute(RouteSettings settings) {
    final args = settings.arguments;
    final name = settings.name;

    debugPrint("the name here ----> $name");
    debugPrint("the args here ----> $args");

    switch (name) {
      case ThemeScreen.routeName:
        return MaterialPageRoute(builder: (_) =>  ThemeScreen());
      case LoginPage.routeName:
        return MaterialPageRoute(builder: (_) =>  LoginPage());
      case SplashAppScreen.routeName:
        return MaterialPageRoute(builder: (_) =>  SplashAppScreen());
      case StoreHomeScreen.routeName:
        return MaterialPageRoute(builder: (_) =>  StoreHomeScreen());


      case AboutUs.routeName:
        return MaterialPageRoute(builder: (_) => const AboutUs());


      case Home.routeName:
        return MaterialPageRoute(builder: (_) => const Home());


      case SuccessPopupScreen.routeName:
        return MaterialPageRoute(
            builder: (_) => SuccessPopupScreen(
                  congratsArgs: args as CongratsArgs,
                ));

      default:
        return _errorRoute();
    }
  }

  static Route<dynamic> _errorRoute() {
    return MaterialPageRoute(builder: (_) {
      return Scaffold(
        appBar: AppBar(
          title: const Text('Invalid Route'),
        ),
        body: const Center(
          child: Text('Invalid Route'),
        ),
      );
    });
  }
}
