import 'package:easy_localization/easy_localization.dart';
import 'package:fantasy_store/core/extensions/context_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/constants/app_constants.dart';
import '../../../base/data/entities/base_state.dart';
import '../../../base/presentation/view_models/base_view_model.dart';
import '../../../../core/injection_container.dart' as di;
import '../../../store_management/data/entities/home_store_state.dart';
import '../../../store_management/presentation/view_models/home_view_model.dart';
import '../widgets/home_item.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  static const routeName = "/home";

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home>
    with BaseViewModel {

  var homeProviderViewModel = StateNotifierProvider<HomeViewModel, BaseState<HomeStoreState>>(
    (ref) {
      return HomeViewModel(ref.read(di.generalRepositoryProvider));
    },
  );

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    addProduct();
  }

  addProduct() async {
    Future.delayed(const Duration(milliseconds: 150), () async {
      // context.read(homeProviderViewModel.notifier).addProduct();
      // context.read(homeProviderViewModel.notifier).addProductReal();
      // context.read(homeProviderViewModel.notifier).getProducts();

    });
  }

  ValueNotifier<bool> animateNotifier = ValueNotifier<bool>(false);

  @override
  void dispose() {
    animateNotifier.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }
}
