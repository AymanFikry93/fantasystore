

import '../model/Product.dart';
import '../model/category.dart';

class HomeStoreState {
  List<CategoryModel>? categoryList;
  List<Product>? specialOffers;
  List<Product>? popularProducts;


  HomeStoreState({
     this.categoryList,
    this.specialOffers,
    this.popularProducts,
  });

  HomeStoreState copyWith({
    List<CategoryModel>? categoryList,
    List<Product>? specialOffers,
    List<Product>? popularProducts,
  }) {
    return HomeStoreState(
        categoryList: categoryList ?? this.categoryList,
        specialOffers: specialOffers ?? this.specialOffers,
        popularProducts: popularProducts ?? this.popularProducts
    );
  }
}
