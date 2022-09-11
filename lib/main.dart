import 'package:flutter/material.dart';
import 'package:shamo/R/r.dart';
import 'package:shamo/pages/auth/sign_up_page.dart';
import 'package:shamo/pages/core/home_page.dart';
import 'package:shamo/pages/auth/sign_in_page.dart';
import 'package:shamo/pages/splash_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Shamo',
      debugShowCheckedModeBanner: false,
      theme: R.appTheme.getTheme(isDark: true),
      routes: {
        SplashPage.route: (context) => const SplashPage(),
        SignInPage.route: (context) => const SignInPage(),
        SignUpPage.route: (context) => const SignUpPage(),
        HomePage.route: (context) => const HomePage(),
      },
    );
  }
}
