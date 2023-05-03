import 'package:fantasy_store/core/constants/app_colors.dart';
import 'package:flutter/material.dart';

ElevatedButtonThemeData elevatedButtonTheme() => ElevatedButtonThemeData(
      style: ButtonStyle(
        padding: MaterialStateProperty.all<EdgeInsetsDirectional>(
            const EdgeInsetsDirectional.all(8)),
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(6),
          ),
        ),
/*        backgroundColor: MaterialStateProperty.all<Color>(
          AppColors.primaryColor,
        ),*/
        backgroundColor:
            MaterialStateProperty.resolveWith((Set<MaterialState> states) {
          if (states.contains(MaterialState.disabled)) {
            return AppColors.disabledGrey;
          }else{
            return AppColors.primaryColor;
          }
        }),
        foregroundColor: MaterialStateProperty.all<Color>(
          Colors.white,
        ),
      ),
    );
