import 'dart:io';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import '../../features/base/data/entities/api_error_type.dart';
import '../../features/base/data/models/base_response.dart';
import '../constants/app_constants.dart';
import 'api_config.dart';
import 'api_urls.dart';
import '../../../../core/injection_container.dart' as di;
import 'package:fantasy_store/core/extensions/context_extension.dart';

const String doNotInterceptKey = "do_not_intercept";
const String authorizationRequired = "authorization_required";
const String wpApiKey = "WP_API";

class AppInterceptor extends QueuedInterceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    if (!(options.extra[doNotInterceptKey] ?? false)) {
      debugPrint('on request');

      String baseUrl = ApiUrls.baseUrl;
      // String consumerKey = ApiUrls.consumerKey;
      // String consumerSecret = ApiUrls.consumerSecret;
      // String? locale =
      //     AppConstants.navigatorKey.currentContext?.locale.toString();

      if (baseUrl.endsWith('/')) {
        baseUrl = baseUrl.substring(0, baseUrl.length - 1);
      }
      if (options.extra.containsKey(uploadImageKey) &&
          options.extra[uploadImageKey] as bool) {
        final fileName = (options.data as FormData).files.first.value.filename;
        options.headers.addAll({
          'Content-Type': 'image/jpeg',
          'Content-Disposition': 'attachment;filename=$fileName'
        });
        debugPrint("name : $fileName");

        debugPrint("headers : ${options.headers}");
      } else {
        options.path = '$baseUrl${options.path}';
      }
      if (options.extra.containsKey(authorizationRequired) &&
          (options.extra[authorizationRequired] as bool)) {
        options.headers['Authorization'] = 'Bearer $_token';
      }
    }

    debugPrint(options.uri.toString());
    super.onRequest(options, handler);
  }

  @override
  Future<void> onError(DioError err, ErrorInterceptorHandler handler) async {
    debugPrint('on error ${err.type.toString()}');
    if (err.error is SocketException) {
      err=err.copyWith(type: DioErrorType.connectionTimeout) ;
    }
    await handleApiError(ApiConfig.dio, err, handler);

    super.onError(err, handler);
  }

  Future<void> handleApiError(Dio requesterDio, DioError dioError,
      ErrorInterceptorHandler handler) async {
    debugPrint('on error ${dioError.type.toString()}');
    var doNotIntercept =
        dioError.response?.requestOptions.extra[doNotInterceptKey] ?? false;
    if (dioError.type == DioErrorType.badResponse) {
      if (dioError.response?.statusCode ==
              ApiErrorType.unauthorizedError.code &&
          dioError.requestOptions.headers.containsKey('Authorization')) {
        if (!doNotIntercept) {
          // await _refreshExpiredToken(requesterDio, dioError, handler);
        } else {
          handler.reject(dioError);
        }
        return;
      }
    } else if (dioError.error is SocketException) {
      dioError=dioError.copyWith(type: DioErrorType.connectionTimeout) ;
    }
  }




  static String get _token =>
      // AppConstants.navigatorKey.currentContext
      //     ?.read(di.userProvider)
      //     ?.accessToken ??
      "";


  static String get _refreshToken =>
      // AppConstants.navigatorKey.currentContext
      //     ?.read(di.userProvider)
      //     ?.refreshToken ??
          "";
}
