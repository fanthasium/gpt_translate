
import 'dart:async' show Future;
import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesUtils {
  static final SharedPreferencesUtils _instance = SharedPreferencesUtils._internal();
  late SharedPreferences _prefs;

  SharedPreferencesUtils._internal();

  static SharedPreferencesUtils get instance => _instance;

  Future<void> init() async {
    _prefs = await SharedPreferences.getInstance();
  }

  String? getString(String key) {
    return _prefs.getString(key);
  }

  Future<bool> setString(String key, String value) {
    return _prefs.setString(key, value);
  }
}