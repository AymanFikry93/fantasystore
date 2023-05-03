import 'package:fantasy_store/core/constants/app_colors.dart';
import 'package:fantasy_store/features/base/helpers/mixins/dialog_manager.dart';
import 'package:fantasy_store/features/base/presentation/view_models/base_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../extensions/bottom_navigation_item_type.dart';
import '../../../../core/injection_container.dart' as di;

class BottomTabScreen extends ConsumerStatefulWidget with BaseViewModel {
  static const String routeName = "/BottomTabScreen";

  const BottomTabScreen({super.key});

  @override
  ConsumerState<BottomTabScreen> createState() => _BottomTabScreenState();
}

class _BottomTabScreenState extends ConsumerState<BottomTabScreen>
    with BaseViewModel, DialogManager {
  final pageController = PageController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Future.delayed(Duration.zero, () {
      pageController.jumpToPage(
          ref.read(di.selectedNavigationItemTypeProvider.notifier).state.index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Consumer(builder: (_, ref, __) {
      BottomNavigationItemType bottomNavigationItemType =
          ref.watch(di.selectedNavigationItemTypeProvider);
/*      bool isLoggedIn =
          AppConstants.navigatorKey.currentContext?.read(di.userProvider)?.id !=
              null;*/
      return Scaffold(
          body: PageView(
              controller: pageController,
              onPageChanged: (v) {},
              physics: const NeverScrollableScrollPhysics(),
              children: BottomNavigationItemType.values
                  .map((e) => e.getScreen(context))
                  .toList()),
          bottomNavigationBar:
              // bottomNavigationItemType.showBottomTabs(isLoggedIn) ?
              NavigationBar(
            selectedIndex: bottomNavigationItemType.index,
            height: 70.h,
            backgroundColor: AppColors.emptyTextFieldColor,
            surfaceTintColor: AppColors.emptyTextFieldColor,
            onDestinationSelected: (int index) {
/*              if (!isLoggedIn && index == 1) {
*/ /*                ref.read(di.selectedNavigationItemTypeProvider.notifier).state =
                    BottomNavigationItemType.values[0];
                navigateToScreen(LoginScreen.routeName, removeTop: true);*/ /*
                showCustomDialog(child: LoginToContinueDialog());
              } else {
                ref.read(di.selectedNavigationItemTypeProvider.notifier).state =
                    BottomNavigationItemType.values[index];
                pageController.jumpToPage(index);
              }*/
              ref.read(di.selectedNavigationItemTypeProvider.notifier).state =
              BottomNavigationItemType.values[index];
              pageController.jumpToPage(index);
            },
            destinations: BottomNavigationItemType.values
                .map((item) => NavigationDestination(
                      selectedIcon: Icon(
                        item.icon,
                        color: Colors.white,
                      ),
                      icon: Icon(
                        item.icon,
                        color: AppColors.unselectedTabColor,
                      ),
                      label: item.bottomTitle,
                    ))
                .toList(),
          )
          // :null,
          );
    });
  }
}
