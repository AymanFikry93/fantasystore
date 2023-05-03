import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/constants/app_assets.dart';
import '../../../../core/constants/app_constants.dart';
import '../../../base/data/entities/base_state.dart';
import '../../../base/helpers/mixins/dialog_manager.dart';
import '../../../base/presentation/screens/screen_handler.dart';
import '../../../base/presentation/widgets/app_cached_network_image.dart';
import '../extensions/bottom_navigation_item_type.dart';
import '../extensions/more_item_type.dart';
import '../widgets/more_item.dart';
import '../../../../core/injection_container.dart' as di;

class MoreScreen extends StatefulWidget {
  static const String routeName = "/MoreScreen";

  const MoreScreen({super.key});

  @override
  State<MoreScreen> createState() => _MoreScreenState();
}

class _MoreScreenState extends State<MoreScreen> with DialogManager {


  @override
  void initState() {
    // TODO: implement initState

    super.initState();
  }




  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Stack(
          children: [
            Column(
              children: [
                Stack(
                  alignment: Alignment.center,
                  children: [
                    SizedBox(
                      height: 230.h,
                      width: MediaQuery.of(context).size.width,
                      child: Image.asset(
                        AppAssets.bgCurve.imagePath,
                        fit: BoxFit.fill,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 10.h,
                ),
                SizedBox(
                  height: 10.h,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }


}

