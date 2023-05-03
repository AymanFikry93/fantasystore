import 'package:flutter/material.dart';

CardTheme cardThemeData() => const CardTheme(
    color: Colors.white,
    elevation: 0,
    shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(10.0))
    )
);