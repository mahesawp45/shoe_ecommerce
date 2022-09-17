import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:shamo/R/r.dart';

class AppBottomMenuItem {
  List menuItem = [
    R.appAssets.home,
    R.appAssets.chat,
    R.appAssets.favorite,
    R.appAssets.profile,
  ];

  menuTime({
    required int indexHome,
    required PageController pageController,
  }) {
    return StatefulBuilder(builder: (context, setMenu) {
      return Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: List.generate(
            menuItem.length,
            (index) {
              return GestureDetector(
                onTap: () {
                  indexHome = index;
                  pageController.animateToPage(
                    index,
                    duration: const Duration(milliseconds: 300),
                    curve: Curves.easeInOut,
                  );
                  setMenu(() {});

                  log('$indexHome');
                },
                child: Container(
                  margin: EdgeInsets.only(
                    right: index == 1 ? 80 : 0,
                  ),
                  padding: const EdgeInsets.all(8),
                  decoration: indexHome == index
                      ? BoxDecoration(
                          color: Colors.black.withOpacity(0.2),
                          borderRadius: BorderRadius.circular(100),
                        )
                      : null,
                  child: Image.asset(
                    menuItem[index],
                    width: 21,
                    color: indexHome == index ? R.appColors.primaryColor : null,
                  ),
                ),
              );
            },
          ));
    });
  }
}
