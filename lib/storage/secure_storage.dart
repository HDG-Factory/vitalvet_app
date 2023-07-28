import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class SecureStorage {
  static const storage = FlutterSecureStorage();

  static containsKey(key) async {
    return await storage.containsKey(key: key);
  }

  static read(key) async {
    return await storage.read(key: key);
  }

  static deleteAll() {
    storage.deleteAll();
  }
}
