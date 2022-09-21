// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'dart:ui';

import 'package:flutter/material.dart';

import 'package:shamo/R/r.dart';
import 'package:shamo/R/widgets/my_header.dart';
import 'package:shamo/R/widgets/product_send.dart';

class CheckoutPage extends StatefulWidget {
  const CheckoutPage({
    Key? key,
    this.pageController,
  }) : super(key: key);

  final PageController? pageController;
  static const String route = '/check-out-page';

  @override
  State<CheckoutPage> createState() => _CheckoutPageState();
}

class _CheckoutPageState extends State<CheckoutPage> {
  double update = 0;

  @override
  Widget build(BuildContext context) {
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
        bottomNavigationBar: BottomAppBar(
          color: R.appColors.bgColor3.withOpacity(0.9),
          clipBehavior: Clip.antiAlias,
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  width: double.infinity,
                  padding: EdgeInsets.symmetric(
                      horizontal: R.appMargin.defaultMargin, vertical: 25),
                  child: SizedBox(
                    height: 50,
                    width: double.infinity,
                    child: Stack(
                      children: [
                        Container(
                          height: 50,
                          margin: const EdgeInsets.symmetric(vertical: 5),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            gradient: LinearGradient(
                              colors: [
                                R.appColors.primaryColor,
                                R.appColors.priceColor,
                              ],
                            ),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: List.generate(4, (index) {
                              return Icon(Icons.arrow_forward_ios,
                                  color: Colors.grey.shade400, size: 15);
                            }),
                          ),
                        ),
                        StatefulBuilder(builder: (context, setContent) {
                          return Transform.translate(
                            offset: Offset(update, 0),
                            child: GestureDetector(
                              onHorizontalDragCancel: () {
                                setState(() {
                                  update = 0;
                                });
                              },
                              onHorizontalDragEnd: (details) {
                                setState(() {
                                  update = details.velocity.pixelsPerSecond.dx;
                                });
                              },
                              onHorizontalDragUpdate: (details) {
                                if (details.localPosition.dx > 0 &&
                                    details.localPosition.dx < width) {
                                  setContent(() {
                                    update = details.globalPosition.dx;
                                  });
                                }

                                if (update > (315 - 200)) {
                                  Navigator.pop(context);
                                }
                              },
                              child: Container(
                                height: 40,
                                width: 200,
                                margin: const EdgeInsets.all(8),
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 20, vertical: 7),
                                decoration: BoxDecoration(
                                  color: R.appColors.bgColor3,
                                  borderRadius: BorderRadius.circular(15),
                                ),
                                child: FittedBox(
                                  child: Text('Checkout Now',
                                      style: R.appTextStyle.primaryTextStyle),
                                ),
                              ),
                            ),
                          );
                        }),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
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
                          'Checkout Details',
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
              child: ListView(
                physics: const BouncingScrollPhysics(),
                padding: EdgeInsets.all(R.appMargin.defaultMargin),
                children: [
                  SizedBox(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'List Items',
                          style: R.appTextStyle.primaryTextStyle.copyWith(
                              fontSize: 16, fontWeight: FontWeight.w500),
                        ),
                        const SizedBox(height: 10),
                        ProductSendCard(
                          pop: pop,
                          isExtend: true,
                          child: Padding(
                            padding: const EdgeInsets.only(right: 10),
                            child: Text(
                              '2 Items',
                              style: R.appTextStyle.darkTextStyle
                                  .copyWith(fontSize: 12),
                            ),
                          ),
                        ),
                        ProductSendCard(
                          pop: pop,
                          isExtend: true,
                          child: Padding(
                            padding: const EdgeInsets.only(right: 10),
                            child: Text(
                              '2 Items',
                              style: R.appTextStyle.darkTextStyle
                                  .copyWith(fontSize: 12),
                            ),
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              '2 More +',
                              textAlign: TextAlign.center,
                              style: R.appTextStyle.secondaryTextStyle,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 10),
                  Container(
                    margin: const EdgeInsets.symmetric(vertical: 15),
                    padding: const EdgeInsets.all(25),
                    height: 186,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: R.appColors.bgColor1.withOpacity(0.4),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Address Details',
                          style: R.appTextStyle.primaryTextStyle
                              .copyWith(fontSize: 16),
                        ),
                        Container(),
                      ],
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
