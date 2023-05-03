import 'package:fantasy_store/core/extensions/json_parser.dart';

class BaseListResponse<T> {
  final List<T>? data;

  BaseListResponse({this.data});

  factory BaseListResponse.fromJson(Map<String, dynamic> json) {
    List<T>? dataList;
    dataList =  (json['data']['items'])
        .map((i) => (i as Map<String, dynamic>).parse<T>())
        .whereType<T>()
        .toList();

    return BaseListResponse(data: dataList);
  }
}
