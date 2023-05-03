import 'package:fantasy_store/core/constants/app_constants.dart';
import 'package:flutter/material.dart';

mixin DialogManager{


  void showCustomDialog({required Widget child}){
    showDialog(context: AppConstants.navigatorKey.currentContext!, builder: (context) {
      return Dialog(
        shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(15))),
        elevation: 10,
        insetPadding: const EdgeInsets.all(0),
        child: child,
      ) ;
    },);
  }


}