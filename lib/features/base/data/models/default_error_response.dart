

class DefaultErrorResponse {
  final String? code;
  final String? message;

  DefaultErrorResponse({this.code, this.message,});

  factory DefaultErrorResponse.fromJson(Map<String, dynamic> json) {

    return DefaultErrorResponse(
      code: json['code'],
      message: json['message'],
    );
  }
}
