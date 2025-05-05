import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

@lazySingleton
class TokenStorage {
  static const String _tokenKey = 'auth_token';
  static const String _birthdaySetup = 'birthday-setup';
  final SharedPreferences _prefs;

  TokenStorage(this._prefs);

  // Save token
  Future<void> saveToken(String token) async {
    await _prefs.setString(_tokenKey, token);
  }

   Future<void> saveBirthdaySetup(String token) async {
    await _prefs.setString(_birthdaySetup, token);
  }

  // Retrieve token
  Future<String?> getToken() async {
    return _prefs.getString(_tokenKey);
  }

  Future<String?> getBirthdaySetup() async {
    return _prefs.getString(_birthdaySetup);
  }

  // Remove token (Logout)
  Future<void> clearToken() async {
    await _prefs.remove(_tokenKey);
  }
}
