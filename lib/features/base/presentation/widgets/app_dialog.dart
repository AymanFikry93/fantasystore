import 'package:flutter/material.dart';

import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/app_constants.dart';
import 'app_button.dart';

class CustomDialog extends StatelessWidget {
  CustomDialog({
    Key? key,
    required this.positiveBtnTxt,
    this.negativeBtnTxt,
    required this.onPositiveTap,
    this.onNegativeTap,
    required this.title,
  })  : assert(
            negativeBtnTxt != null && onNegativeTap != null ||
                negativeBtnTxt == null && onNegativeTap == null,
            "provide the button and its function together"),
        super(key: key);
  final Size size =
      MediaQuery.of(AppConstants.navigatorKey.currentContext!).size;
  final String title;
  final String positiveBtnTxt;
  final Function() onPositiveTap;
  final String? negativeBtnTxt;
  final Function()? onNegativeTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size.width * 0.90,
      decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(15)),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.grey,
              blurRadius: 25,
              blurStyle: BlurStyle.outer,
            )
          ]),
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    GestureDetector(
                      onTap: () => Navigator.pop(context),
                      child: Container(
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border:
                                  Border.all(color: const Color(0xff777777))),
                          child: const Padding(
                            padding: EdgeInsets.all(4.0),
                            child: Icon(Icons.close,
                                color: Colors.black, size: 16),
                          )),
                    )
                  ]),
              const SizedBox(
                height: 20,
              ),
              Text(title,
                  style: Theme.of(context)
                      .textTheme
                      .displayMedium!
                      .copyWith(color: AppColors.hintColor)),
              const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment:
                    (negativeBtnTxt != null && onNegativeTap != null)
                        ? MainAxisAlignment.spaceBetween
                        : MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  AppButton(
                      onTap: onPositiveTap,
                      text: positiveBtnTxt,
                      width: size.width * 0.90 * 0.45),
                  if (negativeBtnTxt != null && onNegativeTap != null)
                    AppButton(
                        onTap: onNegativeTap!,
                        text: negativeBtnTxt,
                        width: size.width * 0.90 * 0.45),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
            ]),
      ),
    );
  }
}
