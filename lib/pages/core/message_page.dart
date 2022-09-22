// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:shamo/R/decorations/decoration_one.dart';
import 'package:shamo/R/r.dart';
import 'package:shamo/R/widgets/my_header.dart';
import 'package:shamo/R/widgets/page_template.dart';
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
            const MyHeader(
              label: 'Message Support',
            ),
            Expanded(
              child: Stack(
                clipBehavior: Clip.antiAlias,
                children: [
                  DecorationOne(
                      height: height, left: 0, right: 0, bottom: -120),
                  // EmptyPage(
                  //   indexHome: 0,
                  //   height: height,
                  //   pageController: pageController ?? PageController(),
                  //   width: width,
                  //   iconPath: R.appAssets.headset,
                  //   firstLine: 'Opss no message yet?',
                  //   secondLine: 'You have never done a transaction',
                  // ),
                  PageTemplate(
                    height: height,
                    width: width,
                    child: const MessageCard(),
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
        margin: const EdgeInsets.only(top: 5),
        decoration: BoxDecoration(
          border: Border(
            bottom: BorderSide(
              color: R.appColors.darkTextColor.withOpacity(0.3),
            ),
          ),
        ),
        child: Row(
          children: [
            UserProfileAvatar(img: R.appAssets.logo, size: 50),
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
