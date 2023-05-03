import 'package:flutter/material.dart';
import '../constants/app_colors.dart';
import 'app_text_theme.dart';
import 'app_theme.dart';

NavigationBarThemeData navigationBarThemeData() => NavigationBarThemeData(
    backgroundColor:  Colors.white,
    // surfaceTintColor:  Colors.white,
    indicatorColor:  AppColors.primaryColor,
    elevation: 5,
    labelTextStyle:
    MaterialStateProperty.resolveWith<TextStyle?>((states) {
      if(states.contains(MaterialState.selected)){
        return appTextThemes[AppTheme.light]?.bodyMedium?.copyWith(color: AppColors.primaryColor , fontSize: 12);
      }
      return appTextThemes[AppTheme.light]?.bodyMedium?.copyWith(color: AppColors.unselectedTabColor , fontSize: 12);
    }

    )

);