import 'dart:async';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shamo/R/r.dart';
import 'package:shamo/pages/auth/sign_in_page.dart';
import 'package:shamo/providers/category_provider.dart';
import 'package:shamo/providers/product_provider.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  static const String route = '/';

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  late Timer timer;
  late CategoryProvider categoryProvider;

  late ProductProvider productProvider;

  @override
  void initState() {
    categoryProvider = Provider.of<CategoryProvider>(context, listen: false);
    productProvider = Provider.of<ProductProvider>(context, listen: false);

    getCategoriesHandler();
    getProductsHandler();

    toNext();

    super.initState();
  }

  @override
  void dispose() {
    timer.cancel();
    super.dispose();
  }

  toNext() async {
    if (await getCategoriesHandler() && await getProductsHandler()) {
      timer = Timer(
        const Duration(seconds: 3),
        () => Navigator.pushReplacementNamed(context, SignInPage.route),
      );
    }
  }

  Future<bool> getCategoriesHandler() async {
    if (await categoryProvider.isGetCategory(context)) {
      return true;
    } else {
      log('error get categories');
      return false;
    }
  }

  Future<bool> getProductsHandler() async {
    if (await productProvider.isGetProducts(context)) {
      return true;
    } else {
      log('error get products');
      return false;
    }
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
