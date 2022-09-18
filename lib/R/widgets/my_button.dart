// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:shamo/R/r.dart';

class MyButton extends StatelessWidget {
  const MyButton({
    Key? key,
    required this.label,
    this.reverse,
    this.size,
    required this.onTap,
    this.width,
    this.isWhite,
  }) : super(key: key);

  final String label;
  final bool? reverse;
  final double? size;
  final VoidCallback onTap;
  final double? width;
  final bool? isWhite;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: size ?? 41,
        width: width,
        padding: const EdgeInsets.symmetric(
          horizontal: 14,
          vertical: 10,
        ),
        decoration: BoxDecoration(
          border: reverse == true
              ? Border.all(
                  color: R.appColors.primaryColor,
                )
              : null,
          color: reverse == true ? null : R.appColors.primaryColor,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Center(
          child: Text(
            label,
            style: TextStyle(
              color: reverse == true
                  ? R.appColors.primaryColor
                  : isWhite == true
                      ? R.appColors.primaryTextColor
                      : R.appColors.bgColor2,
            ),
          ),
        ),
      ),
    );
  }
}
