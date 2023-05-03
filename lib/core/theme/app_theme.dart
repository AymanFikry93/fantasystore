import 'package:fantasy_store/core/constants/app_constants.dart';
import 'package:fantasy_store/core/theme/app_bottom_sheet_theme.dart';
import 'package:fantasy_store/core/theme/app_elevated_button_theme.dart';
import 'package:fantasy_store/core/theme/app_input_decoration_theme.dart';
import 'package:fantasy_store/core/theme/app_text_button_theme.dart';
import 'package:fantasy_store/core/theme/snack_bar_theme.dart';
import 'package:fantasy_store/core/theme/tab_bar_theme.dart';
import 'package:fantasy_store/core/theme/text_selection_theme.dart';
import 'package:flutter/material.dart';
import '../constants/app_colors.dart';
import 'app_bar_theme.dart';
import 'app_navigation_bar_theme.dart';
import 'app_text_theme.dart';
import 'card_theme.dart';
import 'list_tile_theme.dart';

enum AppTheme {
  light,
  dark,
}

Map<AppTheme, ThemeData> appThemes = {
  AppTheme.light: ThemeData(
    useMaterial3: true,
    fontFamily: AppConstants.fontFamily,
    pageTransitionsTheme: const PageTransitionsTheme(
        builders: ({
      TargetPlatform.android: FadeUpwardsPageTransitionsBuilder(),
    })),
    floatingActionButtonTheme: const FloatingActionButtonThemeData(
      backgroundColor:  AppColors.primaryColor,
    ),

    textSelectionTheme: textSelectionThemeData(),
    cardTheme: cardThemeData(),
    bottomSheetTheme: appBottomSheetTheme(),
    inputDecorationTheme: appInputDecorationTheme(),
    elevatedButtonTheme: elevatedButtonTheme(),
    textButtonTheme: textButtonTheme(),
    appBarTheme: appBarTheme(),
    navigationBarTheme: navigationBarThemeData(),
    tabBarTheme: tabBarTheme(),
    iconTheme: const IconThemeData(color: Colors.white),
    listTileTheme: listTileTheme(),
    snackBarTheme: snackBarThemeData(),
    primaryColor: AppColors.primaryColor,
    primaryColorDark: AppColors.primaryColor,
    scaffoldBackgroundColor: AppColors.scaffoldBackground,
    canvasColor: AppColors.canvasColor, //bottom tabs bg - bottom sheet -dropdown bg
    cardColor: Colors.white, //AppColors.primaryColor, // card bg - elevated bg -app bar -tab bar
    highlightColor: AppColors.hintColor,
    // when selected tab bar color
    dividerColor: AppColors.hintColor,
    // divider
    errorColor: AppColors.errorColor,
    // error
    hintColor: AppColors.hintColor,
    //hint
    indicatorColor: Colors.white,
    //tab bar indicatorColor
    backgroundColor: AppColors.emptyTextFieldColor,
    // unselected widget color
    unselectedWidgetColor: AppColors.hintColor,
    //unselected bottom tabs WidgetColor
    toggleableActiveColor: AppColors.primaryColor,
    //selected check box
    hoverColor: AppColors.hoverColor,
    focusColor: AppColors.primaryColor,
    bottomAppBarColor: AppColors.primaryColor,
    splashColor: Colors.transparent,
    selectedRowColor: Colors.orange,
    secondaryHeaderColor: Colors.orange,
    disabledColor: AppColors.disabledColor,
    dialogBackgroundColor: AppColors.dialogBackground,
    primaryColorLight: AppColors.primaryColor,
    primarySwatch: const MaterialColor(
      0xff777777,
      <int, Color>{
        50: Color(0xff777777),
        100: Color(0xff777777),
        200: Color(0xff777777),
        300: Color(0xff777777),
        400: Color(0xff777777),
        500: Color(0xff777777),
        600: Color(0xff777777),
        700: Color(0xff777777),
        800: Color(0xff777777),
        900: Color(0xff777777),
      },
    ),
    visualDensity: VisualDensity.adaptivePlatformDensity,
    textTheme: appTextThemes[AppTheme.light],
  ),
};


