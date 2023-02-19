// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:shamo/R/r.dart';
import 'package:shamo/R/widgets/shoe_card_mini.dart';
import 'package:shamo/R/widgets/shoe_tag.dart';
import 'package:shamo/models/product_model.dart';

class BasketPage extends StatelessWidget {
  const BasketPage({
    Key? key,
    required this.scrollController,
    this.products,
  }) : super(key: key);

  static const String route = '/basket-shoes-page';
  final ScrollController scrollController;
  final List<Product>? products;

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return Scaffold(
      body: _buildContent(height, width, products ?? []),
    );
  }

  Widget _buildContent(double height, double width, List<Product> data) {
    return Padding(
      padding: EdgeInsets.only(left: R.appMargin.defaultMargin),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const ShoeTag(title: 'For You'),
          Expanded(
            child: ListView(
              padding: EdgeInsets.zero,
              physics: const BouncingScrollPhysics(),
              children: List.generate(products?.length ?? 0, (index) {
                var data = products?[index];
                return ShoeCardMini(product: data);
              }),
            ),
          ),
        ],
      ),
    );
  }
}
