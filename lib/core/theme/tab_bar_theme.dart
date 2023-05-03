import 'package:flutter/material.dart';

import '../constants/app_colors.dart';
import '../constants/app_constants.dart';
import 'app_text_theme.dart';
import 'app_theme.dart';

TabBarTheme tabBarTheme() =>TabBarTheme(
  indicator: BoxDecoration(
    borderRadius: BorderRadius.circular(
      6.0,
    ),
    color: AppColors.primaryColor,
  ),
  labelStyle: appTextThemes[AppTheme.light]?.titleSmall?.copyWith(    fontFamily:  AppConstants.fontFamily,),
  unselectedLabelStyle:  appTextThemes[AppTheme.light]?.titleSmall?.copyWith(    fontFamily:  AppConstants.fontFamily,),
  labelPadding: EdgeInsets.zero,
unselectedLabelColor:  AppColors.unselectedTabColor,
);
