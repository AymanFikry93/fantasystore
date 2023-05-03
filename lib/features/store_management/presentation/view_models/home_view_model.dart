import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../base/data/entities/base_api_result.dart';
import '../../../base/data/entities/base_state.dart';
import '../../../base/presentation/view_models/base_view_model.dart';
import '../../../general_management/data/repositories/general_repository.dart';
import 'package:firebase_database/firebase_database.dart';

import '../../data/entities/home_store_state.dart';
import '../../data/model/category.dart';

class HomeViewModel extends StateNotifier<BaseState<HomeStoreState>>
    with BaseViewModel {
  HomeViewModel(this._generalRepository)
      : super(BaseState(data: HomeStoreState()));

  final GeneralRepository _generalRepository;


  Future<void> addProduct() async {
    final url = Uri.parse(
        'https://shopapp-24a6a-default-rtdb.firebaseio.com/products.json');
    BaseApiResult result = await _generalRepository.addProduct(
      {
        'title':" product.title",
        'description':" product.description",
        'imageUrl':" product.imageUrl",
        'price':50,
        // 'isFavorite': product.isFavourite,
        "categoryId": 2,
      },
    );
    if (result.data != null) {
    } else {}

  }

  Future<void> addProductReal() async {
    DatabaseReference ref = FirebaseDatabase.instance.ref("categories");
    DatabaseReference   pushRef =ref.push();
    await pushRef.set( {
      'title':" الرياضة",
      'description':"هدوم شتوي لممارسة كره القدم والرياضات",
      'imageUrl':"https://www.daytondailynews.com/lifestyles/clothes-that-work-accepts-a-wide-variety-of-clothing-and-accessories/LMGRYYLJYVBAJJE7MGMDJON6EE/",
    });
    print("addProductRealTime");
  }

  Future<void> getCategories() async {
    DatabaseReference productsRef = FirebaseDatabase.instance.ref("categories");
   List<CategoryModel> categories=[];
    productsRef.onValue.listen((DatabaseEvent event) {
      Map<dynamic, dynamic>  categoriesMapData = event.snapshot.value as Map ;
      categoriesMapData.forEach((key, values) {
        print("categoriesMapData value $values");
        categories.add(CategoryModel.fromSnapshot(values));
     });
      state=state.copyWith(data: state.data.copyWith(categoryList:categories ));
    });
  }

}
