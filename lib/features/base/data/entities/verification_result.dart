import 'package:fantasy_store/features/base/data/entities/api_error_type.dart';

class PhoneVerificationResult<T> {
  T? data;
  String? successMessage;
  String? errorMessage;
  ApiErrorType? errorType;

  PhoneVerificationResult({
    this.data,
    this.successMessage,
    this.errorMessage,
    this.errorType,
  });
}
