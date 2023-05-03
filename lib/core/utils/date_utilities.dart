
import 'package:fantasy_store/core/constants/app_constants.dart';
import 'package:easy_localization/easy_localization.dart';

class DateUtilities {

  static String? dateTimeFormat(DateTime? dateTime,
      {String? format, String? locale}) {
    if (dateTime == null) return null;
    String dateFormat =
    DateFormat(format ?? "yyy/MM/dd",  AppConstants.navigatorKey.currentContext!.locale.languageCode,).format(dateTime);
    return dateFormat;
  }

  static String? convertDateLocal(String? dateTime,
      {String? format, String? locale}) {
    if (dateTime == null || dateTime.isEmpty) return null;
    late final DateTime date = DateFormat("dd/MM/yyyy").parse(dateTime);
    String dateFormat =
    DateFormat(format ?? "yyy/MM/dd",  AppConstants.navigatorKey.currentContext!.locale.languageCode,).format(date);
    return dateFormat;
  }


  static String? convertDateTimeLocal(String? dateTime,
      {String? dateformat, String? format, String? locale}) {
    if (dateTime == null) return null;
    late final DateTime date = DateFormat(dateformat??"yyy-MM-dd hh:mm:ss").parse(dateTime);
    String dateFormat =
    DateFormat(format ?? "yyy/MM/dd",  AppConstants.navigatorKey.currentContext!.locale.languageCode,).format(date);
    return dateFormat;
  }
  static String? convertTimeLocal(String? dateTime,
      {String? format, String? locale}) {
    if (dateTime == null) return null;
    late final DateTime date = DateFormat("dd-MM-yyyy hh:mm:ss").parse(dateTime);
    String dateFormat =
    DateFormat(format ?? "hh:mm a",  AppConstants.navigatorKey.currentContext!.locale.languageCode,).format(date);
    return dateFormat;
  }
}