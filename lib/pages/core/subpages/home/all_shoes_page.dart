// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:flutter/material.dart';

import 'package:shamo/R/r.dart';
import 'package:shamo/R/widgets/shoe_card_mini.dart';
import 'package:shamo/R/widgets/shoe_tag.dart';
import 'package:shamo/models/product_model.dart';
import 'package:shamo/pages/core/subpages/home/detail/detail_product_page.dart';

class AllShoesPage extends StatelessWidget {
  const AllShoesPage({
    Key? key,
    required this.products,
  }) : super(key: key);

  static const String route = '/all-shoes-page';

  final List<Product>? products;

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return Scaffold(
      extendBody: true,
      backgroundColor: Colors.transparent,
      body: _buildContent(height, width),
    );
  }

  Widget _buildContent(double height, double width) {
    return products == null
        ? const Center(
            child: CircularProgressIndicator(),
          )
        : Column(
            children: [
              _buildPopularProduct(height, products, width),
              _buildNewArrivals(
                products,
                height,
                width,
              ),
            ],
          );
    // : _buildPopularProduct(height, products ?? [], width);
  }

  Widget _buildNewArrivals(
      List<Product>? products, double height, double width) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding: EdgeInsets.only(left: R.appMargin.defaultMargin, bottom: 10),
          margin: const EdgeInsets.only(top: 40, bottom: 10),
          child: Text(
            'New Arrivals',
            style: R.appTextStyle.primaryTextStyle
                .copyWith(fontSize: 20, fontWeight: FontWeight.w600),
          ),
        ),
        Container(
          width: double.infinity,
          height: height * 0.52,
          padding: const EdgeInsets.all(10),
          margin: const EdgeInsets.symmetric(horizontal: 10),
          decoration: BoxDecoration(
            color: R.appColors.darkTextColor.withOpacity(0.1),
            borderRadius: BorderRadius.circular(
              10,
            ),
          ),
          child: ListView.builder(
            itemCount: products?.length ?? 0,
            itemBuilder: (context, index) {
              var shoe = products?[index];

              if (index >= (products?.length ?? 0)) {
                return Column(
                  children: [
                    ShoeCardMini(product: shoe),
                    const SizedBox(height: 100),
                  ],
                );
              } else {
                return ShoeCardMini(product: shoe);
              }
            },
          ),
        ),
      ],
    );
  }

  SizedBox _buildPopularProduct(
      double height, List<Product>? products, double width) {
    return SizedBox(
      height: height * 0.36,
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: EdgeInsets.only(
              left: R.appMargin.defaultMargin,
            ),
            child: const ShoeTag(title: 'Popular Product'),
          ),
          Expanded(
              child: ListView.separated(
            separatorBuilder: (context, index) {
              return SizedBox(width: R.appMargin.defaultMargin);
            },
            scrollDirection: Axis.horizontal,
            itemCount: products?.length ?? 0,
            itemBuilder: (context, index) {
              var data = products?[index];

              if ((data?.id ?? 0) <= 5) {
                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      PageRouteBuilder(
                        transitionDuration: const Duration(seconds: 1),
                        pageBuilder: (_, __, ___) =>
                            DetailProductPage(product: data),
                      ),
                    );
                  },
                  child: Padding(
                    padding: EdgeInsets.only(left: index > 0 ? 0 : 30),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: Container(
                        width: 200,
                        decoration: BoxDecoration(
                          color: R.appColors.cardColor,
                          // color: Colors.amber,
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Expanded(
                              flex: 2,
                              child: Hero(
                                tag: data?.name ?? '-',
                                child: SizedBox(
                                  width: double.infinity,
                                  child: data?.gallery != null
                                      ? Image.network(
                                          (data?.gallery ?? [])[0]
                                              .url
                                              .toString(),
                                          fit: BoxFit.contain,
                                        )
                                      : Image.asset(R.appAssets.pop3),
                                ),
                              ),
                            ),
                            Expanded(
                              flex: 1,
                              child: Container(
                                padding: const EdgeInsets.only(
                                  left: 15,
                                  right: 15,
                                  bottom: 15,
                                ),
                                width: double.infinity,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      data?.category?.name ?? '-',
                                      style: R.appTextStyle.secondaryTextStyle
                                          .copyWith(
                                        fontSize: 12,
                                      ),
                                    ),
                                    Text(
                                      data?.name ?? '-',
                                      overflow: TextOverflow.ellipsis,
                                      maxLines: 1,
                                      style: const TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                    Text(
                                      (data?.price ?? 0).toString(),
                                      style: R.appTextStyle.priceTextStyle
                                          .copyWith(
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
                  ),
                );
              } else {
                return const SizedBox();
              }
            },
          )),
        ],
      ),
    );
  }
}
