// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'dart:ui';

import 'package:flutter/material.dart';

import 'package:shamo/R/r.dart';
import 'package:shamo/R/widgets/my_header.dart';
import 'package:shamo/R/widgets/product_send.dart';
import 'package:shamo/pages/core/subpages/cart/checkout_success_page.dart';

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

    String price = pop['price'];
    double total = double.parse(
            price.split('\$').last.replaceFirstMapped(',', (match) => '.')) *
        2;

    return SafeArea(
      top: true,
      bottom: false,
      child: Scaffold(
        extendBody: true,
        bottomNavigationBar: BottomAppBar(
          color: R.appColors.bgColor3.withOpacity(0.4),
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
                                  Navigator.pushReplacementNamed(
                                      context, CheckoutSuccessPage.route);
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
            const MyHeader(
              isPop: true,
              label: 'Checkout Details',
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
                  DetailWidget(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Address Details',
                          style: R.appTextStyle.primaryTextStyle
                              .copyWith(fontSize: 16),
                        ),
                        const SizedBox(height: 15),
                        LocationWidget(
                          label: 'Store Location',
                          locationName: 'Adidas Core',
                          icon: R.appAssets.storeLocation,
                        ),
                        SizedBox(
                          width: 40,
                          height: 40,
                          child: Image.asset(R.appAssets.lineAddressDetail),
                        ),
                        LocationWidget(
                          label: 'Your Address',
                          locationName: 'JL Patih Nambi Gang XXVIII no 6',
                          icon: R.appAssets.storeLocation,
                        ),
                      ],
                    ),
                  ),
                  DetailWidget(
                    secondColor: R.appColors.priceColor.withOpacity(0.1),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Payment Summary',
                          style: R.appTextStyle.primaryTextStyle
                              .copyWith(fontSize: 16),
                        ),
                        const SizedBox(height: 10),
                        Column(
                          children: [
                            Column(
                              children: [
                                const PayementSummaryWidget(
                                  label: 'Product Quantity',
                                  amount: '2 Items',
                                ),
                                PayementSummaryWidget(
                                  label: 'Product Price',
                                  amount: "\$$total",
                                  // amount: pop['price'],
                                ),
                                const PayementSummaryWidget(
                                  label: 'Shipping',
                                  amount: 'Free',
                                ),
                              ],
                            ),
                            Divider(
                              color: R.appColors.secondaryTextColor
                                  .withOpacity(0.6),
                            ),
                            PayementSummaryWidget(
                              isTotal: true,
                              label: 'Total',
                              amount: "\$$total",
                            ),
                          ],
                        )
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

class PayementSummaryWidget extends StatelessWidget {
  const PayementSummaryWidget({
    Key? key,
    required this.label,
    required this.amount,
    this.isTotal,
  }) : super(key: key);

  final String label;
  final String amount;
  final bool? isTotal;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 15),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: isTotal == true
                ? R.appTextStyle.blueTextStyle
                    .copyWith(fontWeight: FontWeight.bold)
                : R.appTextStyle.secondaryTextStyle.copyWith(fontSize: 12),
          ),
          Text(
            amount,
            style: isTotal == true
                ? R.appTextStyle.blueTextStyle
                    .copyWith(fontWeight: FontWeight.bold)
                : R.appTextStyle.primaryTextStyle,
          ),
        ],
      ),
    );
  }
}

class DetailWidget extends StatelessWidget {
  const DetailWidget({
    Key? key,
    required this.child,
    this.secondColor,
  }) : super(key: key);

  final Widget child;
  final Color? secondColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 15),
      padding: const EdgeInsets.all(20),
      width: double.infinity,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            R.appColors.bgColor1.withOpacity(0.4),
            secondColor ?? R.appColors.primaryColor.withOpacity(0.15),
          ],
        ),
        borderRadius: BorderRadius.circular(12),
      ),
      child: child,
    );
  }
}

class LocationWidget extends StatelessWidget {
  const LocationWidget({
    Key? key,
    required this.label,
    required this.locationName,
    required this.icon,
  }) : super(key: key);

  final String label;
  final String locationName;
  final String icon;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Row(
        children: [
          Container(
            height: 40,
            width: 40,
            decoration: BoxDecoration(
              color: R.appColors.bgColor4.withOpacity(0.6),
              borderRadius: BorderRadius.circular(100),
            ),
            child: Image.asset(
              icon,
            ),
          ),
          const SizedBox(width: 15),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                label,
                style: R.appTextStyle.darkTextStyle.copyWith(fontSize: 12),
              ),
              const SizedBox(height: 5),
              Text(
                locationName,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: R.appTextStyle.primaryTextStyle,
              ),
            ],
          )
        ],
      ),
    );
  }
}
