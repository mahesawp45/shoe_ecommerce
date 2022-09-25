import 'package:shamo/R/api_url/base_url.dart';

abstract class UserURL {
  static const String register = '${baseURL}register';
  static const String login = '${baseURL}login';
  static const String logout = '${baseURL}logout';
  static const String user = '${baseURL}user';
}
