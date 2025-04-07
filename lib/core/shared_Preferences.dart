import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class SecureStorageService {
  final FlutterSecureStorage _storage = FlutterSecureStorage();

  // حفظ التوكن
  Future<void> saveToken(String token) async {
    await _storage.write(key: 'auth_token', value: token);
  }

  // استرجاع التوكن
  Future<String?> getToken() async {
    return await _storage.read(key: 'auth_token');
  }

  // حذف التوكن عند تسجيل الخروج
  Future<void> deleteToken() async {
    await _storage.delete(key: 'auth_token');
  }
}


