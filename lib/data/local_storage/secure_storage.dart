import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class SecureStorage {
  late final FlutterSecureStorage storage;

  SecureStorage() {
    storage = FlutterSecureStorage(
      aOptions: _getAndroidOptions(),
    );
  }

  AndroidOptions _getAndroidOptions() => const AndroidOptions(
        encryptedSharedPreferences: true,
      );

  Future<String?> readStorage(String key) async {
    String? value = await storage.read(key: key);
    return value;
  }

  writeStorage(String key, String value) async {
    try {
      await storage.write(key: key, value: value);
    } catch (error) {
      print("Error writing");
    }
  }

  deleteStorage(String key) async {
    try {
      await storage.delete(key: key);
    } catch (error) {
      print("Error deleting");
    }
  }
}
