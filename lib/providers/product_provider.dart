import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:shamo/R/r.dart';
import 'package:shamo/models/product_model.dart';
import 'package:shamo/repository/product_repository.dart';

class ProductProvider extends ChangeNotifier {
  List<Product>? _products = [];

  List<Product> get products => _products ?? [];

  set products(List<Product> products) {
    _products = products;
    notifyListeners();
  }

  Future<bool> isGetProducts(BuildContext context) async {
    try {
      products = await ProductRepository.getProduct();

      return true;
    } catch (e) {
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            backgroundColor: R.appColors.bgColor3,
            title: const Text('Sorry, error'),
            content: Text(
              e.toString(),
              maxLines: 9,
              overflow: TextOverflow.ellipsis,
              style: R.appTextStyle.primaryTextStyle,
            ),
          );
        },
      );
      return false;
    }
  }
}
