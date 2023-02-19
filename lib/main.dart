import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';
import 'package:provider/provider.dart';
import 'package:shamo/R/r.dart';
import 'package:shamo/R/routes/app_routes.dart';
import 'package:shamo/providers/category_provider.dart';
import 'package:shamo/providers/product_provider.dart';
import 'package:shamo/providers/user_provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  try {
    final appDocumentDirectory = await getApplicationDocumentsDirectory();
    Hive.init(appDocumentDirectory.path);
  } catch (e) {
    log(e.toString());
  }

  await Hive.openBox(R.appbox.myProfile);

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => UserProvider()),
        ChangeNotifierProvider(create: (context) => CategoryProvider()),
        ChangeNotifierProvider(create: (context) => ProductProvider()),
      ],
      child: MaterialApp(
        title: 'Shamo',
        debugShowCheckedModeBanner: false,
        theme: R.appTheme.getTheme(isDark: true),
        onGenerateRoute: AppRoute.allRoute,
      ),
    );
  }
}
