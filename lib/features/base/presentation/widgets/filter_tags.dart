import 'package:fantasy_store/core/constants/app_colors.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class FilterTags extends StatelessWidget {
final String title;
final Function onDeleted;

  const FilterTags({super.key, required this.title , required this.onDeleted});
  @override
   build(BuildContext context){
    return Container(
      margin: const EdgeInsets.only(left: 5),
      child: Chip(
        backgroundColor: AppColors.chipColor,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        deleteIcon: const Icon( Icons.close, size: 12,),
        deleteIconColor: Colors.grey,
        onDeleted: (){
          onDeleted();
        },

        label: Text(title.toString().tr(), style: Theme.of(context).textTheme.titleSmall?.copyWith(
          fontSize: 13, color: AppColors.primaryColor,
        ),)
        ,
      ),
    );
  }
}
