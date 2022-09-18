// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:shamo/R/decorations/decoration_one.dart';
import 'package:shamo/R/r.dart';
import 'package:shamo/R/widgets/empty_page.dart';
import 'package:shamo/R/widgets/my_header.dart';

class CartPage extends StatelessWidget {
  const CartPage({
    Key? key,
    this.pageController,
  }) : super(key: key);

  final PageController? pageController;
  static const String route = '/cart-page';

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
              child: Padding(
                padding:
                    EdgeInsets.symmetric(horizontal: R.appMargin.defaultMargin),
                child: Row(
                  children: [
                    Icon(
                      Icons.arrow_back_ios,
                      color: R.appColors.primaryTextColor,
                    ),
                    Expanded(
                      child: Center(
                        child: Text(
                          'Your Cart',
                          style: R.appTextStyle.primaryTextStyle.copyWith(
                              fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              child: Stack(
                clipBehavior: Clip.antiAlias,
                children: [
                  DecorationOne(
                      height: height, left: 0, right: 0, bottom: -120),
                  EmptyPage(
                    isOutFromHome: true,
                    indexHome: 0,
                    firstLine: "Opss! Your Cart is Empty",
                    secondLine: "Let's find your favorite shoes",
                    iconPath: R.appAssets.cartPage,
                    height: height,
                    pageController: pageController ?? PageController(),
                    width: width,
                  ),
                  // PageTemplate(
                  //   height: height,
                  //   width: width,
                  //   child: ProductSend(
                  //     pop: pop,
                  //     isExtend: true,
                  //   ),
                  // ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
