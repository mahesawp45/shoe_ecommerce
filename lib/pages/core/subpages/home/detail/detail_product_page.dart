// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:shamo/R/r.dart';
import 'package:shamo/R/widgets/favorite_button.dart';
import 'package:shamo/pages/core/home_page.dart';

class DetailProductPage extends StatefulWidget {
  const DetailProductPage({
    Key? key,
    this.pop,
  }) : super(key: key);

  final Map<String, dynamic>? pop;
  static const String route = 'detail-product';

  @override
  State<DetailProductPage> createState() => _DetailProductPageState();
}

class _DetailProductPageState extends State<DetailProductPage> {
  double update = 0;
  int indexImage = 0;

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context);

    double paddingTop = size.padding.top;

    double width = size.size.width;

    List popImages = List.generate(3, (index) {
      return widget.pop?['img'] ?? '';
    });

    List<Widget> buildListProductImage() {
      return List.generate(popImages.length, (index) {
        return Image.asset(
          popImages[index],
          fit: BoxFit.contain,
        );
      });
    }

    List<Widget> buildListProductImageIndicator(int indexImg) {
      return List.generate(popImages.length, (index) {
        return AnimatedContainer(
          duration: const Duration(milliseconds: 300),
          curve: Curves.decelerate,
          margin: const EdgeInsets.symmetric(horizontal: 4),
          height: 5,
          width: indexImage == index ? 32 : 8,
          decoration: BoxDecoration(
            color: indexImage == index
                ? R.appColors.primaryColor
                : R.appColors.secondaryTextColor.withOpacity(0.2),
            borderRadius: BorderRadius.circular(100),
          ),
        );
      });
    }

    List<Widget> buildFamiliarShoes() {
      return List.generate(8, (index) {
        return Container(
          height: 54,
          width: 54,
          margin: const EdgeInsets.symmetric(horizontal: 12),
          decoration: BoxDecoration(
            color: R.appColors.cardColor,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Image.asset(
            widget.pop?['img'],
            fit: BoxFit.contain,
          ),
        );
      });
    }

    return Scaffold(
      backgroundColor: R.appColors.cardColor,
      body: Column(
        children: [
          _buildTopContentProductDetail(
            width,
            paddingTop,
            indexImage,
            buildListProductImage,
            buildListProductImageIndicator(indexImage),
          ),
          Expanded(
            child: Container(
              padding: EdgeInsets.only(top: R.appMargin.defaultMargin),
              decoration: BoxDecoration(
                color: R.appColors.bgColor3,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(R.appMargin.defaultMargin),
                  topRight: Radius.circular(R.appMargin.defaultMargin),
                ),
              ),
              child: Column(
                children: [
                  Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: R.appMargin.defaultMargin,
                    ),
                    width: double.infinity,
                    child: Column(
                      children: [
                        _buildTitleProductAndFavorite(),
                        _buildPriceProduct(width),
                        _buildDescProduct(),
                      ],
                    ),
                  ),
                  _buildFamiliarProduct(buildFamiliarShoes),
                  Container(
                    height: 54,
                    padding: EdgeInsets.symmetric(
                      horizontal: R.appMargin.defaultMargin,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        GestureDetector(
                          onTap: () {},
                          child: Container(
                            width: 54,
                            padding: const EdgeInsets.all(15),
                            decoration: BoxDecoration(
                              border:
                                  Border.all(color: R.appColors.primaryColor),
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Image.asset(
                              R.appAssets.chat,
                              fit: BoxFit.contain,
                              color: R.appColors.primaryColor,
                            ),
                          ),
                        ),
                        const SizedBox(width: 20),
                        Expanded(
                          child: Stack(
                            children: [
                              Container(
                                height: 54,
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
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Icon(Icons.arrow_forward_ios,
                                        color: Colors.grey.shade400, size: 15),
                                    Icon(Icons.arrow_forward_ios,
                                        color: Colors.grey.shade400, size: 15),
                                    Icon(Icons.arrow_forward_ios,
                                        color: Colors.grey.shade400, size: 15),
                                    Icon(Icons.arrow_forward_ios,
                                        color: Colors.grey.shade400, size: 15),
                                  ],
                                ),
                              ),
                              Transform.translate(
                                offset: Offset(update, 0),
                                child: GestureDetector(
                                  onHorizontalDragUpdate: (details) {
                                    if (details.localPosition.dx > 0 &&
                                        details.localPosition.dx < width) {
                                      setState(() {
                                        update = details.localPosition.dx;
                                        if (update >= (width * 0.3)) {
                                          Navigator.pushNamed(
                                              context, HomePage.route);
                                        }
                                      });
                                    }
                                  },
                                  child: Container(
                                    height: 54,
                                    width: width * 0.35,
                                    margin: const EdgeInsets.all(2),
                                    padding: const EdgeInsets.all(15),
                                    decoration: BoxDecoration(
                                      color: R.appColors.bgColor3,
                                      borderRadius: BorderRadius.circular(15),
                                    ),
                                    child: Center(
                                      child: Text(
                                        'Add to Cart',
                                        style: R.appTextStyle.primaryTextStyle
                                            .copyWith(
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildFamiliarProduct(List<Widget> Function() buildFamiliarShoes) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: R.appMargin.defaultMargin - 5),
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding:
                EdgeInsets.symmetric(horizontal: R.appMargin.defaultMargin),
            child: Text(
              'Familiar Shoes',
              style: R.appTextStyle.primaryTextStyle,
            ),
          ),
          Container(
            padding: const EdgeInsets.only(top: 20),
            height: 80,
            child: ListView(
              physics: const BouncingScrollPhysics(),
              scrollDirection: Axis.horizontal,
              children: buildFamiliarShoes(),
            ),
          ),
        ],
      ),
    );
  }

  SizedBox _buildDescProduct() {
    return SizedBox(
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Description',
            style: R.appTextStyle.primaryTextStyle,
          ),
          const SizedBox(height: 10),
          Text(
            widget.pop?['desc'] ?? 'No Description',
            maxLines: 3,
            overflow: TextOverflow.clip,
            style: R.appTextStyle.darkTextStyle.copyWith(
              height: 2,
            ),
          ),
        ],
      ),
    );
  }

  Container _buildPriceProduct(double width) {
    return Container(
      height: 50,
      width: width,
      margin: EdgeInsets.symmetric(vertical: R.appMargin.defaultMargin - 10),
      padding: EdgeInsets.symmetric(horizontal: R.appMargin.defaultMargin),
      decoration: BoxDecoration(
        color: R.appColors.bgColor2,
        borderRadius: BorderRadius.circular(5),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            'Price starts from',
            style: R.appTextStyle.primaryTextStyle,
          ),
          Text(
            widget.pop?['price'],
            style: R.appTextStyle.priceTextStyle
                .copyWith(fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }

  Row _buildTitleProductAndFavorite() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              widget.pop?['title'],
              style: R.appTextStyle.primaryTextStyle
                  .copyWith(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 5),
            Text(
              widget.pop?['category'],
              style: R.appTextStyle.secondaryTextStyle.copyWith(fontSize: 12),
            ),
          ],
        ),
        const FavoriteButton(isExtend: true),
      ],
    );
  }

  Container _buildTopContentProductDetail(
      double width,
      double paddingTop,
      int index,
      List<Widget> Function() buildListProductImage,
      List<Widget> buildListProductImageIndicator) {
    return Container(
      width: width,
      padding: const EdgeInsets.only(bottom: 20),
      child: Column(
        children: [
          _buildProductDetailHeader(paddingTop),
          CarouselSlider(
            options: CarouselOptions(
              onScrolled: (value) {
                setState(() {
                  indexImage = value?.ceil() ?? 0;
                });
              },
              enableInfiniteScroll: false,
            ),
            items: buildListProductImage(),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: buildListProductImageIndicator,
          ),
        ],
      ),
    );
  }

  Container _buildProductDetailHeader(double paddingTop) {
    return Container(
      height: R.appMargin.defaultMargin + (paddingTop * 2),
      color: R.appColors.cardColor,
      padding: EdgeInsets.only(
        left: R.appMargin.defaultMargin,
        right: R.appMargin.defaultMargin,
        bottom: 20,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: const Icon(Icons.arrow_back_ios)),
          SizedBox(
            height: 22,
            width: 20,
            child: Image.asset(
              R.appAssets.cart,
              color: R.appColors.bgColor3,
            ),
          )
        ],
      ),
    );
  }
}
