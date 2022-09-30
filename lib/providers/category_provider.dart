import 'package:flutter/material.dart';
import 'package:shamo/R/r.dart';
import 'package:shamo/models/category_model.dart';
import 'package:shamo/repository/category_repository.dart';

class CategoryProvider with ChangeNotifier {
  List<Category>? _categories;

  List<Category> get categories => _categories ?? [];

  set categories(List<Category> categories) {
    _categories = categories;
    notifyListeners();
  }

  Future<bool> isGetCategory(BuildContext context) async {
    try {
      categories = await CategoryRepository.getCategories();

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
              maxLines: 4,
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
