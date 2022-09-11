import 'dart:async';

import 'package:flutter/material.dart';
import 'package:shamo/R/r.dart';
import 'package:shamo/pages/auth/sign_in_page.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  static const String route = '/';

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  late Timer timer;

  @override
  void initState() {
    timer = Timer(
      const Duration(seconds: 3),
      () => Navigator.pushReplacementNamed(context, SignInPage.route),
    );
    super.initState();
  }

  @override
  void dispose() {
    timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SizedBox(
          height: R.appSize.getHeight(context) * 0.4,
          width: R.appSize.getWidth(context) * 0.5,
          child: Image.asset(R.appAssets.logo, fit: BoxFit.contain),
        ),
      ),
    );
  }
}
