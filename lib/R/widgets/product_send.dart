import 'package:flutter/material.dart';
import 'package:shamo/R/r.dart';
import 'package:shamo/R/widgets/favorite_button.dart';

class ProductSend extends StatelessWidget {
  const ProductSend({
    Key? key,
    required this.pop,
    this.isDeletable,
    this.isExtend,
  }) : super(key: key);

  final Map<String, dynamic> pop;
  final bool? isDeletable;
  final bool? isExtend;

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

    return Padding(
      padding: EdgeInsets.only(
          top: isDeletable == true || isExtend == true ? 20 : 0),
      child: Stack(
        children: [
          isDeletable == true || isExtend == true
              ? Container(
                  height: 84,
                  width: isExtend == true ? double.infinity : 225,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    gradient: LinearGradient(
                      colors: [
                        R.appColors.primaryColor,
                        R.appColors.secondaryColor,
                      ],
                    ),
                  ),
                )
              : const Expanded(
                  child: SizedBox(
                    height: 90,
                    width: 230,
                  ),
                ),
          Positioned(
            left: 0,
            child: ProductTile(
                isDeletable: isDeletable,
                isExtend: isExtend,
                width: width,
                pop: pop),
          ),
        ],
      ),
    );
  }
}

class ProductTile extends StatelessWidget {
  const ProductTile({
    Key? key,
    required this.isDeletable,
    required this.isExtend,
    required this.width,
    required this.pop,
  }) : super(key: key);

  final bool? isDeletable;
  final bool? isExtend;
  final double width;
  final Map<String, dynamic> pop;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      margin: isDeletable == true || isExtend == true
          ? const EdgeInsets.all(5)
          : null,
      height: isDeletable == true || isExtend == true ? 74 : 80,
      width: isExtend == true ? width * 0.82 : 215,
      decoration: BoxDecoration(
        color: isDeletable == true || isExtend == true
            ? R.appColors.bgColor3
            : null,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Row(
        children: [
          Container(
            height: isDeletable == true || isExtend == true ? 54 : 74,
            width: isDeletable == true || isExtend == true ? 54 : 74,
            decoration: BoxDecoration(
              color: R.appColors.cardColor,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Image.asset(
              pop['img'],
              fit: BoxFit.contain,
            ),
          ),
          const SizedBox(width: 10),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "${pop['title']}",
                  overflow: TextOverflow.ellipsis,
                  maxLines: isDeletable == true || isExtend == true ? 1 : 2,
                  style: R.appTextStyle.primaryTextStyle,
                ),
                SizedBox(
                    height: isDeletable == true || isExtend == true ? 5 : 10),
                Text(
                  "${pop['price']}",
                  style: R.appTextStyle.priceTextStyle,
                ),
              ],
            ),
          ),
          isDeletable == true
              ? Padding(
                  padding: const EdgeInsets.only(top: 10),
                  child: Align(
                    alignment: Alignment.topCenter,
                    child: Icon(
                      Icons.cancel_rounded,
                      size: 22,
                      color: R.appColors.primaryColor,
                    ),
                  ),
                )
              : isExtend == true
                  ? const FavoriteButton()
                  : const SizedBox(),
        ],
      ),
    );
  }
}
