import 'package:flutter/material.dart';
import 'package:shamo/R/r.dart';
import 'package:shamo/models/user_model.dart';
import 'package:shamo/repository/user_repository.dart';

class UserProvider with ChangeNotifier {
  User? _user;
  bool _isVisible = true;

  User get user => _user ?? User();

  set user(User user) {
    _user = user;
    notifyListeners();
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
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          behavior: SnackBarBehavior.floating,
          backgroundColor: R.appColors.removeFav,
          content: Text(e.toString()),
        ),
      );
      return false;
    }
  }

  Future<bool> isLogin(BuildContext context,
      {required Map<String, dynamic> payload}) async {
    try {
      user = await UserRepository().postLogin(data: payload);

      return true;
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          behavior: SnackBarBehavior.floating,
          backgroundColor: R.appColors.removeFav,
          content: Text(e.toString()),
        ),
      );
      return false;
    }
  }
}
