import 'package:fantasy_store/features/base/presentation/view_models/base_view_model.dart';
import 'package:fantasy_store/features/general_management/presentation/screens/home.dart';
import 'package:fantasy_store/features/store_management/presentation/screens/home/home_screen.dart';
import 'package:flutter/material.dart';
import '../../../../core/constants/app_assets.dart';
import '../../../../core/constants/app_constants.dart';
import '../../../../core/injection_container.dart' as di;
import 'package:fantasy_store/core/extensions/context_extension.dart';
import 'bottom_tab_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  static const routeName = "/splash";

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> with BaseViewModel {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    navigate();

  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }


  void navigate() {
    Future.delayed(const Duration(seconds: 2), () {

      if (true) {
        navigateToScreen(StoreHomeScreen.routeName, removeTop: true);
      } else {
        navigateToScreen(BottomTabScreen.routeName, removeTop: true);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        fit: StackFit.expand,
        children: [
          Center(
            child: Image.asset(AppAssets.logo.imagePath),
          ),
        ],
      ),
    );
  }
}
