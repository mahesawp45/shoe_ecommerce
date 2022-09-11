import 'package:flutter/material.dart';
import 'package:shamo/R/r.dart';

class DecorationOne extends StatelessWidget {
  const DecorationOne({
    Key? key,
    required this.height,
  }) : super(key: key);

  final double height;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: -120,
      right: -70,
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
