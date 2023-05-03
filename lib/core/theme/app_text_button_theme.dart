import 'package:flutter/material.dart';
import '../constants/app_colors.dart';

TextButtonThemeData textButtonTheme() => TextButtonThemeData(
      style: ButtonStyle(
        padding: MaterialStateProperty.all<EdgeInsets>(
          const EdgeInsets.all(10)
        ),
        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
        foregroundColor: MaterialStateProperty.all<Color>(
          AppColors.primaryColor,
        ),
      ),
    );
