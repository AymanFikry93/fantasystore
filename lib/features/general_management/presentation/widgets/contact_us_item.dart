import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/constants/app_colors.dart';

class ContactUsItem extends StatelessWidget {
  const ContactUsItem({
    Key? key, required this.text, required this.iconData, required this.onClick,this.location = false
  }) : super(key: key);

  final String text;
  final IconData iconData;
  final Function onClick;
  final bool location;

  List<Widget> children(BuildContext context) => [
    Text(text,style: Theme.of(context).textTheme.titleMedium!.copyWith(color: AppColors.primaryColor)),
    const SizedBox(width: 8,),
    Icon(iconData,color: AppColors.primaryColor),
  ];

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: GestureDetector(
          onTap: (){onClick();},
          child: Container(
            decoration: BoxDecoration(
              color: AppColors.emptyTextFieldColor,
              borderRadius: BorderRadius.all(Radius.circular(6.r)),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 10,horizontal: 5),
              child: Row(
                  mainAxisAlignment: location? MainAxisAlignment.start : MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: location ? children(context).reversed.toList() : children(context)
              ),
            ),
          ),
        )
    );
  }
}
