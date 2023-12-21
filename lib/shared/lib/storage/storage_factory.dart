import 'package:gravity_simulator/shared/lib/storage/i_storage.dart';
import 'package:gravity_simulator/shared/lib/storage/sharedPreferces/sp_storage.dart';

class StorageFactory {
  static IStorage createInstance() {
    return SpStorage();
  }
}