import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import '../../../../core/injection_container.dart' as di;
import '../../../../core/constants/app_constants.dart';
import '../../../../core/utils/app_icons.dart';

enum SettingsItemType {
  profile,
  phone,
  logout,
  delete,
}

extension SettingsItemData on SettingsItemType {
  String get tabTitle {
    switch (this) {
      case SettingsItemType.profile:
        return 'account_settings_title'.tr();
      case SettingsItemType.phone:
        return 'edit_phone'.tr();
      case SettingsItemType.logout:
        return 'logout'.tr();
      case SettingsItemType.delete:
        return 'delete_account'.tr();
      default:
        return 'account'.tr();
    }
  }

  IconData get icon {
    switch (this) {
      case SettingsItemType.profile:
        return AppIcons.wrench;
      case SettingsItemType.phone:
        return AppIcons.material_symbols_phone_android_outline_rounded;
      case SettingsItemType.logout:
        return AppIcons.union;
      case SettingsItemType.delete:
        return AppIcons.trash;
      default:
        return AppIcons.ue905_arcticons_settings;
    }
  }

  clickOnTab() {
    final context = AppConstants.navigatorKey.currentContext!;

    switch (this) {
      case SettingsItemType.profile:

        break;
      case SettingsItemType.phone:

        break;
      case SettingsItemType.logout:
        // context.read(di.userProvider.notifier).signOut();
        break;
      case SettingsItemType.delete:

        break;
    }
  }
}
