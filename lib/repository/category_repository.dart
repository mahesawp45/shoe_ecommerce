import 'dart:convert';
import 'dart:developer';

import 'package:http/http.dart' as http;
import 'package:shamo/R/api_url/product_url.dart';
import 'package:shamo/models/category_model.dart';

abstract class CategoryRepository {
  static Future<List<Category>> getCategories() async {
    const String url = ProductURL.category;

    try {
      var response = await http.get(Uri.parse(url));

      if (response.statusCode == 200) {
        var result = jsonDecode(response.body)['data']['data'];

        List data = result;

        List<Category> categories = [];

        for (var elem in data) {
          categories.add(Category.fromJson(elem));
        }

        log('INI CATEGORY => ${categories.map((e) => e.name)}');

        return categories;
      } else {
        throw jsonDecode(response.body)['meta']['message'];
      }
    } catch (e) {
      rethrow;
    }
  }
}
