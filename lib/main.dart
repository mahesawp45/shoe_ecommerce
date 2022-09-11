import 'package:flutter/material.dart';
import 'package:shamo/R/r.dart';
import 'package:shamo/R/routes/app_routes.dart';

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
      onGenerateRoute: AppRoute.allRoute,
    );
  }
}
