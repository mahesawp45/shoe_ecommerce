import 'package:flutter/material.dart';
import 'package:shamo/R/r.dart';
import 'package:shamo/R/widgets/custom_navigation.dart';
import 'package:shamo/pages/core/subpages/cart/cart_page.dart';

class CartFloatingButton extends StatelessWidget {
  const CartFloatingButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      backgroundColor: Colors.transparent,
      onPressed: () {
        CustomNavigation.pushFromBottom(context, page: const CartPage());
      },
      child: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(100),
          gradient: LinearGradient(
            colors: [
              R.appColors.secondaryColor,
              Colors.cyan.shade900,
            ],
          ),
          boxShadow: [
            BoxShadow(
              blurRadius: 50,
              spreadRadius: 10,
              color: R.appColors.secondaryColor.withOpacity(0.7),
              offset: const Offset(0, 0),
            ),
          ],
        ),
        child: Center(child: Image.asset(R.appAssets.cart, width: 21)),
      ),
    );
  }
}
