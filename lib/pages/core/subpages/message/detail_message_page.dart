// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:shamo/R/decorations/decoration_one.dart';
import 'package:shamo/R/r.dart';
import 'package:shamo/R/widgets/my_button.dart';
import 'package:shamo/R/widgets/my_header.dart';
import 'package:shamo/R/widgets/product_send.dart';
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
            const MyHeader(
              child: MyHeaderDetail(),
            ),
            Expanded(
              child: Stack(
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
                      MessageSend(width: width, pop: pop),
                      // MessageSendProduct(pop: pop),
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

class MessageSend extends StatelessWidget {
  const MessageSend({
    Key? key,
    required this.width,
    required this.pop,
  }) : super(key: key);

  final double width;
  final Map<String, dynamic> pop;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: StreamBuilder(builder: (context, snapshot) {
        return ListView.separated(
          reverse: true,
          physics: const BouncingScrollPhysics(),
          shrinkWrap: true,
          padding: EdgeInsets.all(R.appMargin.defaultMargin),
          separatorBuilder: (context, index) {
            return const SizedBox(height: 20);
          },
          itemCount: 3,
          itemBuilder: (context, index) {
            return SizedBox(
              width: width * 0.8,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Container(
                        padding: EdgeInsets.symmetric(
                            horizontal: index < 1 ? 18 : 5,
                            vertical: index < 1 ? 12 : 15),
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            colors: [
                              R.appColors.bgColor3,
                              R.appColors.bgColor2.withOpacity(0.4),
                            ],
                          ),
                          borderRadius: const BorderRadius.only(
                            bottomLeft: Radius.circular(16),
                            bottomRight: Radius.circular(16),
                            topLeft: Radius.circular(16),
                          ),
                        ),
                        child: index < 1
                            ? Text(
                                'Good night ',
                                style: R.appTextStyle.primaryTextStyle,
                              )
                            : ProductSendContent(pop: pop),
                      ),
                      const SizedBox(height: 5),
                      Text(
                        'Now',
                        style: R.appTextStyle.darkTextStyle.copyWith(
                          fontSize: 10,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            );
          },
        );
      }),
    );
  }
}

class ProductSendContent extends StatelessWidget {
  const ProductSendContent({
    Key? key,
    required this.pop,
  }) : super(key: key);

  final Map<String, dynamic> pop;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        ProductSend(pop: pop, isDeletable: false),
        const SizedBox(height: 8),
        SizedBox(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              MyButton(label: 'Add to Cart', reverse: true, onTap: () {}),
              const SizedBox(width: 10),
              MyButton(label: 'Buy Now', reverse: false, onTap: () {}),
            ],
          ),
        )
      ],
    );
  }
}

class MessageSendProduct extends StatelessWidget {
  const MessageSendProduct({
    Key? key,
    required this.pop,
  }) : super(key: key);

  final Map<String, dynamic> pop;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        padding: EdgeInsets.only(left: R.appMargin.defaultMargin),
        physics: const BouncingScrollPhysics(),
        reverse: true,
        itemCount: 2,
        itemBuilder: (context, index) {
          return ProductSend(pop: pop, isDeletable: true);
        },
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
        vertical: 10,
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
              borderRadius: BorderRadius.circular(15),
            ),
            child: Center(
              child: Icon(
                Icons.send,
                color: R.appColors.primaryTextColor,
                size: 19,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class MyHeaderDetail extends StatelessWidget {
  const MyHeaderDetail({
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
        UserProfileAvatar(
          img: R.appAssets.logo,
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
