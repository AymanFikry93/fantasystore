import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import '../../features/base/data/entities/api_error_type.dart';
import '../../features/base/data/entities/base_api_result.dart';
import '../../features/base/data/models/base_list_response.dart';
import '../../features/base/data/models/base_response.dart';
import '../../features/base/data/models/default_error_response.dart';
import 'api_methods.dart';

class DefaultApiMethodsImpl extends ApiMethods {
  DefaultApiMethodsImpl() : super();

  @override
  BaseApiResult<List<T>> handleResponseList<T>(Response response) {
    var responseData = response.data;
    debugPrint("response data : $responseData");
    if (responseData == null) {
      return BaseApiResult<List<T>>(errorType: ApiErrorType.generalError);
    }

    BaseListResponse<T> baseResponse =
        BaseListResponse<T>.fromJson(responseData);
    return BaseApiResult<List<T>>(data: baseResponse.data);
  }

  @override
  BaseApiResult<T> handleResponse<T>(Response response) {
    var responseData = response.data;
    if (responseData == null) {
      return BaseApiResult<T>(errorType: ApiErrorType.generalError);
    }
    if (responseData is Map<String, dynamic>) {
      BaseResponse<T> baseResponse = BaseResponse<T>.fromJson(responseData);
      debugPrint("data : ${baseResponse.data}");
      return BaseApiResult<T>(
          data: baseResponse.data, successMessage: baseResponse.successMessage);
    }
    return BaseApiResult<T>(errorType: ApiErrorType.generalError);
  }

  @override
  BaseApiResult<T> handleFormResponse<T>(Response response,
      {bool isMedia = true}) {
    var responseData = response.data;
    if (responseData == null) {
      return BaseApiResult<T>(errorType: ApiErrorType.generalError);
    }
    if (responseData is Map<String, dynamic>) {
      BaseResponse<T> baseResponse =
          BaseResponse<T>.fromJson(responseData, isMedia: isMedia);
      debugPrint("data : ${baseResponse.data}");
      return BaseApiResult<T>(
          data: baseResponse.data, successMessage: baseResponse.successMessage);
    }
    return BaseApiResult<T>(errorType: ApiErrorType.generalError);
  }

  @override
  BaseApiResult<E> catchError<E>(DioError dioError) {
    if (dioError.type == DioErrorType.badResponse) {
      return handleApiErrors(dioError);
    } else {
      return handleDioErrors(dioError);
    }
  }

  @override
  BaseApiResult<E> handleDioErrors<E>(DioError dioError) {
    if (dioError.type == DioErrorType.connectionTimeout) {
      return BaseApiResult<E>(errorType: ApiErrorType.noNetworkError);
    } else if (dioError.type == DioErrorType.receiveTimeout) {
      return BaseApiResult<E>(errorType: ApiErrorType.noNetworkError);
    } else if (dioError.type == DioErrorType.sendTimeout) {
      return BaseApiResult<E>(errorType: ApiErrorType.noNetworkError);
    } else if (dioError.type == DioErrorType.cancel) {
      return BaseApiResult<E>(errorType: ApiErrorType.generalError);
    } else if (dioError.type == DioErrorType.unknown) {
      return BaseApiResult<E>(errorType: ApiErrorType.generalError);
    } else {
      return BaseApiResult<E>(errorType: ApiErrorType.generalError);
    }
  }

  @override
  BaseApiResult<E> handleApiErrors<E>(DioError dioError) {
    debugPrint(dioError.response.toString());
    var responseData = dioError.response?.data;
    if (responseData == null) {
      return BaseApiResult<E>(errorType: ApiErrorType.generalError);
    }
    debugPrint(dioError.response?.statusCode.toString());
    DefaultErrorResponse baseResponse =
        DefaultErrorResponse.fromJson(responseData);
    return BaseApiResult<E>(
      errorType: getErrorFromCode(dioError.response?.statusCode),
      errorMessage: baseResponse.message,
      apiErrors: baseResponse,
      code: baseResponse.code,
    );
  }
}
