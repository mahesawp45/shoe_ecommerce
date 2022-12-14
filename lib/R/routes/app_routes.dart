import 'package:flutter/material.dart';
import 'package:shamo/pages/auth/sign_in_page.dart';
import 'package:shamo/pages/auth/sign_up_page.dart';
import 'package:shamo/pages/core/home_page.dart';
import 'package:shamo/pages/core/message_page.dart';
import 'package:shamo/pages/core/subpages/cart/cart_page.dart';
import 'package:shamo/pages/core/subpages/cart/checkout_page.dart';
import 'package:shamo/pages/core/subpages/cart/checkout_success_page.dart';
import 'package:shamo/pages/core/subpages/home/detail/detail_product_page.dart';
import 'package:shamo/pages/core/subpages/profile/edit_profile_page.dart';
import 'package:shamo/pages/core/subpages/profile/profile_page.dart';
import 'package:shamo/pages/core/subpages/sub_page_export.dart';
import 'package:shamo/pages/error_page.dart';
import 'package:shamo/pages/splash_page.dart';

abstract class AppRoute {
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
      case WishListPage.route:
        return MaterialPageRoute(
          builder: (context) {
            return const WishListPage();
          },
        );

      case ProfilePage.route:
        return MaterialPageRoute(
          builder: (context) {
            return const ProfilePage();
          },
        );
      case EditProfilePage.route:
        return MaterialPageRoute(
          builder: (context) {
            return const EditProfilePage();
          },
        );

      case DetailProductPage.route:
        return MaterialPageRoute(
          builder: (context) {
            return const DetailProductPage();
          },
        );

      case CartPage.route:
        return MaterialPageRoute(
          builder: (context) {
            return const CartPage();
          },
        );

      case CheckoutPage.route:
        return MaterialPageRoute(
          builder: (context) {
            return const CheckoutPage();
          },
        );

      case CheckoutSuccessPage.route:
        return MaterialPageRoute(
          builder: (context) {
            return const CheckoutSuccessPage();
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
