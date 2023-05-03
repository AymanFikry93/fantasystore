
import 'package:easy_localization/easy_localization.dart';

import '../../features/general_management/data/model/city.dart';
import '../../features/general_management/data/model/feature_image.dart';
import '../../features/general_management/data/model/region.dart';


extension JsonParser on Map<String, dynamic> {
  V? parse<V>() {
    switch (V) {
      case City:
        return City.fromJson(this) as V;
      case Region:
        return Region.fromJson(this) as V;

      case FeatureImage:
        return  FeatureImage.fromJson(this) as V;


    }
    return null;
  }
}



