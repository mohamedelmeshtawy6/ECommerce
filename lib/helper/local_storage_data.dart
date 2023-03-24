import 'dart:convert';

import 'package:e_commerce/model/user_model.dart';
import 'package:get/get.dart';

import 'package:shared_preferences/shared_preferences.dart';

import '../constance.dart';

class LocalStorageData extends GetxController {
  late SharedPreferences _sharedPreferences;

  Future setUser(UserModel model) async {
    _sharedPreferences = await SharedPreferences.getInstance();
    _sharedPreferences.setString(
        CATCHED_USER_DATA, json.encode(model.toJson()));
  }

  _getUserData() async {
    _sharedPreferences = await SharedPreferences.getInstance();
    var value = _sharedPreferences.getString(CATCHED_USER_DATA);
    return UserModel.fromJson(json.decode(value!));
  }

  Future<UserModel?> userData() async {
    try {
      UserModel userModel = await _getUserData();
      if (userModel == null) {
        return null;
      } else {
        return userModel;
      }
    } catch (e) {
      Get.snackbar('error', e.toString());
    }
  }

  deletUser() async {
    _sharedPreferences = await SharedPreferences.getInstance();
    await _sharedPreferences.clear();
  }
}
