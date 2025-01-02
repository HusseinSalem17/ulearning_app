import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:udemy_app/common/values/constant.dart';
import 'package:udemy_app/pages/sign_in/models/user_item_model.dart';

class StorageService {
  late final SharedPreferences _prefs;
  // this is a singleton
  Future<StorageService> init() async {
    _prefs = await SharedPreferences.getInstance();
    return this;
  }

  //setBool used to set the value of a bool key
  Future<bool> setBool(String key, bool value) async {
    return await _prefs.setBool(
      key,
      value,
    );
  }

  //getBool used to get the value of a bool key
  bool getBool(String key) {
    return _prefs.getBool(key) ?? false;
  }

  //setString userd to set the value of a string key
  Future<bool> setString(String key, String value) async {
    return await _prefs.setString(
      key,
      value,
    );
  }

  //getString used to get the value of a string key
  String getString(String key) {
    return _prefs.getString(key) ?? '';
  }

  //getBool used to get the value of a bool key
  bool getDeviceFirstOpen() {
    return _prefs.getBool(AppConstants.STORAGE_DEVICE_OPEN_FIRST_TIME) ?? false;
  }

  bool getIsLoggedIn() {
    return _prefs.getString(AppConstants.STORAGE_USER_TOKEN_KEY) == null
        ? false
        : true;
  }

  Future<bool> remove(String key) {
    return _prefs.remove(key);
  }

  String getUserToken() {
    return _prefs.getString(AppConstants.STORAGE_USER_TOKEN_KEY) ?? '';
  }

  UserItem getUserProfile() {
    var profileOffline =
        _prefs.getString(AppConstants.STORAGE_USER_PROFILE_KEY) ?? '';
    if (profileOffline.isNotEmpty) {
      return UserItem.fromJson(jsonDecode(profileOffline));
    }
    return UserItem();
  }
}
