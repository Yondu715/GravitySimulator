import 'package:shared_preferences/shared_preferences.dart';

class Storage {
  Future<SharedPreferences> _getStorageInstance() async {
    return await SharedPreferences.getInstance();
  }

  Future<void> set<T>(String key, T value) async {
    SharedPreferences preferences = await _getStorageInstance();
    if (value is String) {
      preferences.setString(key, value);
    }
  }

  Future<T> get<T>(String key, T defaultValue) async {
    SharedPreferences preferences = await _getStorageInstance();
    Object? value;
    try {
      value = preferences.get(key);
      if (value == null) {
        return defaultValue;
      }
      return value as T;
    } catch (e) {
      return defaultValue;
    }
  }
}
