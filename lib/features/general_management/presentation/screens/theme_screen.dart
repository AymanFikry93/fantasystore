import 'package:easy_localization/easy_localization.dart';
import 'package:fantasy_store/features/base/presentation/view_models/base_view_model.dart';
import 'package:fantasy_store/features/general_management/presentation/screens/home.dart';
import 'package:fantasy_store/features/store_management/presentation/screens/home/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/constants/app_assets.dart';
import '../../../../core/constants/app_constants.dart';
import '../../../../core/injection_container.dart' as di;
import 'package:fantasy_store/core/extensions/context_extension.dart';
import 'bottom_tab_screen.dart';

class ThemeScreen extends StatefulWidget {
  const ThemeScreen({Key? key}) : super(key: key);

  static const routeName = "/ThemeScreen";

  @override
  State<ThemeScreen> createState() => _ThemeScreenState();
}

class _ThemeScreenState extends State<ThemeScreen> with BaseViewModel {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // navigate();

  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  final TextEditingController _userNameController = TextEditingController();

  final TextEditingController _passwordController = TextEditingController();

  var items = [
    'Item 1',
    'Item 2',
    'Item 3',
    'Item 4',
    'Item 5',
  ];
  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final bool useMaterial3 = theme.useMaterial3;
    final ColorScheme scheme = theme.colorScheme;
    print(scheme);
    return
      DefaultTabController(
        length: 2,
        child: GestureDetector(
          onTap: hideKeyboard,
          child:
          Stack(
            children: [
              Scaffold(
                appBar: AppBar(title: const Text("Login"),
                  bottom: const TabBar(
                    tabs: [
                      Tab(
                        icon: Icon(Icons.directions_bike),
                        text: "Home",
                      ),
                      Tab(
                        icon: Icon(
                          Icons.directions_car,
                        ),
                        text: "search",
                      ),
                    ],
                  ),
                ),
                bottomNavigationBar:
                BottomNavigationBar(
                  currentIndex: 0,
                  items: const <BottomNavigationBarItem>[
                    BottomNavigationBarItem(
                      icon: Icon(Icons.home),
                      label: "home",
                    ),
                    BottomNavigationBarItem(
                      icon: Icon(Icons.search),
                      label: "search",
                    ),
                  ],
                ),
                bottomSheet: Container(child: const Text("bottomSheet"),),
                floatingActionButton:  FloatingActionButton(
                  child:  const Icon(Icons.check),
                  onPressed: (){},

                ),
                body: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  height: ScreenUtil().screenHeight,
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        const SizedBox(height: 10,),
                        Center(
                          child: Text(
                            'el mawashy'.tr(),
                            style: const TextStyle(),
                          ),
                        ),
                        CircularProgressIndicator(),
                        CheckboxListTile(
                          onChanged: (v){},
                          value: true,
                          title: Text("ture"),
                          subtitle: Text("aaa"),
                        ),
                        CheckboxListTile(
                          onChanged: (v){},
                          value: false,
                          title: Text("false"),
                          subtitle: Text("aaa"),
                        ),
                        Slider(value: 10,
                            max: 20,
                            onChanged: (v){}),
                        const Chip(label: Text("Chip") ),
                        Divider(height: 15, thickness: 10,),
                        Container(
                          padding: const EdgeInsets.all(15),
                          decoration: const BoxDecoration(
                          ),
                          child:  Text(
                            'Log_to_account'.tr(),
                          ),
                        ),
                        const TextField(
                          decoration: InputDecoration(hintText: "hintText " ,
                              errorText: "errorText"
                          ),
                        ),
                        DropdownButton(
                          value: 'Item 2',
                          icon: const Icon(Icons.keyboard_arrow_down),
                          items: items.map((String items) {
                            return DropdownMenuItem(
                              value: items,
                              child: Text(items),
                            );
                          }).toList(),
                          onChanged: (a){},

                        ),
                        InkWell(
                          onTap: (){
                            // navigateToScreen( TestCirclesScreen.routeName);
                          },
                          child: Card(
                            // color: scheme.primaryContainer,
                            margin: const EdgeInsets.all(15),
                            child:
                            Padding(
                              padding: const EdgeInsets.all(15.0),
                              child: Text(
                                'el mawashy card '.tr(),
                              ),
                            )
                            ,),
                        ),
                        ListTile(
                          leading:  Text(
                            'leading'.tr(),
                          ),
                          title:  Text(
                            ' title'.tr(),
                          ),
                          subtitle: Text(
                            'ListTile subtitle'.tr(),
                          ),
                          trailing: Text(
                            'trailing'.tr(),
                          ),
                        ),
                        buildActionButton(context),
                        GestureDetector(
                          child: Text(
                            "Forgot_password".tr(),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      );
  }

  void _modalBottomSheetMenu(){
    showModalBottomSheet(
        context: context,
        builder: (builder){
          return  Container(
            height: 350.0,
            // color: Colors.transparent, //could change this to Color(0xFF737373),
            //so you don't have to change MaterialApp canvasColor
            child: Container(
              // color: Colors.white,
                decoration: const BoxDecoration(
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(10.0),
                        topRight: Radius.circular(10.0))),
                child: const Center(
                  child: Text("This is a modal sheet"),
                )),
          );
        }
    );
  }

  buildActionButton(BuildContext context) {
    return SizedBox(
      width: ScreenUtil().screenWidth,
      child: ElevatedButton(
        child: Text("Sign_in".tr(),
        ),
        onPressed: () {
          _modalBottomSheetMenu();
        },
      ),
    );
  }


}

