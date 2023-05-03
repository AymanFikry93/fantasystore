import 'package:flutter/material.dart';
import '../constants/app_colors.dart';

InputDecorationTheme appInputDecorationTheme() => InputDecorationTheme(
      suffixIconColor: AppColors.primaryColor,

      hintStyle: const TextStyle(
        fontSize: 16,
        color: AppColors.hintColor,
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(6),
        borderSide: const BorderSide(
          width: 1.5,
          color: Colors.black26,
        ),
      ),
      disabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(6),
        borderSide: const BorderSide(
          width: 1.5,
          color: Colors.black26,
        ),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(6),
        borderSide: const BorderSide(
          width: 1.5,
          color: Colors.black26,
        ),
      ),
      fillColor: AppColors.emptyTextFieldColor,
      filled: true,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(6),
        borderSide: const BorderSide(
          width: 1.5,
          color: Colors.black26,
        ),
      ),
      contentPadding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
    );
