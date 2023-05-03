import 'package:flutter/material.dart';
import '../../../../core/constants/app_assets.dart';

class AppSuccessImage extends StatelessWidget {

  final String successMessage;

  const AppSuccessImage({super.key, required this.successMessage});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      color: Theme.of(context).primaryColor.withOpacity(0.5),
      child: Center(
        child: Container(
          width: MediaQuery.of(context).size.width * 0.8,
          height: MediaQuery.of(context).size.width * 0.8,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: Colors.white,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                AppAssets.successAction.imagePath,
                width: 100,
                height: 100,
                fit: BoxFit.contain,
              ),
              Text(
                successMessage,
                textAlign: TextAlign.center,)
            ],
          ),
        ),
      ),
    );
  }
}