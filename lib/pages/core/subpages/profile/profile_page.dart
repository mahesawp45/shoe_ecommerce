// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shamo/R/r.dart';
import 'package:shamo/R/widgets/custom_navigation.dart';
import 'package:shamo/R/widgets/my_header.dart';
import 'package:shamo/R/widgets/user_avatar.dart';
import 'package:shamo/pages/auth/sign_in_page.dart';
import 'package:shamo/pages/core/subpages/profile/edit_profile_page.dart';
import 'package:shamo/providers/user_provider.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({
    Key? key,
    this.pageController,
  }) : super(key: key);

  final PageController? pageController;

  static const route = 'profile-page';

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    List<Map<String, dynamic>> accountSettings = [
      {
        'title': 'Account',
      },
      {
        'title': 'Edit Profile',
        'onTap': () {
          Navigator.pushNamed(context, EditProfilePage.route);
        },
      },
      {
        'title': 'Your Orders',
        'onTap': () {},
      },
      {
        'title': 'Help',
        'onTap': () {},
      },
    ];

    List<Map<String, dynamic>> generalSettings = [
      {
        'title': 'General',
      },
      {
        'title': 'Privacy and Policy',
        'onTap': () {},
      },
      {
        'title': 'Term of Service',
        'onTap': () {},
      },
      {
        'title': 'Rate App',
        'onTap': () {},
      },
    ];

    List<Widget> buildAccountSettings() {
      return List.generate(
        accountSettings.length,
        (index) {
          return ListTile(
            onTap: index == 0 ? null : accountSettings[index]['onTap'],
            title: Text(
              "${accountSettings[index]['title']}",
              style: index == 0
                  ? R.appTextStyle.primaryTextStyle.copyWith(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    )
                  : R.appTextStyle.secondaryTextStyle.copyWith(fontSize: 13),
            ),
            trailing: index == 0
                ? null
                : Icon(
                    Icons.arrow_forward_ios,
                    color: R.appColors.secondaryTextColor,
                  ),
          );
        },
      );
    }

    List<Widget> buildGeneralSettings() {
      return List.generate(generalSettings.length, (index) {
        return ListTile(
          onTap: index == 0 ? null : generalSettings[index]['onTap'],
          title: Text(
            "${generalSettings[index]['title']}",
            style: index == 0
                ? R.appTextStyle.primaryTextStyle.copyWith(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  )
                : R.appTextStyle.secondaryTextStyle.copyWith(fontSize: 13),
          ),
          trailing: index == 0
              ? null
              : Icon(
                  Icons.arrow_forward_ios,
                  color: R.appColors.secondaryTextColor,
                ),
        );
      });
    }

    Widget buildProfileHeader(BuildContext context) {
      return BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 50, sigmaY: 130),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            GestureDetector(
              onTap: () {
                CustomNavigation.pushFromRight(
                  context,
                  page: const EditProfilePage(),
                );
              },
              child: Hero(
                tag: 'profile',
                child: UserProfileAvatar(
                  img: R.appAssets.profile,
                  isUser: true,
                  size: 64,
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Consumer<UserProvider>(
                    builder: (context, userProvider, child) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Halo, ${userProvider.user.user?.name}',
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: R.appTextStyle.primaryTextStyle.copyWith(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 10),
                      Text(
                        '@${userProvider.user.user?.username}',
                        style: R.appTextStyle.secondaryTextStyle.copyWith(
                          fontSize: 16,
                        ),
                      ),
                    ],
                  );
                }),
              ),
            ),
            Consumer<UserProvider>(builder: (context, userProvider, child) {
              return GestureDetector(
                onTap: () {
                  userProvider.loggout();
                  Navigator.pushNamedAndRemoveUntil(
                      context, SignInPage.route, (route) => false);
                },
                child: SizedBox(
                  height: 25,
                  width: 25,
                  child: Image.asset(
                    R.appAssets.logout,
                    color: R.appColors.bgColor3,
                  ),
                ),
              );
            }),
          ],
        ),
      );
    }

    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return Scaffold(
      body: SizedBox(
        height: height,
        width: width,
        child: Column(
          children: [
            MyHeader(
              isProfile: true,
              customChild: buildProfileHeader(context),
            ),
            Expanded(
              flex: 5,
              child: Container(
                width: double.infinity,
                margin: EdgeInsets.symmetric(
                    horizontal: R.appMargin.defaultMargin - 10),
                decoration: BoxDecoration(
                  color: R.appColors.bgColor3.withOpacity(0.5),
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Container(
                        padding: const EdgeInsets.all(20),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: buildAccountSettings(),
                        ),
                      ),
                    ),
                    Expanded(
                      child: Container(
                        padding: const EdgeInsets.all(20),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: buildGeneralSettings(),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const Spacer(),
          ],
        ),
      ),
    );
  }
}
