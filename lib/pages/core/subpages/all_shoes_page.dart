// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:shamo/R/r.dart';
import 'package:shamo/R/widgets/shoe_card_mini.dart';
import 'package:shamo/R/widgets/shoe_tag.dart';

class AllShoesPage extends StatelessWidget {
  const AllShoesPage({
    Key? key,
    required this.scrollController,
  }) : super(key: key);

  static const String route = '/all-shoes-page';
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
    ];

    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return Scaffold(
      body: _buildContent(height, width, pops),
    );
  }

  Widget _buildContent(
      double height, double width, List<Map<String, dynamic>> pops) {
    return ListView(
      controller: scrollController,
      padding: EdgeInsets.zero,
      physics: const BouncingScrollPhysics(),
      children: [
        _buildPopularProduct(height, pops, width),
        _buildNewArrivals(pops),
      ],
    );
  }

  Widget _buildNewArrivals(List<Map<String, dynamic>> pops) {
    return Padding(
      padding: EdgeInsets.only(
        left: R.appMargin.defaultMargin,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: const EdgeInsets.only(top: 40, bottom: 10),
            child: Text(
              'New Arrivals',
              style: R.appTextStyle.primaryTextStyle
                  .copyWith(fontSize: 20, fontWeight: FontWeight.w600),
            ),
          ),
          Column(
            children: List.generate(pops.length, (index) {
              var data = pops[index];

              return ShoeCardMini(data: data);
            }),
          ),
        ],
      ),
    );
  }

  SizedBox _buildPopularProduct(
      double height, List<Map<String, dynamic>> pops, double width) {
    return SizedBox(
      height: height * 0.36,
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.only(
              left: R.appMargin.defaultMargin,
            ),
            child: const ShoeTag(title: 'Popular Product'),
          ),
          Expanded(
              child: ListView.separated(
            physics: const BouncingScrollPhysics(),
            separatorBuilder: (context, index) {
              return const SizedBox(width: 30);
            },
            scrollDirection: Axis.horizontal,
            itemCount: pops.length,
            itemBuilder: (context, index) {
              var data = pops[index];

              return Padding(
                padding: EdgeInsets.only(left: index > 0 ? 0 : 30),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Container(
                    width: width * 0.50,
                    decoration: BoxDecoration(
                      color: R.appColors.cardColor,
                      // color: Colors.amber,
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Expanded(
                          flex: 2,
                          child: SizedBox(
                            width: double.infinity,
                            child: Image.asset(
                              data['img'],
                              fit: BoxFit.contain,
                            ),
                          ),
                        ),
                        Expanded(
                          child: Container(
                            padding: const EdgeInsets.only(
                              left: 15,
                              right: 15,
                              bottom: 20,
                            ),
                            width: double.infinity,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  data['category'],
                                  style: R.appTextStyle.secondaryTextStyle
                                      .copyWith(
                                    fontSize: 12,
                                  ),
                                ),
                                Text(
                                  data['title'],
                                  style: const TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                Text(
                                  data['price'],
                                  style: R.appTextStyle.priceTextStyle.copyWith(
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
          )),
        ],
      ),
    );
  }
}
