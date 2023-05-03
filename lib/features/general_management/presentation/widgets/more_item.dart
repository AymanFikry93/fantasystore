import 'package:flutter/material.dart';
import 'dart:math' as math;

import '../extensions/more_item_type.dart';

class MoreItem extends StatelessWidget {
  const MoreItem(
      {super.key,
      required this.moreItem,
      required this.onTap,
      required this.isLoggedIn});

  final MoreItemType moreItem;
  final Function? onTap;
  final bool isLoggedIn;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 6, horizontal: 20),
      child: ListTile(
        // onTap: (){},
        leading: moreItem == MoreItemType.login
            ? Transform(
                alignment: Alignment.center,
                transform: Matrix4.rotationY(math.pi),
                child: Icon(moreItem.icon),
              )
            : Icon(moreItem.icon),
        title: Text(
          /*(moreItem == MoreItemType.logout && !isLoggedIn)
              ? "login".tr()
              : */
          moreItem.tabTitle,
        ),
        minLeadingWidth: 0,
        trailing: /*moreItem == MoreItemType.logout
            ? null
            : */
            const Icon(Icons.arrow_forward_ios),
      )
    )
        // .rounded()
        ;
  }
}
