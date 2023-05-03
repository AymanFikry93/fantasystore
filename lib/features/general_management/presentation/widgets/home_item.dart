import 'package:fantasy_store/core/constants/app_colors.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeItem extends StatelessWidget {
  const HomeItem(
      {Key? key,
      this.available = true,
      required this.onClick,
      required this.imagePath,
      required this.itemName,
      this.animate = false})
      : super(key: key);

  final bool? available;
  final Function onClick;
  final String imagePath;
  final String itemName;
  final bool animate;

  @override
  Widget build(BuildContext context) {
    return AnimatedScale(
      scale: animate ? 1 : .2,
      duration: const Duration(milliseconds: 500),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          GestureDetector(
            onTap: () {
              if (available ?? true) {
                onClick();
              }
            },
            child: Stack(
              children: [
                Container(
                  width: MediaQuery.of(context).size.width * 0.38,
                  height: MediaQuery.of(context).size.width * 0.38,
                  decoration: const BoxDecoration(
                    color: Color(0xFFEAEAEA),
                    borderRadius: BorderRadius.all(Radius.circular(40)),
                  ),
                ),
                Positioned(
                  top: 0,
                  child: Container(
                    width: MediaQuery.of(context).size.width * 0.38,
                    height: MediaQuery.of(context).size.width * 0.36,
                    decoration: const BoxDecoration(
                      color: AppColors.emptyTextFieldColor,
                      borderRadius: BorderRadius.all(Radius.circular(40)),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(0.0),
                      child: Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            SizedBox(
                              child:
                                  // RipplesAnimation(imagePath:imagePath),
                                  Image.asset(
                                imagePath,
                                fit: BoxFit.contain,
                                width: 75.w,
                                height: 75.h,
                              ),
                            ),
                            SizedBox(
                              height: MediaQuery.of(context).size.height *
                                  0.20 *
                                  0.05,
                            ),
                            Text(
                              itemName,
                              style: Theme.of(context)
                                  .textTheme
                                  .displayMedium!
                                  .copyWith(color: AppColors.primaryColor),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          available ?? true
              ? const SizedBox.shrink()
              : Center(
                  child: Text("soon".tr(),
                      style: Theme.of(context).textTheme.displayLarge!.copyWith(
                          color: AppColors.secondaryColor, fontSize: 20)))
        ],
      ),
    );
  }
}
