import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class LocalStorage {
  final storage = const FlutterSecureStorage();
  final String jwtKey = 'jwt\$keyValue';

  Future<void> storeToken({required String jwtToken}) async {
    await storage.write(key: jwtKey, value: jwtToken);
  }

  Future<String> getToken() async {
    return await storage.read(key: jwtKey) ?? '';
  }
}
