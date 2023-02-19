import 'package:flutter/material.dart';
import 'package:shamo/R/r.dart';

class ShoeTag extends StatelessWidget {
  const ShoeTag({
    Key? key,
    required this.title,
  }) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20, top: 20),
      child: Text(
        title,
        style: R.appTextStyle.primaryTextStyle.copyWith(
          fontSize: 22,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}
