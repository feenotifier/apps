import 'package:flutter_secure_storage/flutter_secure_storage.dart';

final _storage = new FlutterSecureStorage();

Future<void> setEmail(String email) {
  return _storage.write(key: 'email', value: email);
}

Future<void> getEmail(String email) {
  return _storage.read(key: 'email');
}

Future<void> setPassword(String password) {
  return _storage.write(key: 'password', value: password);
}

Future<void> getPassword(String password) {
  return _storage.read(key: 'password');
}
