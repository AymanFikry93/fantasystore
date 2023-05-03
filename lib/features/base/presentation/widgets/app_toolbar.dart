import 'package:flutter/material.dart';
import '../../../../core/constants/app_colors.dart';

class AppToolBar extends StatelessWidget  implements PreferredSizeWidget {
  final String? title;
  final bool hasTitle;
  final bool showSearch;
  final bool showNotification;
  final Widget? leading;
  final List<Widget>? actions;
  final Function? onBackButtonClick;

  const AppToolBar({
    Key? key,
    this.title,
    this.hasTitle = true,
    this.showSearch = false,
    this.showNotification = false,
    this.leading,
    this.actions,
    this.onBackButtonClick,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return AppBar(
        title: hasTitle?Text(
          title ?? '',
          overflow: TextOverflow.ellipsis,
          maxLines: 1,
          style: Theme.of(context).textTheme.labelMedium!.copyWith(color: AppColors.scaffoldBackground),
        ):null,
        // leading: leading ,
        leading: GestureDetector(
            onTap: (){
              if(onBackButtonClick != null){
                onBackButtonClick!();
              }else{
                debugPrint("back");
                ModalRoute.of(context)?.isFirst??false ? null : Navigator.pop(context) ;
              }
          },child: const Icon(Icons.arrow_back_ios, color: Colors.white,)
        ),

        actions: [
          ...actions ?? [],
        ]
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
