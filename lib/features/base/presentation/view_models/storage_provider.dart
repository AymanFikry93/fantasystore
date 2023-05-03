import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

import '../helper/enums/shared_preferences_data.dart';

class StorageProvider {
  late final SharedPreferences _preferences;
  StorageProvider(this._preferences);

  Future<void> save(SharedPreferencesData type, dynamic data) async {
    String json = jsonEncode(data);
    await  _preferences.setString(type.toString(), json);
  }

  dynamic getData<T>(SharedPreferencesData type) {
    var savedData = _preferences.getString(type.toString());
    if (savedData != null) {
      var data = jsonDecode(savedData);
      return data;
    }
    return null;
  }

  void removeData(SharedPreferencesData type) {
    _preferences.remove(type.toString());
  }

  void removeAll() {
    _preferences.clear();
  }
}
