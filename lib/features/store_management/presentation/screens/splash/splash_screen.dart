import 'package:flutter/material.dart';

import 'components/body.dart';


class SplashAppScreen extends StatelessWidget {
  static const String routeName = "/SplashAppScreen";
  @override
  Widget build(BuildContext context) {
    // You have to call it on your starting screen
    return Scaffold(
      body: Body(),
    );
  }
}
