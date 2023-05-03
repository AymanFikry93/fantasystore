import 'package:fantasy_store/core/constants/app_colors.dart';
import 'package:flutter/material.dart';

extension WidgetModifier on Widget {
  GestureDetector rounded({bool selected=false, Function? onTap ,double borderRadius=6 }) {
    return GestureDetector(
      onTap: (){
        if(onTap!=null) {onTap();}
      },
      child: Container(
        decoration: BoxDecoration(
          color: selected ? Colors.white : AppColors.emptyTextFieldColor,
          border: Border.all(color: selected ? AppColors.primaryColor : AppColors.emptyTextFieldColor),
          borderRadius:  BorderRadius.all(Radius.circular(borderRadius)),
        ),
        child: this,
      ),
    );
  }
}
