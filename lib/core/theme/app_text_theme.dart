import 'package:flutter/material.dart';
import '../constants/app_colors.dart';
import 'app_theme.dart';

Map<AppTheme, TextTheme> appTextThemes = {
  AppTheme.light: const TextTheme(
    /// the display will use the textHeadlineColor (4f4f)
    displaySmall: TextStyle(
      fontSize: 14.0,
      color: AppColors.textHeadlineColor,
      fontWeight: FontWeight.w500,
    ),
    displayMedium: TextStyle(
      //Selected Time inside Time Picker
      fontSize: 16.0,
      color: AppColors.textHeadlineColor,
      fontWeight: FontWeight.w500,
    ),
    displayLarge: TextStyle(
      fontSize: 18.0,
      color: AppColors.textHeadlineColor,
      fontWeight: FontWeight.w500,

    ),

    /// the headline will use the smallHeadLineColor (3535)
    headlineSmall: TextStyle(
      //text field / dropdown / form element (title)
      color: AppColors.smallHeadLineColor,
      fontSize: 14,
      fontWeight: FontWeight.w500,
    ),
    headlineMedium: TextStyle(
      fontSize: 16.0,
      color: AppColors.smallHeadLineColor,
      fontWeight: FontWeight.w500,
    ),
    headlineLarge: TextStyle(
      color: AppColors.smallHeadLineColor,
      fontSize: 18,
      fontWeight: FontWeight.w500,
    ),

    titleSmall: TextStyle(
      fontSize: 14.0,
      color: AppColors.tileTitleColor,
      fontWeight: FontWeight.w500,
    ),
    titleMedium: TextStyle(
      //for CheckboxListTile -listtile title and text field text , DropdownMenuItem
      fontSize: 16.0,
      color: AppColors.tileTitleColor,
      fontWeight: FontWeight.w500,
    ),
    titleLarge: TextStyle(
      // appBar Title(color not affect),
      fontSize: 18.0,
      color: AppColors.tileTitleColor,
      fontWeight: FontWeight.w500,
    ),


    bodySmall: TextStyle(
      //  CheckboxListTile-Listtile subtitle
      fontSize: 14.0,
      color: AppColors.hintColor,
      fontWeight: FontWeight.w500,
    ),
    bodyMedium: TextStyle(
      //default text - trailing - leading
      fontSize: 16.0,
      color: AppColors.hintColor,
      fontWeight: FontWeight.w500,
    ),
    bodyLarge: TextStyle(
      // tab bar title TimePicker Numbers (Clock)
      fontSize: 18.0,
      color: AppColors.hintColor,
      fontWeight: FontWeight.w500,
    ),

    /// this label will use color hintColor (7777) except the label small which work on error color
    labelSmall: TextStyle(
      //error
      fontSize: 14.0,
      color: AppColors.errorColor,
      fontWeight: FontWeight.w500,
    ),
    labelMedium: TextStyle(
      fontSize: 16.0,
      color: AppColors.hintColor,
      fontWeight: FontWeight.w500,
    ),
    labelLarge: TextStyle(
      fontSize: 18.0,
      color: AppColors.hintColor,
      fontWeight: FontWeight.w500,
    ),

  ),
};
