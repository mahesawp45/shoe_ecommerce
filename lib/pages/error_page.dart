import 'package:flutter/material.dart';
import 'package:shamo/R/r.dart';

class ErrorPage extends StatelessWidget {
  const ErrorPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text('Not Found', style: R.appTextStyle.secondaryTextStyle),
      ),
    );
  }
}
