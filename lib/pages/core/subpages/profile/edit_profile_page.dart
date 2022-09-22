import 'package:flutter/material.dart';
import 'package:shamo/R/decorations/decoration_one.dart';
import 'package:shamo/R/r.dart';
import 'package:shamo/R/widgets/my_header.dart';
import 'package:shamo/R/widgets/user_avatar.dart';

class EditProfilePage extends StatelessWidget {
  const EditProfilePage({super.key});

  static const route = 'edit-profile-page';

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

    List<Map<String, dynamic>> formEditProfile = [
      {
        'label': 'Name',
        'controller': '',
      },
      {
        'label': 'Username',
        'controller': '',
      },
      {
        'label': 'Email',
        'controller': '',
      },
    ];

    List<Widget> buildEditProfileForm() {
      return List.generate(formEditProfile.length, (index) {
        return Container(
          padding: EdgeInsets.only(top: R.appMargin.defaultMargin),
          width: double.infinity,
          decoration: BoxDecoration(
            border: Border(
              bottom: BorderSide(color: R.appColors.darkTextColor),
            ),
          ),
          child: TextField(
            cursorColor: R.appColors.primaryColor,
            style: R.appTextStyle.primaryTextStyle,
            decoration: InputDecoration(
              label: Text(
                formEditProfile[index]['label'],
                style: R.appTextStyle.secondaryTextStyle,
              ),
              border: InputBorder.none,
            ),
          ),
        );
      });
    }

    return SafeArea(
      child: Scaffold(
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            MyHeader(
              customChild: _buildEditProfilePage(context),
            ),
            Stack(
              children: [
                const DecorationOne(height: 500),
                DecorationOne(
                    height: 500,
                    color: R.appColors.secondaryColor.withOpacity(0.6),
                    bottom: 0,
                    left: width * 0.6),
                Expanded(
                  child: Container(
                    padding: EdgeInsets.all(R.appMargin.defaultMargin),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Hero(
                          tag: 'profile',
                          child: UserProfileAvatar(
                            size: 100,
                            img: R.appAssets.profile,
                            isUser: true,
                          ),
                        ),
                        SingleChildScrollView(
                          physics: const BouncingScrollPhysics(),
                          child: Expanded(
                            child: Column(
                              children: buildEditProfileForm(),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Padding _buildEditProfilePage(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: R.appMargin.defaultMargin),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: Icon(Icons.close, color: R.appColors.primaryTextColor),
          ),
          Text(
            'Edit Profile',
            style: R.appTextStyle.primaryTextStyle.copyWith(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          Icon(Icons.check, color: R.appColors.primaryColor),
        ],
      ),
    );
  }
}
