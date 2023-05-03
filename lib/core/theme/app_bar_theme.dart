import 'package:fantasy_store/core/constants/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'app_text_theme.dart';
import 'app_theme.dart';

AppBarTheme appBarTheme() => AppBarTheme(
    centerTitle: true,
    iconTheme: const IconThemeData(
      color: Colors.white,
    ),
    systemOverlayStyle: const SystemUiOverlayStyle(statusBarColor: AppColors.primaryColor,
        statusBarBrightness: Brightness.light, // For iOS (dark icons)
    ),
    color: AppColors.primaryColor,
    titleTextStyle:appTextThemes[AppTheme.light]?.titleLarge,
);