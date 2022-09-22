// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:shamo/R/r.dart';
import 'package:shamo/pages/core/home_page.dart';

class EmptyPage extends StatelessWidget {
  const EmptyPage({
    Key? key,
    required this.height,
    this.pageController,
    required this.width,
    required this.iconPath,
    required this.firstLine,
    required this.secondLine,
    required this.indexHome,
    this.isOutFromHome,
    this.otherLabelButton,
    this.otherLabelButton2,
    this.isMultiButton,
  }) : super(key: key);

  final double height;
  final PageController? pageController;
  final double width;
  final String iconPath;
  final String firstLine;
  final String secondLine;
  final int indexHome;
  final bool? isOutFromHome;
  final String? otherLabelButton;
  final String? otherLabelButton2;
  final bool? isMultiButton;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Spacer(),
          SizedBox(
            height: height * 0.12,
            width: height * 0.12,
            child: Image.asset(
              iconPath,
              fit: BoxFit.contain,
            ),
          ),
          const SizedBox(height: 20),
          Text(
            firstLine,
            style: R.appTextStyle.primaryTextStyle.copyWith(fontSize: 16),
          ),
          const SizedBox(height: 10),
          Text(
            secondLine,
            textAlign: TextAlign.center,
            style: R.appTextStyle.secondaryTextStyle.copyWith(height: 2),
          ),
          const SizedBox(height: 30),
          StatefulBuilder(builder: (context, setMenu) {
            return GestureDetector(
              onTap: () {
                if (isOutFromHome == true) {
                  Navigator.pushAndRemoveUntil(context, MaterialPageRoute(
                    builder: (context) {
                      return const HomePage();
                    },
                  ), ModalRoute.withName(HomePage.route));
                } else {
                  indexHome;
                  pageController?.animateToPage(
                    indexHome,
                    duration: const Duration(milliseconds: 800),
                    curve: Curves.easeInOut,
                  );
                  setMenu(() {});
                }
              },
              child: Container(
                height: 50,
                width: otherLabelButton != null ? 196 : 152,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [
                    BoxShadow(
                      blurRadius: 50,
                      spreadRadius: 2,
                      color: R.appColors.primaryColor.withOpacity(0.7),
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
                child: Center(
                  child: Text(
                    otherLabelButton ?? 'Explore Store',
                    style: R.appTextStyle.primaryTextStyle,
                  ),
                ),
              ),
            );
          }),
          const SizedBox(height: 20),
          isMultiButton == true
              ? GestureDetector(
                  onTap: () {},
                  child: Container(
                    height: 50,
                    width: otherLabelButton2 != null ? 196 : 152,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: R.appColors.bgColor1,
                    ),
                    child: Center(
                      child: Text(
                        otherLabelButton2 ?? 'Explore Store',
                        style: R.appTextStyle.primaryTextStyle,
                      ),
                    ),
                  ),
                )
              : const SizedBox(),
          const Spacer(flex: 2),
        ],
      ),
    );
  }
}
