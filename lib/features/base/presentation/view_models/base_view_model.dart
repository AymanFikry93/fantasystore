import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import '../../../../core/constants/app_constants.dart';
import '../../data/entities/api_error_type.dart';
import '../widgets/toast_view.dart';

mixin BaseViewModel {
  void handleError({
    ApiErrorType? errorType,
    String? errorMessage,
  }) {
    if (errorType == ApiErrorType.noNetworkError) {
      showToastMessage('connection_error'.tr());
    } else if (errorType == ApiErrorType.generalError) {
      showToastMessage('general_error'.tr());
    } else if (errorType == ApiErrorType.invalidCodeError) {
      showToastMessage('invalid_code_error'.tr());
    } else if (errorType == ApiErrorType.expiredCodeError) {
      showToastMessage('expired_code_error'.tr());
    } else if (errorType == ApiErrorType.invalidPhoneNumber) {
      showToastMessage('invalid_phone_error'.tr());
    } else if (errorType == ApiErrorType.inActiveSubscriptionCodeError) {
      showToastMessage('inActiveSubscriptionError'.tr());
    } else if (errorType == ApiErrorType.blockRequest) {
      showToastMessage('blockRequest'.tr());
    }else {
      showToastMessage(errorMessage ?? 'general_error'.tr());
    }
  }

  void showToastMessage(String message, {bool isSuccess = false}) {
    var context = AppConstants.navigatorKey.currentContext;
    if (context != null) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          content: ToastView(
            isSuccess: isSuccess,
            message: message,
          )));
    }
  }

  Future<dynamic> navigateToScreen(String screenRoute,
      {bool removeTop = false, bool replace = false, dynamic arguments}) async {
    hideKeyboard();
    var result;
    if (removeTop) {
    result= await  AppConstants.navigatorKey.currentState?.pushNamedAndRemoveUntil(
          screenRoute, (route) => false,
          arguments: arguments);
    } else if (replace) {
       result= await  AppConstants.navigatorKey.currentState
          ?.pushReplacementNamed(screenRoute, arguments: arguments);
    } else {
       result= await AppConstants.navigatorKey.currentState
          ?.pushNamed(screenRoute, arguments: arguments);
    }
    return result;
  }

  void hideKeyboard() {
    FocusManager.instance.primaryFocus?.unfocus();
  }
}
