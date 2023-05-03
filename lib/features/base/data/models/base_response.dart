

import 'package:fantasy_store/core/extensions/json_parser.dart';

class BaseResponse<T> {
  final T? data;
  final String? successMessage;

  BaseResponse({this.data, this.successMessage});

  factory BaseResponse.fromJson(Map<String, dynamic> json ,{bool isMedia=false}) {
    return BaseResponse(
        data:
        isMedia?
        (json).parse<T>()
:
        (json["data"] as Map<String, dynamic>).parse<T>(),
        successMessage: json["message"]
    );
  }
}
