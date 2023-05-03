import 'package:fantasy_store/core/api/api_urls.dart';
import '../../../../core/api/default_api_methods_impl.dart';
import '../../../base/data/entities/base_api_result.dart';
import '../model/city.dart';
import '../model/feature_image.dart';
import '../model/region.dart';
import 'package:dio/dio.dart';


class GeneralRemoteDataSource {
  DefaultApiMethodsImpl defaultApiMethodsImpl;

  GeneralRemoteDataSource({required this.defaultApiMethodsImpl});


  Future<BaseApiResult> addProduct({params}) async {
    return await defaultApiMethodsImpl.post(
        ApiUrls.products,
        hasToken: false,
        data: params
    );
  }

}
