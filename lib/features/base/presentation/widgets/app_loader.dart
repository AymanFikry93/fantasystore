import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import '../../../../core/constants/app_colors.dart';

class AppLoader extends StatelessWidget {
  const AppLoader({super.key});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      color: Colors.black.withOpacity(.2),
      child: Center(
        child: SizedBox(
            width: 100,
            height: 100,
            child: Stack(
              children: const [
                SpinKitDualRing(
                  color:  AppColors.secondaryColor,
                  size: 50,
                ),
                // Container(
                //     width: 100,
                //     height: 100,
                //     decoration: BoxDecoration(
                //       image:  DecorationImage(
                //         image: AssetImage("assets/images/logo_loading.png"),
                //         fit: BoxFit.contain,
                //       ),
                //       // color: Colors.orange,
                //       borderRadius: BorderRadius.circular(15),
                //       // color: Colors.white
                //     ),
                // ),
              ],
            )),
      ),
    );
  }
}
