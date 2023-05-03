import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';
import '../../../base/data/entities/base_state.dart';
import '../../../base/presentation/screens/screen_handler.dart';
import '../../../base/presentation/widgets/app_toolbar.dart';

class AboutUs extends ConsumerStatefulWidget {
  const AboutUs({Key? key}) : super(key: key);

  static const routeName = "/about_us" ;

  @override
  ConsumerState<AboutUs> createState() => ContactUsState();
}

class ContactUsState extends ConsumerState<AboutUs> {


  @override
  void initState(){
    super.initState();


  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppToolBar(title: "about_fantasy_store".tr()),

    );
  }
}
