// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/cupertino.dart';

import 'package:shamo/R/r.dart';

class FavoriteButton extends StatelessWidget {
  const FavoriteButton({
    Key? key,
    this.isExtend,
    this.isFavorite,
    required this.onTap,
  }) : super(key: key);

  final bool? isExtend;
  final bool? isFavorite;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        margin: const EdgeInsets.symmetric(
          horizontal: 12,
        ),
        padding: EdgeInsets.all(isExtend == true ? 12 : 9),
        height: isExtend == true ? 46 : 34,
        width: isExtend == true ? 46 : 34,
        decoration: BoxDecoration(
          color: isExtend == true && isFavorite == true
              ? R.appColors.addFav
              : isExtend == true
                  ? R.appColors.bgColor2
                  : R.appColors.bgColor1,
          boxShadow: [
            isFavorite == true
                ? BoxShadow(
                    color: R.appColors.addFav,
                    blurRadius: 20,
                    spreadRadius: 2,
                  )
                : const BoxShadow(),
          ],
          borderRadius: BorderRadius.circular(100),
        ),
        child: Image.asset(
          R.appAssets.favorite,
          fit: BoxFit.contain,
          color: isExtend == true && isFavorite == true
              ? R.appColors.cardColor
              : isExtend == true
                  ? R.appColors.bgColor3
                  : R.appColors.primaryTextColor,
        ),
      ),
    );
  }
}
