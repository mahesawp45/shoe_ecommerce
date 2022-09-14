// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:shamo/R/r.dart';
import 'package:shamo/R/widgets/shoe_card_mini.dart';
import 'package:shamo/R/widgets/shoe_tag.dart';

class BasketPage extends StatelessWidget {
  const BasketPage({
    Key? key,
    required this.scrollController,
  }) : super(key: key);

  static const String route = '/basket-shoes-page';
  final ScrollController scrollController;

  @override
  Widget build(BuildContext context) {
    List<Map<String, dynamic>> pops = [
      {
        'title': 'Court Vision 2.0',
        'category': 'Hiking',
        'price': '\$58,67',
        'img': R.appAssets.pop1,
      },
      {
        'title': 'Terrex Urban Low',
        'category': 'Hiking',
        'price': '\$143,98',
        'img': R.appAssets.pop2,
      },
      {
        'title': 'SL 20 Shoes',
        'category': 'Running',
        'price': '\$123,82',
        'img': R.appAssets.pop3,
      },
      {
        'title': 'Court Vision 2.0',
        'category': 'Hiking',
        'price': '\$58,67',
        'img': R.appAssets.pop1,
      },
      {
        'title': 'Terrex Urban Low',
        'category': 'Hiking',
        'price': '\$143,98',
        'img': R.appAssets.pop2,
      },
    ];

    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return Scaffold(
      body: _buildContent(height, width, pops),
    );
  }

  Widget _buildContent(
      double height, double width, List<Map<String, dynamic>> pops) {
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
              children: List.generate(pops.length, (index) {
                var data = pops[index];
                return ShoeCardMini(data: data);
              }),
            ),
          ),
        ],
      ),
    );
  }
}
