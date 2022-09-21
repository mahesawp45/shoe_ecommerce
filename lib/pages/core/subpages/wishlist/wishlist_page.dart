// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:shamo/R/decorations/decoration_one.dart';
import 'package:shamo/R/r.dart';
import 'package:shamo/R/widgets/favorite_button.dart';
import 'package:shamo/R/widgets/my_header.dart';
import 'package:shamo/R/widgets/page_template.dart';
import 'package:shamo/R/widgets/product_send.dart';

class WishListPage extends StatelessWidget {
  const WishListPage({
    Key? key,
    this.pageController,
  }) : super(key: key);

  final PageController? pageController;
  static const String route = '/wish-list-page';

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    Map<String, dynamic> pop = {
      'title': 'Terrex Urban Low',
      'category': 'Hiking',
      'price': '\$143,98',
      'img': R.appAssets.pop2,
    };

    return SafeArea(
      top: true,
      bottom: false,
      child: Scaffold(
        extendBody: true,
        body: Column(
          children: [
            MyHeader(
              child: Center(
                child: Text(
                  'Favorite Shoes',
                  style: R.appTextStyle.primaryTextStyle
                      .copyWith(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ),
            ),
            Expanded(
              child: Stack(
                clipBehavior: Clip.antiAlias,
                children: [
                  DecorationOne(
                      height: height, left: 0, right: 0, bottom: -120),
                  // EmptyPage(
                  //   indexHome: 0,
                  //   firstLine: "You don't have dream shoes?",
                  //   secondLine: "Let's find your favorite shoes",
                  //   iconPath: R.appAssets.favShoes,
                  //   height: height,
                  //   pageController: pageController ?? PageController(),
                  //   width: width,
                  // ),
                  PageTemplate(
                    height: height,
                    width: width,
                    child: ProductSendCard(
                      pop: pop,
                      isExtend: true,
                      child: FavoriteButton(
                        onTap: () {},
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
