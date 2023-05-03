import 'package:dio/dio.dart';
import 'api_interceptor.dart';
import 'api_urls.dart';

const String doNotInterceptKey = "do_not_intercept";
const String authorizationRequired = "authorization_required";
const String wpApiKey = "WP_API";
const String uploadImageKey = "upload_image";

class ApiConfig {
  static Dio dio = createDio();
  static final Dio refreshDio = Dio(
      BaseOptions(
          connectTimeout: Duration(seconds: 10), receiveTimeout: Duration(seconds: 10), baseUrl: ApiUrls.baseUrl));



  static Dio createDio() {
    return Dio(BaseOptions(
        connectTimeout: Duration(seconds: 10), receiveTimeout: Duration(seconds: 10), baseUrl: ApiUrls.baseUrl))
      ..interceptors.addAll([AppInterceptor()]);
  }
}

