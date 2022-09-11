import 'package:flutter/material.dart';
import 'package:shamo/R/r.dart';

class AuthButton extends StatelessWidget {
  const AuthButton({
    Key? key,
    required this.size,
    required this.title,
  }) : super(key: key);

  final double size;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      padding: const EdgeInsets.symmetric(horizontal: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(100),
        boxShadow: [
          BoxShadow(
            blurRadius: 100,
            spreadRadius: 10,
            color: R.appColors.primaryColor,
            offset: const Offset(0, 0),
          ),
        ],
        gradient: LinearGradient(
          colors: [
            R.appColors.primaryColor,
            Colors.purple.shade900,
          ],
        ),
      ),
      child: FittedBox(
        child: Center(
          child: Text(
            title,
            style: R.appTextStyle.primaryTextStyle
                .copyWith(fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }
}
