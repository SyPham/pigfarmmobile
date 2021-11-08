import 'dart:convert';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:pigfarm/models/user.dart';

class SecureStorage {
  static final SecureStorage _singleton =
      SecureStorage._(FlutterSecureStorage());
  // factory constructor
  factory SecureStorage() {
    return _singleton;
  }

  final FlutterSecureStorage _storage;
  // private constructor
  SecureStorage._(this._storage);

  static const _tokenKey = 'TOKEN';
  static const _emailKey = 'EMAIL';
  static const _userKey = 'USER';

  Future<void> persistEmailAndToken(
      String email, String token, String user) async {
    await _storage.write(key: _emailKey, value: email);
    await _storage.write(key: _tokenKey, value: token);
    await _storage.write(key: _userKey, value: user);
  }

  Future<bool> hasToken() async {
    var value = await _storage.read(key: _tokenKey);
    return value != null;
  }

  Future<bool> hasEmail() async {
    var value = await _storage.read(key: _emailKey);
    return value != null;
  }

  Future<void> deleteToken() async {
    return _storage.delete(key: _tokenKey);
  }

  Future<void> deleteEmail() async {
    return _storage.delete(key: _emailKey);
  }

  Future<String?> getEmail() async {
    return _storage.read(key: _emailKey);
  }

  Future<User?> getUser() async {
    return User.fromJson(jsonDecode(_storage.read(key: _userKey).toString()));
  }

  Future<String?> getToken() async {
    return _storage.read(key: _tokenKey);
  }

  Future<void> deleteAll() async {
    return _storage.deleteAll();
  }
}
