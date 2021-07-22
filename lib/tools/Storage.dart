import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:async';
import 'dart:convert';

class Storage {
  Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  Future<Map> load(String key) async {
    final SharedPreferences prefs = await _prefs;
    final jsonValue = await prefs.getString(key) ?? '{}';
    final value = jsonDecode(jsonValue) ?? {};
    return value;
  }

  Future<void> save(String key, Map value) async {
    final SharedPreferences prefs = await _prefs;
    final jsonValue = jsonEncode(value);
    await prefs.setString(key, jsonValue);
  }
}
