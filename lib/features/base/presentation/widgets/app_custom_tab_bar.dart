import 'package:fantasy_store/core/constants/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppCustomTabBar extends StatelessWidget {

  final List<String> tabList;
  final TabController tabController;

  const AppCustomTabBar({super.key, required this.tabList, required this.tabController});

  @override
  Widget build(BuildContext context) {
    return
      Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        child: Container(
          height: 42.0,
          margin: const EdgeInsets.only(bottom: 0),
          padding: EdgeInsets.zero,
          decoration: BoxDecoration(
            color: AppColors.tabsColor,
            borderRadius: BorderRadius.circular(
              6.0,
            ),
          ),
          child: TabBar(
            padding: EdgeInsets.zero,
            controller: tabController,
            // labelStyle: Theme.of(context).textTheme.titleSmall,
            // unselectedLabelStyle: Theme.of(context).textTheme.titleSmall,
            tabs: [
            ...  tabList.map((tabText) =>
                  Tab(
                text:tabText,
              )).toList(),

            ],
          ),
        ),
      );
  }
}
