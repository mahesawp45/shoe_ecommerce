// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:shamo/R/r.dart';

class DecorationOne extends StatelessWidget {
  const DecorationOne({
    Key? key,
    required this.height,
    this.top,
    this.right,
    this.bottom,
    this.left,
  }) : super(key: key);

  final double height;
  final double? top;
  final double? right;
  final double? bottom;
  final double? left;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: top,
      right: right,
      bottom: bottom,
      left: left,
      child: Container(
        height: height * 0.3,
        width: height * 0.3,
        decoration: BoxDecoration(
          color: Colors.transparent,
          borderRadius: BorderRadius.circular(200),
          boxShadow: [
            BoxShadow(
              blurRadius: 1000,
              spreadRadius: 10,
              color: R.appColors.primaryColor.withOpacity(0.5),
              offset: const Offset(0, 0),
            ),
          ],
        ),
      ),
    );
  }
}
