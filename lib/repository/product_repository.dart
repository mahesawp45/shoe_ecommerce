import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:shamo/R/api_url/product_url.dart';
import 'package:shamo/models/product_model.dart';

abstract class ProductRepository {
  static Future<List<Product>> getProduct() async {
    const String url = ProductURL.products;

    try {
      var response = await http.get(Uri.parse(url));

      if (response.statusCode == 200) {
        var result = jsonDecode(response.body)['data']['data'];

        // log("ini PRODUCT => ${result.first['galleries']}");

        List<Product> products = [];
        // List<Gallery> galleries = [];

        for (var product in result) {
          products.add(Product.fromJson(product));
          // galleries.add(Gallery.fromJson(product['gallery'].));
        }

        return products;
      } else {
        throw jsonDecode(response.body)['meta']['message'];
      }
    } catch (e) {
      rethrow;
    }
  }
}
