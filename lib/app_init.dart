import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fantasy_store/core/injection_container.dart' as di;
import 'core/constants/app_constants.dart';

class AppInit {

  static final AppInit _appInit = AppInit._internal();

  factory AppInit() {
    return _appInit;
  }

  AppInit._internal();

  Future initBeforeAppLaunching() async {
    WidgetsFlutterBinding.ensureInitialized();
    await Firebase.initializeApp();
    await EasyLocalization.ensureInitialized();
    await ScreenUtil.ensureScreenSize();
  }

  void initAfterAppLaunching(){
    Future.delayed(const Duration(milliseconds: 500), () {
      ProviderScope.containerOf(AppConstants.navigatorKey.currentContext!, listen: false)
       .read(di.isConnectedProvider.notifier)
            .listenToNetworkChanges();    });
  }
}