// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:flutter/material.dart';
import 'package:shamo/R/decorations/decoration_one.dart';

import 'package:shamo/R/r.dart';
import 'package:shamo/R/widgets/empty_page.dart';
import 'package:shamo/R/widgets/my_header.dart';

class CheckoutSuccessPage extends StatelessWidget {
  const CheckoutSuccessPage({
    Key? key,
    this.pageController,
  }) : super(key: key);

  final PageController? pageController;
  static const String route = '/check-out--success-page';

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return SafeArea(
      top: true,
      bottom: false,
      child: Scaffold(
        extendBody: true,
        body: Column(
          children: [
            const MyHeader(
              label: 'Checkout Success',
            ),
            Expanded(
              child: Stack(
                clipBehavior: Clip.antiAlias,
                children: [
                  DecorationOne(
                      height: height, left: 0, right: 0, bottom: -120),
                  EmptyPage(
                    isMultiButton: true,
                    indexHome: 0,
                    firstLine: "You made a transaction",
                    secondLine:
                        "Stay at home while we \nprepare your dream shoes",
                    iconPath: R.appAssets.cartPage,
                    isOutFromHome: true,
                    otherLabelButton: 'Order Other Shoes',
                    otherLabelButton2: 'View My Order',
                    height: height,
                    width: width,
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
