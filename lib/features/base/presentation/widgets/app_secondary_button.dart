import 'package:flutter/material.dart';
import '../../../../core/constants/app_colors.dart';

class AppSecondaryButton extends StatelessWidget {
  const AppSecondaryButton({Key? key, required this.buttonTitle, required this.onClick}) : super(key: key);

  final String buttonTitle;
  final Function onClick;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: (){onClick();},
        style: ElevatedButton.styleFrom(
            backgroundColor: Colors.white,
            shape: const RoundedRectangleBorder(
                side: BorderSide(color: AppColors.primaryColor),
                borderRadius: BorderRadius.all(Radius.circular(6))
            ),
          padding: const EdgeInsets.symmetric(vertical: 8)
        ),
        child: Text(
          buttonTitle,
          style: Theme.of(context).textTheme.labelMedium!.copyWith(fontWeight: FontWeight.w700,color: AppColors.primaryColor),
        )
    );
  }
} 
