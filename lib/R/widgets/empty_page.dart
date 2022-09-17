import 'package:flutter/material.dart';
import 'package:shamo/R/r.dart';

class EmptyPage extends StatelessWidget {
  const EmptyPage({
    Key? key,
    required this.height,
    required this.pageController,
    required this.width,
    required this.iconPath,
    required this.firstLine,
    required this.secondLine,
    required this.indexHome,
  }) : super(key: key);

  final double height;
  final PageController pageController;
  final double width;
  final String iconPath;
  final String firstLine;
  final String secondLine;
  final int indexHome;

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
            style: R.appTextStyle.secondaryTextStyle,
          ),
          const SizedBox(height: 30),
          StatefulBuilder(builder: (context, setMenu) {
            return GestureDetector(
              onTap: () {
                indexHome;
                pageController.animateToPage(
                  indexHome,
                  duration: const Duration(milliseconds: 800),
                  curve: Curves.easeInOut,
                );
                setMenu(() {});
              },
              child: Container(
                height: 50,
                width: width * 0.4,
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
                    'Explore Store',
                    style: R.appTextStyle.primaryTextStyle,
                  ),
                ),
              ),
            );
          }),
          const Spacer(flex: 2),
        ],
      ),
    );
  }
}
