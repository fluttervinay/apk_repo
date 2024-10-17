import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class SecureStorage {
  final storage = FlutterSecureStorage();

  Future<void> storeData(String name) async {
    await storage.write(key: 'name', value: name);
  }

  Future<String> readData() async {
    return await storage.read(key: 'name') ?? "";
  }

  Future<void> deleteData() async {
    await storage.delete(key: 'name');
  }
}

