import 'package:fantasy_store/core/extensions/context_extension.dart';
import 'package:flutter/material.dart';

import 'components/body.dart';
import 'package:fantasy_store/core/injection_container.dart' as di;

class StoreHomeScreen extends StatefulWidget {
  static const  String routeName = "/StoreHomeScreen";

  @override
  State<StoreHomeScreen> createState() => _StoreHomeScreenState();
}

class _StoreHomeScreenState extends State<StoreHomeScreen> {



  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    getProducts();
  }

  getProducts() async {
    Future.delayed(const Duration(milliseconds: 150), () async {
      // context.read(homeProviderViewModel.notifier).addProduct();
      // context.read(di.homeProviderViewModel.notifier).addProductReal();
      context.read(di.homeProviderViewModel.notifier).getCategories();

    });
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Body(),
      // bottomNavigationBar: CustomBottomNavBar(selectedMenu: MenuState.home),
    );
  }
}
