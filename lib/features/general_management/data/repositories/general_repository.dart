import 'package:fantasy_store/features/general_management/data/data_sources/general_remote_data_source.dart';
import 'package:fantasy_store/features/general_management/data/model/feature_image.dart';
import 'package:dio/dio.dart';
import '../../../base/data/entities/base_api_result.dart';

class GeneralRepository {
  GeneralRemoteDataSource generalRemoteDataSource;

  GeneralRepository({required this.generalRemoteDataSource});

  Future<BaseApiResult> addProduct(params) async {
    return await generalRemoteDataSource.addProduct(params:params);
  }

}
