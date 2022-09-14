import 'package:flutter/material.dart';
import 'package:shamo/R/r.dart';

class UserAvatar extends StatelessWidget {
  const UserAvatar({
    Key? key,
    this.size,
  }) : super(key: key);

  final double? size;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: size ?? 54,
      width: size ?? 54,
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            R.appColors.secondaryColor,
            Colors.cyan.shade900,
          ],
        ),
        borderRadius: BorderRadius.circular(200),
      ),
      child: Image.asset(
        R.appAssets.logo,
        fit: BoxFit.contain,
        color: R.appColors.cardColor,
      ),
    );
  }
}
