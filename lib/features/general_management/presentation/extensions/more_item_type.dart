import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import '../../../../core/constants/app_constants.dart';
import '../../../../core/utils/app_icons.dart';
import '../screens/about_us.dart';

enum MoreItemType {
  account,
  vetRequests,
  // phone,
  about,
  contact,
  // logout,
  login,
}

extension MoreItemData on MoreItemType {
  String get tabTitle {
    switch (this) {
      case MoreItemType.account:
        return 'manage_account'.tr();
      case MoreItemType.vetRequests:
        return 'vetRequests'.tr();
/*      case MoreItemType.phone:
        return 'edit_phone'.tr();*/
      case MoreItemType.about:
        return 'about_fantasy_store'.tr();
      case MoreItemType.contact:
        return 'contact_us'.tr();
/*      case MoreItemType.logout:
        return 'logout'.tr();*/
      case MoreItemType.login:
        return 'login'.tr();
      default:
        return 'account'.tr();
    }
  }

  IconData get icon {
    switch (this) {
      case MoreItemType.account:
        return AppIcons.ue905_arcticons_settings;
      case MoreItemType.vetRequests:
        return AppIcons.bi_person_add;
/*      case MoreItemType.phone:
        return AppIcons.material_symbols_phone_android_outline_rounded;*/
      case MoreItemType.about:
        return Icons.info_outline;
      case MoreItemType.contact:
        return AppIcons.icon__phone_;
/*      case MoreItemType.logout:
        return AppIcons.union;*/
      case MoreItemType.login:
        return AppIcons.union;
      default:
        return AppIcons.home;
    }
  }

  clickOnTab() async {
    final context = AppConstants.navigatorKey.currentContext!;
/*    if (this == MoreItemType.logout) {
      context.read(di.selectedNavigationItemTypeProvider.notifier).state =
          BottomNavigationItemType.home;
      context.read(di.userProvider.notifier).signOut();
    } else */

    /*else if (this == MoreItemType.phone) {
      Navigator.of(context).push(
        MaterialPageRoute(builder: (_) => const EditPhoneScreen()),
      );
    } */

     if (this == MoreItemType.about) {
      Navigator.of(context).push(
        MaterialPageRoute(builder: (_) => const AboutUs()),
      );
    }
  }

  bool get needLogin {
    switch (this) {
      case MoreItemType.account:
        return true;
      case MoreItemType.vetRequests:
        return true;
/*      case MoreItemType.phone:
        return true;*/
      case MoreItemType.about:
        return false;
      case MoreItemType.contact:
        return false;
      /*
      case MoreItemType.logout:
        return false;*/
      case MoreItemType.login:
        return false;
      default:
        return true;
    }
  }
}
