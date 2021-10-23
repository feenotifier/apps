import 'package:flutter_secure_storage/flutter_secure_storage.dart';

final _storage = new FlutterSecureStorage();

Future<void> setUserId(String userId) {
  return _storage.write(key: 'userId', value: userId);
}

Future<String> getUserID() {
  return _storage.read(key: 'userId');
}

Future<void> setEmail(String email) {
  return _storage.write(key: 'email', value: email);
}

Future<String> getEmail() {
  return _storage.read(key: 'email');
}

Future<void> setPassword(String password) {
  return _storage.write(key: 'password', value: password);
}

Future<String> getPassword() {
  return _storage.read(key: 'password');
}
