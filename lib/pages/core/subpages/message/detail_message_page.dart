// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:shamo/R/decorations/decoration_one.dart';
import 'package:shamo/R/r.dart';
import 'package:shamo/R/widgets/message_header.dart';
import 'package:shamo/R/widgets/user_avatar.dart';

class DetailMessagePage extends StatefulWidget {
  const DetailMessagePage({
    Key? key,
  }) : super(key: key);

  static const String route = '/detail-message-page';

  @override
  State<DetailMessagePage> createState() => _DetailMessagePageState();
}

class _DetailMessagePageState extends State<DetailMessagePage> {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    Map<String, dynamic> pop = {
      'title': 'Terrex Urban Low',
      'category': 'Hiking',
      'price': '\$143,98',
      'img': R.appAssets.pop2,
    };

    return SafeArea(
      top: true,
      bottom: false,
      child: Scaffold(
        extendBody: true,
        body: Column(
          children: [
            const MessageHeader(
              child: MessageHeaderDetail(),
            ),
            Expanded(
              child: Stack(
                clipBehavior: Clip.antiAlias,
                children: [
                  DecorationOne(
                    height: height * 0.6,
                    top: 10,
                    left: 50,
                  ),
                  DecorationOne(
                    height: height * 0.45,
                    width: width * 0.5,
                    top: 300,
                    right: 50,
                    color: R.appColors.secondaryColor.withOpacity(0.4),
                    radius: 20,
                  ),
                  Column(
                    children: [
                      Expanded(
                        child: ListView.builder(
                          padding:
                              EdgeInsets.only(left: R.appMargin.defaultMargin),
                          physics: const BouncingScrollPhysics(),
                          reverse: true,
                          itemCount: 1,
                          itemBuilder: (context, index) {
                            return Stack(
                              children: [
                                Container(
                                  height: 84,
                                  width: 225,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(15),
                                    gradient: LinearGradient(
                                      colors: [
                                        R.appColors.primaryColor,
                                        R.appColors.secondaryColor,
                                      ],
                                    ),
                                  ),
                                ),
                                Positioned(
                                  left: 0,
                                  child: Container(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 10),
                                    margin: const EdgeInsets.all(5),
                                    height: 74,
                                    width: 215,
                                    decoration: BoxDecoration(
                                      color: R.appColors.bgColor3,
                                      borderRadius: BorderRadius.circular(15),
                                    ),
                                    child: Row(
                                      children: [
                                        Container(
                                          height: 54,
                                          width: 54,
                                          decoration: BoxDecoration(
                                            color: R.appColors.cardColor,
                                            borderRadius:
                                                BorderRadius.circular(10),
                                          ),
                                          child: Image.asset(
                                            pop['img'],
                                            fit: BoxFit.contain,
                                          ),
                                        ),
                                        const SizedBox(width: 10),
                                        Expanded(
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Text(
                                                "${pop['title']}",
                                                overflow: TextOverflow.ellipsis,
                                                maxLines: 1,
                                                style: R.appTextStyle
                                                    .primaryTextStyle,
                                              ),
                                              Text(
                                                "${pop['price']}",
                                                style: R.appTextStyle
                                                    .priceTextStyle,
                                              ),
                                            ],
                                          ),
                                        ),
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(top: 10),
                                          child: Align(
                                            alignment: Alignment.topCenter,
                                            child: Icon(
                                              Icons.cancel_rounded,
                                              size: 22,
                                              color: R.appColors.primaryColor,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            );
                          },
                        ),
                      ),
                      const MessageInput(),
                    ],
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

class MessageInput extends StatefulWidget {
  const MessageInput({
    Key? key,
  }) : super(key: key);

  @override
  State<MessageInput> createState() => _MessageInputState();
}

class _MessageInputState extends State<MessageInput> {
  int maxlines = 1;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: R.appMargin.defaultMargin,
        vertical: 20,
      ),
      width: double.infinity,
      child: Row(
        children: [
          Expanded(
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              decoration: BoxDecoration(
                color: R.appColors.bgColor3.withOpacity(0.5),
                borderRadius: BorderRadius.circular(15),
              ),
              child: TextField(
                cursorColor: R.appColors.primaryColor,
                style: R.appTextStyle.primaryTextStyle,
                maxLines: maxlines,
                onSubmitted: (value) {
                  setState(() {
                    maxlines += 1;
                  });
                },
                onEditingComplete: () {
                  setState(() {
                    maxlines += 1;
                  });
                },
                keyboardType: TextInputType.multiline,
                decoration: InputDecoration(
                  contentPadding: const EdgeInsets.only(right: 10),
                  border: InputBorder.none,
                  hintText: 'Type Message..',
                  hintStyle: R.appTextStyle.darkTextStyle.copyWith(
                    fontSize: 13,
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(width: 20),
          Container(
            height: 45,
            width: 45,
            decoration: BoxDecoration(
              color: R.appColors.primaryColor,
              borderRadius: BorderRadius.circular(16),
            ),
            child: const Center(
              child: Icon(
                Icons.send,
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class MessageHeaderDetail extends StatelessWidget {
  const MessageHeaderDetail({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: R.appMargin.defaultMargin),
      child: Row(
        children: [
          GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: Icon(
              Icons.arrow_back_ios,
              color: R.appColors.primaryTextColor,
            ),
          ),
          const SizedBox(width: 20),
          Expanded(
            child: Row(
              children: [
                const UserAvatarDetail(),
                const SizedBox(width: 15),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Shoe Store',
                      style: R.appTextStyle.primaryTextStyle
                          .copyWith(fontSize: 15),
                    ),
                    const SizedBox(height: 5),
                    Text(
                      'Online',
                      style: R.appTextStyle.secondaryTextStyle,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class UserAvatarDetail extends StatelessWidget {
  const UserAvatarDetail({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        const UserAvatar(
          size: 50,
        ),
        Positioned(
          bottom: 0,
          right: 0,
          child: Container(
            height: 15,
            width: 15,
            decoration: BoxDecoration(
                color: R.appColors.onlineColor,
                borderRadius: BorderRadius.circular(100),
                border: Border.all(color: R.appColors.bgColor3, width: 2)),
          ),
        ),
      ],
    );
  }
}
