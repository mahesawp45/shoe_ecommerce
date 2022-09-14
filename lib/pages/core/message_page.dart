// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:shamo/R/decorations/decoration_one.dart';
import 'package:shamo/R/r.dart';
import 'package:shamo/R/widgets/message_header.dart';
import 'package:shamo/R/widgets/user_avatar.dart';
import 'package:shamo/pages/core/subpages/sub_page_export.dart';

class MessagePage extends StatelessWidget {
  const MessagePage({
    Key? key,
    this.pageController,
  }) : super(key: key);

  final PageController? pageController;
  static const String route = '/message-page';

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
            MessageHeader(
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
                  // EmptyMessage(
                  //     height: height,
                  //     pageController: pageController,
                  //     width: width),
                  Messages(height: height, width: width),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class Messages extends StatelessWidget {
  const Messages({
    Key? key,
    required this.height,
    required this.width,
  }) : super(key: key);

  final double height;
  final double width;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      width: width,
      child: ListView.builder(
        padding: EdgeInsets.symmetric(
          horizontal: R.appMargin.defaultMargin,
          vertical: R.appMargin.defaultMargin,
        ),
        itemCount: 1,
        itemBuilder: (context, index) {
          return const MessageCard();
        },
      ),
    );
  }
}

class MessageCard extends StatelessWidget {
  const MessageCard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, DetailMessagePage.route);
      },
      child: Container(
        height: 75,
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          border: Border(
            bottom: BorderSide(
              color: R.appColors.darkTextColor.withOpacity(0.3),
            ),
          ),
        ),
        child: Row(
          children: [
            const UserAvatar(),
            const SizedBox(width: 15),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Shoe Store',
                    style:
                        R.appTextStyle.primaryTextStyle.copyWith(fontSize: 15),
                  ),
                  const SizedBox(height: 5),
                  Text(
                    'Good night, This item is on Lorem Ipsum Sit Dolor Amet',
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                    style: R.appTextStyle.secondaryTextStyle,
                  ),
                ],
              ),
            ),
            Text(
              'Now',
              style: R.appTextStyle.secondaryTextStyle.copyWith(fontSize: 10),
            )
          ],
        ),
      ),
    );
  }
}

class EmptyMessage extends StatelessWidget {
  const EmptyMessage({
    Key? key,
    required this.height,
    required this.pageController,
    required this.width,
  }) : super(key: key);

  final double height;
  final PageController pageController;
  final double width;

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
              R.appAssets.headset,
              fit: BoxFit.contain,
            ),
          ),
          const SizedBox(height: 20),
          Text(
            'Opss no message yet?',
            style: R.appTextStyle.primaryTextStyle.copyWith(fontSize: 16),
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
          ),
          const Spacer(flex: 2),
        ],
      ),
    );
  }
}
