
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

  String? getString({required String key}) {
    return _prefs.getString(key);
  }

  List<String>? getStringList(String key) {
    return _prefs.getStringList(key);
  }

  Future<bool> setString(String key, {String value = ""}) {
    return _prefs.setString(key, value);
  }

  Future<bool> setStringList(String key, List<String> value) {
    return _prefs.setStringList(key, value);
  }
}