// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:shamo/R/decorations/decoration_one.dart';
import 'package:shamo/R/r.dart';

class MessagePage extends StatelessWidget {
  const MessagePage({
    Key? key,
    required this.pageController,
  }) : super(key: key);

  final PageController pageController;

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return SafeArea(
      top: true,
      bottom: false,
      child: Scaffold(
        extendBody: true,
        body: Column(
          children: [
            Container(
              height: 87,
              width: double.infinity,
              color: R.appColors.bgColor3,
              child: Center(
                child: Text(
                  'Message Support',
                  style: R.appTextStyle.primaryTextStyle
                      .copyWith(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ),
            ),
            Expanded(
              child: Stack(
                clipBehavior: Clip.antiAlias,
                children: [
                  DecorationOne(
                      height: height, left: 0, right: 0, bottom: -120),
                  Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Spacer(),
                        SizedBox(
                          height: height * 0.12,
                          width: height * 0.12,
                          child: Image.asset(
                            R.appAssets.headset,
                            fit: BoxFit.contain,
                          ),
                        ),
                        const SizedBox(height: 20),
                        Text(
                          'Opss no message yet?',
                          style: R.appTextStyle.primaryTextStyle
                              .copyWith(fontSize: 16),
                        ),
                        const SizedBox(height: 10),
                        Text(
                          'You have naver done a transaction',
                          style: R.appTextStyle.secondaryTextStyle,
                        ),
                        const SizedBox(height: 30),
                        GestureDetector(
                          onTap: () {
                            pageController.animateToPage(
                              0,
                              duration: const Duration(milliseconds: 800),
                              curve: Curves.easeInOut,
                            );
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
                                  color:
                                      R.appColors.primaryColor.withOpacity(0.7),
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
                        ),
                        const Spacer(flex: 2),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
