import 'package:flutter_secure_storage/flutter_secure_storage.dart';

final _storage = new FlutterSecureStorage();

Future<void> setUserId(String userId) {
  return _storage.write(key: 'userId', value: userId);
}

Future<String> getUserID() {
  return _storage.read(key: 'userId');
}
