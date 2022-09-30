import 'dart:convert';

import 'package:shamo/R/api_url/user_url.dart';
import 'package:shamo/models/user_model.dart';
import 'package:http/http.dart' as http;

class UserRepository {
  /// Register
  Future<UserModel> postRegister({required Map<String, dynamic> data}) async {
    const String url = UserURL.register;

    Map<String, String> headers = const {'Content-Type': 'application/json'};

    var body = jsonEncode(data);

    var response = await http.post(
      Uri.parse(url),
      body: body,
      headers: headers,
    );

    try {
      if (response.statusCode == 200) {
        var result = jsonDecode(response.body)['data'];

        UserModel user = UserModel.fromJson(result);

        return user;
      } else {
        throw jsonDecode(response.body)['meta']['message'];
      }
    } catch (e) {
      rethrow;
    }
  }

  /// Login
  Future<UserModel> postLogin({required Map<String, dynamic> data}) async {
    const String url = UserURL.login;

    Map<String, String> headers = const {'Content-Type': 'application/json'};

    var body = jsonEncode(data);

    try {
      var response =
          await http.post(Uri.parse(url), body: body, headers: headers);

      if (response.statusCode == 200) {
        var result = jsonDecode(response.body)['data'];

        UserModel user = UserModel.fromJson(result);

        return user;
      } else {
        throw jsonDecode(response.body)['meta']['message'];
      }
    } catch (e) {
      rethrow;
    }
  }
}
