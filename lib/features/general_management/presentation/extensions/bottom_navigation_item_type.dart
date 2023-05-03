import 'package:fantasy_store/features/general_management/presentation/screens/home.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import '../../../../core/utils/app_icons.dart';
import '../screens/more_screen.dart';

enum BottomNavigationItemType {
  home,
  // wallet,
  more,
}

extension BottomNavigationItemData on BottomNavigationItemType {
  bool showBottomTabs(bool isLoggedIn) {
/*   if(isLoggedIn){
      return true;
    } else if(this==BottomNavigationItemType.wallet){
     return false;
   }*/
    return true;
  }

  String get tabTitle {
    switch (this) {
      case BottomNavigationItemType.home:
        return 'home'.tr();
/*      case BottomNavigationItemType.wallet:
        return 'wallet'.tr();*/
      case BottomNavigationItemType.more:
        return 'more'.tr();
      default:
        return 'home'.tr();
    }
  }

  String get bottomTitle {
    switch (this) {
      case BottomNavigationItemType.home:
        return 'home'.tr();
/*      case BottomNavigationItemType.wallet:
        return 'wallet'.tr();*/
      case BottomNavigationItemType.more:
        return 'more'.tr();

      default:
        return 'home'.tr();
    }
  }

  IconData get icon {
    switch (this) {
      case BottomNavigationItemType.home:
        return AppIcons.home;
/*      case BottomNavigationItemType.wallet:
        return AppIcons.wallet;*/
      case BottomNavigationItemType.more:
        return AppIcons.more;
      default:
        return Icons.home;
    }
  }

  int get index {
    switch (this) {
      case BottomNavigationItemType.home:
        return 0;
/*      case BottomNavigationItemType.wallet:
        return 1;*/
      case BottomNavigationItemType.more:
        return 2;
      default:
        return 0;
    }
  }

  Widget getScreen(BuildContext context) {
    switch (this) {
      case BottomNavigationItemType.home:
        return const Home();
/*      case BottomNavigationItemType.wallet:
        return   const WalletScreen();*/
      case BottomNavigationItemType.more:
        return const MoreScreen();
      default:
        return const Home();
    }
  }

  static BottomNavigationItemType getTypeFromIndex(
      int index, BuildContext context) {
    if (index == BottomNavigationItemType.home.index) {
      return BottomNavigationItemType.home;
    }
    /*else if (index == BottomNavigationItemType.wallet.index) {
      return BottomNavigationItemType.wallet;
    } */
    else if (index == BottomNavigationItemType.more.index) {
      return BottomNavigationItemType.more;
    } else {
      return BottomNavigationItemType.home;
    }
  }
}
