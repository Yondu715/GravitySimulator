import 'package:gravity_simulator/shared/lib/storage/i_storage.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SpStorage implements IStorage {
  Future<SharedPreferences> _getStorageInstance() async {
    return await SharedPreferences.getInstance();
  }

  @override
  Future<void> set<T>(String key, T value) async {
    SharedPreferences preferences = await _getStorageInstance();
    if (value is String) {
      preferences.setString(key, value);
    }
    if (value is int) {
      preferences.setInt(key, value);
    }
    
  }

  @override
  Future<T> get<T>(String key, T defaultValue) async {
    SharedPreferences preferences = await _getStorageInstance();
    Object? value = preferences.get(key);
    if (value == null) {
      return defaultValue;
    }
    return value as T;
  }
}
