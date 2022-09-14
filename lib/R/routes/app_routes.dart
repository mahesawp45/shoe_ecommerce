import 'package:flutter/material.dart';
import 'package:shamo/pages/auth/sign_in_page.dart';
import 'package:shamo/pages/auth/sign_up_page.dart';
import 'package:shamo/pages/core/home_page.dart';
import 'package:shamo/pages/core/message_page.dart';
import 'package:shamo/pages/core/subpages/sub_page_export.dart';
import 'package:shamo/pages/error_page.dart';
import 'package:shamo/pages/splash_page.dart';

class AppRoute {
  static Route allRoute(RouteSettings settings) {
    switch (settings.name) {
      case SplashPage.route:
        return MaterialPageRoute(
          builder: (context) {
            return const SplashPage();
          },
        );
      case SignInPage.route:
        return MaterialPageRoute(
          builder: (context) {
            return const SignInPage();
          },
        );
      case SignUpPage.route:
        return MaterialPageRoute(
          builder: (context) {
            return const SignUpPage();
          },
        );
      case HomePage.route:
        return MaterialPageRoute(
          builder: (context) {
            return const HomePage();
          },
        );
      case MessagePage.route:
        return MaterialPageRoute(
          builder: (context) {
            return const MessagePage();
          },
        );
      case DetailMessagePage.route:
        return MaterialPageRoute(
          builder: (context) {
            return const DetailMessagePage();
          },
        );

      default:
        return MaterialPageRoute(
          builder: (context) {
            return const ErrorPage();
          },
        );
    }
  }
}
