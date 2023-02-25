import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:shamo/R/r.dart';

class MyBottomAppBar extends StatelessWidget {
  const MyBottomAppBar({
    Key? key,
    required this.onTapHome,
    required this.onTapMessage,
    required this.onTapWish,
    required this.onTapProfile,
    required this.isTappedHome,
    required this.isTappedMessage,
    required this.isTappedWish,
    required this.isTappedProfile,
  }) : super(key: key);

  final VoidCallback onTapHome;
  final VoidCallback onTapMessage;
  final VoidCallback onTapWish;
  final VoidCallback onTapProfile;
  final bool isTappedHome;
  final bool isTappedMessage;
  final bool isTappedWish;
  final bool isTappedProfile;

  @override
  Widget build(BuildContext context) {
    List menuItem = [
      R.appAssets.home,
      R.appAssets.chat,
      R.appAssets.favorite,
      R.appAssets.profile,
    ];

    return ClipRRect(
      borderRadius: const BorderRadius.vertical(top: Radius.circular(30)),
      child: BottomAppBar(
        color: R.appColors.bgColor3.withOpacity(0.55),
        surfaceTintColor: R.appColors.bgColor3.withOpacity(0.55),
        elevation: 0,
        shape: const CircularNotchedRectangle(),
        clipBehavior: Clip.antiAlias,
        notchMargin: 15,
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 10, sigmaY: 8),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
            child: SizedBox(
              height: 50,
              width: double.infinity,
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                      onTap: onTapHome,
                      child: Container(
                        padding: const EdgeInsets.all(8),
                        decoration: isTappedHome
                            ? BoxDecoration(
                                color: Colors.black.withOpacity(0.2),
                                borderRadius: BorderRadius.circular(100),
                              )
                            : null,
                        child: Image.asset(
                          menuItem[0],
                          width: 21,
                          color: isTappedHome ? R.appColors.primaryColor : null,
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: onTapMessage,
                      child: Container(
                        padding: const EdgeInsets.all(8),
                        decoration: isTappedMessage
                            ? BoxDecoration(
                                color: Colors.black.withOpacity(0.2),
                                borderRadius: BorderRadius.circular(100),
                              )
                            : null,
                        child: Image.asset(
                          menuItem[1],
                          width: 21,
                          color:
                              isTappedMessage ? R.appColors.primaryColor : null,
                        ),
                      ),
                    ),
                    SizedBox(width: R.appSize.getHeight(context) * 0.1),
                    GestureDetector(
                      onTap: onTapWish,
                      child: Container(
                        padding: const EdgeInsets.all(8),
                        decoration: isTappedWish
                            ? BoxDecoration(
                                color: Colors.black.withOpacity(0.2),
                                borderRadius: BorderRadius.circular(100),
                              )
                            : null,
                        child: Image.asset(
                          menuItem[2],
                          width: 21,
                          color: isTappedWish ? R.appColors.primaryColor : null,
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: onTapProfile,
                      child: Container(
                        padding: const EdgeInsets.all(8),
                        decoration: isTappedProfile
                            ? BoxDecoration(
                                color: Colors.black.withOpacity(0.2),
                                borderRadius: BorderRadius.circular(100),
                              )
                            : null,
                        child: Image.asset(
                          menuItem[3],
                          width: 21,
                          color:
                              isTappedProfile ? R.appColors.primaryColor : null,
                        ),
                      ),
                    ),
                  ]),
            ),
          ),
        ),
      ),
    );
  }
}
