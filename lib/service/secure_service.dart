

import 'dart:convert';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import '../Model/newUser.dart';

class SecureService{
  static storeApiKey(String api_key) async{
    const storage = FlutterSecureStorage();
    await storage.write(key: "api_key", value: api_key);
  }

  static Future<String?> loadApiKey()async{
    const storage = FlutterSecureStorage();
    String? api_key = await storage.read(key: "api_key");
    return api_key;
  }


  static Future<void> removeApiKey() async{
    const storage = FlutterSecureStorage();
    await storage.delete(key: "api_key");

  }

  static Future<void> storeUser(newUser user) async {
     const storage = FlutterSecureStorage();
    await storage.write(key: "user", value: jsonEncode(user.toJson()));
  }

  static Future<newUser?> loadUser() async {
    const storage = FlutterSecureStorage();
    String? stringUser = await storage.read(key: "user");
    if (stringUser == null || stringUser.isEmpty) return null;
    Map<String, dynamic> map = jsonDecode(stringUser);
    return newUser.fromJson(map);
  }
}