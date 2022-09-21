// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'dart:ui';

import 'package:flutter/material.dart';

import 'package:shamo/R/r.dart';
import 'package:shamo/R/widgets/my_header.dart';
import 'package:shamo/pages/core/subpages/cart/checkout_page.dart';

class CartPage extends StatefulWidget {
  const CartPage({
    Key? key,
    this.pageController,
  }) : super(key: key);

  final PageController? pageController;
  static const String route = '/cart-page';

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double update = 0;

    double containerWidth = 315;
    double containerHeight = 110;

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
        bottomNavigationBar: _buildCheckoutBottomBar(pop, update, width),
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
              child: ListView.separated(
                clipBehavior: Clip.antiAlias,
                physics: const BouncingScrollPhysics(),
                padding: EdgeInsets.all(R.appMargin.defaultMargin),
                separatorBuilder: (context, index) =>
                    const SizedBox(height: 50),
                itemCount: 2,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    child: SizedBox(
                      height: containerHeight,
                      width: containerWidth,
                      child: Stack(
                        clipBehavior: Clip.none,
                        children: [
                          const NeonCardCartProduct(),
                          Container(
                            height: 105,
                            padding: const EdgeInsets.symmetric(horizontal: 20),
                            decoration: BoxDecoration(
                              gradient: LinearGradient(
                                  begin: Alignment.topCenter,
                                  end: Alignment.bottomCenter,
                                  colors: [
                                    R.appColors.bgColor3,
                                    R.appColors.bgColor3,
                                    R.appColors.bgColor1,
                                  ]),
                              borderRadius: const BorderRadius.vertical(
                                top: Radius.circular(20),
                                bottom: Radius.circular(30),
                              ),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                  height: 60,
                                  width: 60,
                                  decoration: BoxDecoration(
                                    color: R.appColors.cardColor,
                                    borderRadius: BorderRadius.circular(15),
                                  ),
                                  child: Image.asset(
                                    pop['img'],
                                    fit: BoxFit.contain,
                                  ),
                                ),
                                const SizedBox(width: 15),
                                Expanded(
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        pop['title'],
                                        overflow: TextOverflow.ellipsis,
                                        style: R.appTextStyle.primaryTextStyle
                                            .copyWith(
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      const SizedBox(height: 5),
                                      Text(pop['price'],
                                          style: R.appTextStyle.priceTextStyle),
                                    ],
                                  ),
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  // mainAxisAlignment:  MainAxisAlignment.spaceBetween,
                                  children: [
                                    // Transform.translate(
                                    //   offset: const Offset(15, 0),
                                    //   child: CartOperationButton(
                                    //     color: Colors.transparent,
                                    //     child: Image.asset(
                                    //       R.appAssets.removeFromCart,
                                    //       color: R.appColors.cardColor,
                                    //     ),
                                    //   ),
                                    // ),
                                    Transform.translate(
                                      offset: const Offset(20, 0),
                                      child: Container(
                                        height: 50,
                                        width: 115,
                                        decoration: BoxDecoration(
                                          color: R.appColors.bgColor2
                                              .withOpacity(0.7),
                                          borderRadius: const BorderRadius.only(
                                            topLeft: Radius.circular(10),
                                            bottomRight: Radius.circular(30),
                                          ),
                                        ),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceEvenly,
                                          children: [
                                            CartOperationButton(
                                              color: R.appColors.bgColor3,
                                              child: const Icon(Icons.remove),
                                            ),
                                            Text('2',
                                                style: R.appTextStyle
                                                    .primaryTextStyle),
                                            CartOperationButton(
                                              color: R.appColors.primaryColor,
                                              child: const Icon(Icons.add),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  BottomAppBar _buildCheckoutBottomBar(
      Map<String, dynamic> pop, double update, double width) {
    return BottomAppBar(
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
              child: Column(
                children: [
                  Container(
                    margin: const EdgeInsets.symmetric(vertical: 5),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Subtotal',
                          style: R.appTextStyle.primaryTextStyle,
                        ),
                        Text(
                          pop['price'],
                          style: R.appTextStyle.priceTextStyle.copyWith(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Divider(
                    thickness: 2,
                    color: R.appColors.darkBgColor.withOpacity(0.7),
                  ),
                  SizedBox(
                    height: 50,
                    width: 315,
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

                                if (update > (315 - 165)) {
                                  Navigator.pushNamed(
                                    context,
                                    CheckoutPage.route,
                                  );
                                }
                              },
                              child: Container(
                                height: 40,
                                width: 150,
                                margin: const EdgeInsets.all(8),
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 20, vertical: 7),
                                decoration: BoxDecoration(
                                  color: R.appColors.bgColor3,
                                  borderRadius: BorderRadius.circular(15),
                                ),
                                child: FittedBox(
                                  child: Text('Checkout',
                                      style: R.appTextStyle.primaryTextStyle),
                                ),
                              ),
                            ),
                          );
                        }),
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

class NeonCardCartProduct extends StatelessWidget {
  const NeonCardCartProduct({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.vertical(
          top: Radius.circular(40),
          bottom: Radius.circular(20),
        ),
        gradient: LinearGradient(
          colors: [
            R.appColors.primaryColor,
            R.appColors.priceColor.withOpacity(0.7),
          ],
        ),
        boxShadow: [
          BoxShadow(
            offset: const Offset(0, 15),
            blurRadius: 20,
            spreadRadius: -14,
            color: R.appColors.primaryColor,
          )
        ],
      ),
    );
  }
}

class CartOperationButton extends StatelessWidget {
  const CartOperationButton({
    Key? key,
    required this.color,
    required this.child,
  }) : super(key: key);

  final Color color;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(200),
      child: SizedBox(
        height: 26,
        width: 26,
        child: ElevatedButton(
          onPressed: () {},
          style: ElevatedButton.styleFrom(
            padding: const EdgeInsets.all(5),
            backgroundColor: color,
          ),
          child: Center(
            child: FittedBox(
              child: Padding(
                padding: const EdgeInsets.all(5),
                child: child,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
