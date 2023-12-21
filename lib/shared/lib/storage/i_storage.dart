abstract interface class IStorage {
  Future<void> set<T>(String key, T value);
  Future<T> get<T>(String key, T defaultValue);
}
