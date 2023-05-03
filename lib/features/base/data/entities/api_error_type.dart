import 'package:easy_localization/easy_localization.dart';

enum ApiErrorType {
  noNetworkError,
  generalError,
  unauthorizedError,
  validationError,
  badRequestError,
  notFound,
  serverError,
  invalidCodeError,
  expiredCodeError,
  invalidPhoneNumber,
  blockRequest,
  userNotFound,
  invalidEmail,
  inActiveSubscriptionCodeError,
}

ApiErrorType getErrorFromCode(int? code, {bool isWordpress = false}) {
  if (code == 401) {
    return ApiErrorType.unauthorizedError;
  } else if (code == 403) {
    return ApiErrorType.validationError;
  } else if (code == 400) {
    return ApiErrorType.badRequestError;
  } else if (code == 404) {
    return ApiErrorType.badRequestError;
  } else if (code == 500) {
    return ApiErrorType.serverError;
  } else if (code == 422) {
    return ApiErrorType.userNotFound;
  } else if (code == 406) {
    return ApiErrorType.inActiveSubscriptionCodeError;
  }
  else {
    return ApiErrorType.generalError;
  }
}

ApiErrorType getErrorFromMessage(String? msg) {
  switch (msg) {
    case "code-expired":
      return ApiErrorType.expiredCodeError;
    case "network-request-failed":
      return ApiErrorType.noNetworkError;
    case "invalid-phone-number":
      return ApiErrorType.invalidPhoneNumber;
    case "too-many-requests":
      return ApiErrorType.blockRequest;
    case "invalid-verification-code":
      return ApiErrorType.invalidCodeError;
    case "livestock_invalid_email":
      return ApiErrorType.invalidEmail;
    default:
      return ApiErrorType.generalError;
  }
}

extension ApiErrorData on ApiErrorType {
  int get code {
    if (this == ApiErrorType.unauthorizedError) {
      return 401;
    } else {
      return 500;
    }
  }

  String get message {
    switch (this) {
      case ApiErrorType.noNetworkError:
        return 'connection_error'.tr();
      case ApiErrorType.generalError:
        return 'general_error'.tr();
      case ApiErrorType.unauthorizedError:
        return 'try to login again'.tr();
      case ApiErrorType.inActiveSubscriptionCodeError:
        return 'inActiveSubscriptionError'.tr();
      default:
        return 'general_error'.tr();
    }
  }
}
