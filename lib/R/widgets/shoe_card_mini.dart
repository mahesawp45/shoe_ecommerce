import 'package:flutter/material.dart';
import 'package:shamo/R/r.dart';
import 'package:shamo/models/product_model.dart';
import 'package:shamo/pages/core/subpages/home/detail/detail_product_page.dart';

class ShoeCardMini extends StatelessWidget {
  const ShoeCardMini({
    Key? key,
    required this.product,
  }) : super(key: key);

  final Product? product;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          PageRouteBuilder(
            transitionDuration: const Duration(seconds: 1),
            pageBuilder: (_, __, ___) => DetailProductPage(product: product),
          ),
        );
      },
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 15),
        height: 120,
        width: double.infinity,
        child: Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(
                10,
              ),
              child: Container(
                decoration: BoxDecoration(
                  color: R.appColors.cardColor,
                ),
                width: 120,
                height: 120,
                child: product?.gallery != null
                    ? Image.network(
                        product!.gallery![0].url.toString(),
                        fit: BoxFit.contain,
                      )
                    : const SizedBox(),
              ),
            ),
            Container(
              padding: const EdgeInsets.all(15),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  product?.category != null
                      ? Text(
                          product!.category!.name.toString(),
                          style: R.appTextStyle.secondaryTextStyle.copyWith(
                            fontSize: 12,
                          ),
                        )
                      : const SizedBox(),
                  product?.name != null
                      ? Text(
                          product!.name.toString(),
                          style: R.appTextStyle.primaryTextStyle.copyWith(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                          ),
                        )
                      : const SizedBox(),
                  product?.price != null
                      ? Text(
                          product!.price.toString(),
                          style: R.appTextStyle.priceTextStyle.copyWith(
                            fontWeight: FontWeight.w600,
                          ),
                        )
                      : const SizedBox(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
