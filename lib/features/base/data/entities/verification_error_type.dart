enum VerificationErrorType {
  noNetworkError,
  generalError,
  invalidCodeError,
  expiredCodeError,
}

VerificationErrorType getErrorFromMessage(String? msg) {
  switch (msg) {
    case "The sms code has expired. Please re-send the verification code to try again.":
      return VerificationErrorType.expiredCodeError;
    case "The sms verification code used to create the phone auth credential is invalid. Please resend the verification code sms and be sure use the verification code provided by the user.":
      return VerificationErrorType.invalidCodeError;
    default:
      return VerificationErrorType.generalError;
  }
}
