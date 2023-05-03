import '../../../../core/constants/app_assets.dart';

class CongratsArgs {
  Function onTap;
  String buttonText;
  String? lineOne;
  String? lineTwo;
  AppAssets? appAssets;
  String? title;

  CongratsArgs({
    required this.onTap,
    required this.buttonText,
    this.lineOne,
    this.lineTwo,
    this.appAssets,
    this.title,
  });
}
