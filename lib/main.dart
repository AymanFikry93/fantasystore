import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'app.dart';
import 'app_init.dart';
import 'core/injection_container.dart' as di;
import 'core/utils/app_locales.dart';

void main() async {
  AppInit().initBeforeAppLaunching();
  runApp(
    ProviderScope(
      overrides: [
        di.sharedPreferencesProvider
            .overrideWithValue(await SharedPreferences.getInstance())
      ],
      child: EasyLocalization(
          startLocale: AppLocales.arabic.locale,
          supportedLocales: [
            AppLocales.english.locale,
            AppLocales.arabic.locale
          ],
          path: 'assets/translations',
          fallbackLocale: AppLocales.arabic.locale,
          child: MyApp()),
    ),
  );




}
