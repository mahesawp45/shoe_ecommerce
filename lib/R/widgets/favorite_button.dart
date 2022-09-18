// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/cupertino.dart';

import 'package:shamo/R/r.dart';

class FavoriteButton extends StatelessWidget {
  const FavoriteButton({
    Key? key,
    this.isExtend,
  }) : super(key: key);

  final bool? isExtend;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(
        horizontal: 12,
      ),
      padding: EdgeInsets.all(isExtend == true ? 12 : 9),
      height: isExtend == true ? 46 : 34,
      width: isExtend == true ? 46 : 34,
      decoration: BoxDecoration(
        color: isExtend == true ? R.appColors.bgColor2 : R.appColors.bgColor1,
        borderRadius: BorderRadius.circular(100),
      ),
      child: Image.asset(
        R.appAssets.favorite,
        fit: BoxFit.contain,
        color: isExtend == true
            ? R.appColors.bgColor3
            : R.appColors.primaryTextColor,
      ),
    );
  }
}
