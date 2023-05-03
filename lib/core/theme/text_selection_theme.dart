import 'package:flutter/material.dart';
import '../constants/app_colors.dart';

TextSelectionThemeData textSelectionThemeData() =>  TextSelectionThemeData(
    selectionColor: Colors.black54.withOpacity(0.3),
    cursorColor:  AppColors.primaryColor,
    selectionHandleColor:   Colors.black54,
);