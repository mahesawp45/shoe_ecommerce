import 'package:flutter/material.dart';
import 'package:shamo/R/r.dart';

class ShoeCardMini extends StatelessWidget {
  const ShoeCardMini({
    Key? key,
    required this.data,
  }) : super(key: key);

  final Map<String, dynamic> data;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 15),
      height: 120,
      width: double.infinity,
      child: Row(
        children: [
          Container(
            decoration: BoxDecoration(
              color: R.appColors.cardColor,
              borderRadius: BorderRadius.circular(20),
            ),
            width: 120,
            height: 120,
            child: Image.asset(
              data['img'],
              fit: BoxFit.contain,
            ),
          ),
          Container(
            padding: const EdgeInsets.all(15),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  data['category'],
                  style: R.appTextStyle.secondaryTextStyle.copyWith(
                    fontSize: 12,
                  ),
                ),
                Text(
                  data['title'],
                  style: R.appTextStyle.primaryTextStyle.copyWith(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Text(
                  data['price'],
                  style: R.appTextStyle.priceTextStyle.copyWith(
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
