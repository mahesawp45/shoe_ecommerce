import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:shamo/R/r.dart';
import 'package:shamo/helpers/hive_helpers.dart';
import 'package:shamo/models/user_model.dart';
import 'package:shamo/repository/user_repository.dart';

class UserProvider with ChangeNotifier {
  UserModel? _user;
  bool _isVisible = true;

  UserModel get user => _user ?? UserModel();

  set user(UserModel user) {
    _user = user;
  }

  bool get isVisible => _isVisible;

  isPasswordVisible() {
    _isVisible = !_isVisible;
    notifyListeners();
  }

  Future<bool> isRegister(BuildContext context,
      {required Map<String, dynamic> payload}) async {
    try {
      user = await UserRepository().postRegister(data: payload);

      return true;
    } catch (e) {
      rethrow;
    }
  }

  Future<bool> isLogin(BuildContext context,
      {required Map<String, dynamic> payload}) async {
    try {
      user = await UserRepository().postLogin(data: payload);

      var data = jsonEncode(user);

      HiveHelpers.saveData(key: R.appbox.myProfile, data: data);

      return true;
    } catch (e) {
      rethrow;
    }
  }

  UserModel? getUserFromLocal() {
    var data = HiveHelpers.getData(key: R.appbox.myProfile);

    if (data != null) {
      var result = jsonDecode(data);
      user = UserModel.fromJson(result);
      return user;
    } else {
      return null;
    }
  }

  loggout() {
    HiveHelpers.deleteData(key: R.appbox.myProfile);
  }
}
