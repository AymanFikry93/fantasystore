import 'package:flutter/material.dart';

class AppTabBar extends StatelessWidget  implements PreferredSizeWidget {
  final Widget? tabs;

  const AppTabBar({
    Key? key,
    this.tabs,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return
      Container(
        color: Colors.white,
        child: Container(
            //margin: EdgeInsets.all(16.w),
            decoration: BoxDecoration(
            color: Colors.grey[300],
            borderRadius: BorderRadius.circular(
              6.0,
            ),
          ),
          child: tabs

        ),
      )


    ;
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
