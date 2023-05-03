import 'package:fantasy_store/core/constants/app_assets.dart';
import 'package:fantasy_store/features/base/presentation/view_models/base_view_model.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/app_constants.dart';
import '../../../base/presentation/widgets/app_button.dart';
import '../../data/model/congrats_model.dart';

class SuccessPopupScreen extends StatelessWidget with BaseViewModel {
  SuccessPopupScreen({Key? key, required this.congratsArgs}) : super(key: key);

  static const String routeName = "/SuccessPopupScreen";

  final CongratsArgs congratsArgs;
  final Size size =
      MediaQuery.of(AppConstants.navigatorKey.currentContext!).size;

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: ()async{return false;},
      child: Scaffold(
        body: Stack(
          children: [
            SizedBox.expand(
              child:
                  Image.asset(AppAssets.background.imagePath, fit: BoxFit.fill),
            ),
            Center(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Container(
                  // width: size.width * 0.90,
                  decoration: const BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(40)),
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey,
                          blurRadius: 5,
                          blurStyle: BlurStyle.outer,
                        )
                      ]),
                  child: Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 20, vertical: 70),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisSize: MainAxisSize.min,
                      children: [
/*                        const SizedBox(
                            height: 25,
                          ),*/
                        Image.asset(
                          congratsArgs.appAssets?.imagePath ??
                              AppAssets.success.imagePath,
                          width: size.width * 0.25,
                          height: size.width * 0.25,
                          fit: BoxFit.fill,
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        Text(congratsArgs.title ?? "congrats".tr(),
                            style: Theme.of(context)
                                .textTheme
                                .displayLarge!
                                .copyWith(
                                    color: AppColors.darkGrey,
                                    fontWeight: FontWeight.bold)),
                        const SizedBox(
                          height: 15,
                        ),
                        congratsArgs.lineOne != null
                            ? Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  SizedBox(
                                    width:
                                        MediaQuery.of(context).size.width * 0.6,
                                    child: Text(
                                      congratsArgs.lineOne ?? "",
                                      style: Theme.of(context)
                                          .textTheme
                                          .displayMedium!
                                          .copyWith(
                                            color: AppColors.smallHeadLineColor,
                                          ),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 5,
                                  ),
                                ],
                              )
                            : const SizedBox.shrink(),
                        congratsArgs.lineTwo != null
                            ? Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Text(congratsArgs.lineTwo ?? "",
                                      style: Theme.of(context)
                                          .textTheme
                                          .displayMedium!
                                          .copyWith(
                                              color:
                                                  AppColors.smallHeadLineColor)),
                                  const SizedBox(
                                    height: 25,
                                  ),
                                ],
                              )
                            : const SizedBox(
                                height: 25,
                              ),
                        AppButton(
                          onTap: () {
                            congratsArgs.onTap();
                          },
                          text: congratsArgs.buttonText,
                        ),
/*                        const SizedBox(
                            height: 20,
                          ),*/
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
