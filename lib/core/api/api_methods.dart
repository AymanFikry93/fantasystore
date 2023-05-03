import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import '../../features/base/data/entities/base_api_result.dart';
import 'api_config.dart';

abstract class ApiMethods {
  Future<BaseApiResult<T>> get<T>(String url,
      {Map<String, dynamic>? params,
      bool hasToken = true,
      bool cache = false,
      bool isWPApi = true}) async {
    try {
      Response response = await ApiConfig.dio.get(url,
          queryParameters: params,
          options:
              getOptions(cache: cache, hasToken: hasToken, isWPApi: isWPApi));
      debugPrint(response.toString());
      return handleResponse(response);
    } on DioError catch (error) {
      return catchError<T>(error);
    }
  }

  Future<BaseApiResult<List<T>>> getList<T>(String url,
      {Map<String, dynamic>? params,
      bool hasToken = true,
      bool cache = false,
      bool isWPApi = false}) async {
    try {
      debugPrint(params.toString());
      Response response = await ApiConfig.dio.get(url,
          queryParameters: params,
          options:
              getOptions(cache: cache, hasToken: hasToken, isWPApi: isWPApi));
      debugPrint(response.toString());
      return handleResponseList(response);
    } on DioError catch (error) {
      debugPrint(error.toString());
      return catchError<List<T>>(error);
    }
  }

  Future<BaseApiResult<T>> post<T>(String url,
      {Map<String, dynamic>? data,
      bool hasToken = true,
      bool cache = false,
      bool isWPApi = false}) async {
    try {
      debugPrint(data.toString());
      Response response = await ApiConfig.dio.post(url,
          data: data,
          options:
              getOptions(cache: cache, hasToken: hasToken, isWPApi: isWPApi));

      debugPrint(response.toString());
      return handleResponse(response);
    } on DioError catch (error) {
      debugPrint(error.toString());
      return catchError(error);
    }
  }

  Future<BaseApiResult<List<T>>> postList<T>(String url,
      {Map<String, dynamic>? data,
      bool hasToken = true,
      bool cache = false,
      bool isWPApi = false}) async {
    try {
      debugPrint(data.toString());
      Response response = await ApiConfig.dio.post(url,
          data: data,
          options:
              getOptions(cache: cache, hasToken: hasToken, isWPApi: isWPApi));

      debugPrint(response.toString());
      return handleResponseList(response);
    } on DioError catch (error) {
      debugPrint(error.toString());
      return catchError(error);
    }
  }

  Future<BaseApiResult<T>> put<T>(String url,
      {Map<String, dynamic>? data,
      bool hasToken = true,
      bool cache = false,
      bool isWPApi = false}) async {
    try {
      debugPrint(data.toString());
      Response response = await ApiConfig.dio.put(url,
          data: data,
          options:
              getOptions(cache: cache, hasToken: hasToken, isWPApi: isWPApi));

      debugPrint(response.toString());
      return handleResponse(response);
    } on DioError catch (error) {
      debugPrint(error.toString());
      return catchError(error);
    }
  }

  Future<BaseApiResult<T>> delete<T>(String url,
      {Map<String, dynamic>? data,
      bool hasToken = true,
      bool cache = false,
      bool isWPApi = false}) async {
    try {
      debugPrint(data.toString());
      Response response = await ApiConfig.dio.delete(url,
          data: data,
          options:
              getOptions(cache: cache, hasToken: hasToken, isWPApi: isWPApi));

      debugPrint(response.toString());
      return handleResponse(response);
    } on DioError catch (error) {
      debugPrint(error.toString());
      return catchError(error);
    }
  }

  Future<BaseApiResult<T>> postWithFormData<T>(String url,
      {required FormData data,
      bool hasToken = true,
      bool cache = false,
        bool isWPApi = false,
      bool isMedia = true,
      bool isUploadImg = false}) async {
    try {
      Response response = await ApiConfig.dio.post(url,
          data: data,
          options:
              getOptions(cache: cache, hasToken: hasToken, isWPApi: isWPApi, isUploadImg: isUploadImg));

      debugPrint("RESPONSE");
      debugPrint(response.toString());
      return handleFormResponse(response , isMedia:isMedia);
    } on DioError catch (error) {
      return catchError(error);
    }
  }

  Options getOptions(
      {bool cache = false, bool hasToken = true, bool isWPApi = false, bool isUploadImg= false}) {
    Map<String, dynamic> extras = {};
    extras[authorizationRequired] = hasToken;
    extras[wpApiKey] = isWPApi;
    extras[uploadImageKey] = isUploadImg;
    var options = Options(
        extra: extras, headers: hasToken ? {'Authorization': 'token'} : {});

    return options;
  }

  BaseApiResult<List<T>> handleResponseList<T>(Response response);

  BaseApiResult<T> handleResponse<T>(Response response);
  BaseApiResult<T>  handleFormResponse<T>(Response response, {bool isMedia=true});

  BaseApiResult<E> catchError<E>(DioError dioError);

  BaseApiResult<E> handleDioErrors<E>(DioError dioError);

  BaseApiResult<E> handleApiErrors<E>(DioError dioError);
}
