// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:shamo/R/r.dart';
import 'package:shamo/R/r_export.dart';
import 'package:shamo/R/widgets/auth_slide_button.dart';
import 'package:shamo/R/widgets/custom_navigation.dart';
import 'package:shamo/pages/auth/sign_up_page.dart';
import 'package:shamo/pages/core/home_page.dart';
import 'package:shamo/providers/user_provider.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({super.key});

  static const String route = '/sign-in';

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  late UserProvider userProvider;

  late double update;
  late bool isPassword;
  late bool isLoading;

  late TextEditingController emailC;
  late TextEditingController passC;

  @override
  void initState() {
    userProvider = Provider.of<UserProvider>(context, listen: false);
    update = 0;
    isPassword = true;
    isLoading = false;
    emailC = TextEditingController();
    passC = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    emailC.dispose();
    passC.dispose();
    super.dispose();
  }

  loginHandler() async {
    setState(() {
      isLoading = true;
    });

    try {
      if (await userProvider.isLogin(context, payload: {
        'email': emailC.text,
        'password': passC.text,
      })) {
        CustomNavigation.pushFromBottomRemoveUntil(
          context,
          page: const HomePage(),
        );
      } else {
        log('Error');
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          behavior: SnackBarBehavior.floating,
          backgroundColor: R.appColors.removeFav,
          content: Text(e.toString()),
        ),
      );
    }

    setState(() {
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return Scaffold(
      body: Stack(
        children: [
          DecorationOne(height: height, top: -120, right: -70),
          SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Container(
              height: height,
              width: width,
              padding: EdgeInsets.symmetric(
                horizontal: R.appMargin.defaultMargin,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const AuthAppBar(
                      title: 'Login', label: 'Sign In to Continue'),
                  AuthTextField(
                    controller: emailC,
                    label: 'Email',
                    hintText: 'Your Email Address',
                    icon: Icons.email,
                  ),
                  Consumer<UserProvider>(
                      builder: (context, userProvider, child) {
                    return AuthTextField(
                      controller: passC,
                      label: 'Password',
                      hintText: 'Your Password',
                      icon: Icons.lock,
                      isPassword: userProvider.isVisible,
                      visibleButton: GestureDetector(
                        onTap: () {
                          userProvider.isPasswordVisible();
                        },
                        child: Icon(
                          userProvider.isVisible
                              ? Icons.visibility
                              : Icons.visibility_off,
                          color: R.appColors.primaryColor,
                        ),
                      ),
                    );
                  }),
                  const SizedBox(height: 30),
                  AuthSlideButton(
                    label: 'Sign In',
                    width: width,
                    update: update,
                    isLoading: isLoading,
                    updateDrag: (details) {
                      double maxLength =
                          (width.floor() - (R.appMargin.defaultMargin * 4));

                      if (details.localPosition.dx > 0 &&
                          details.localPosition.dx < maxLength) {
                        setState(() {
                          update = details.localPosition.dx;
                        });
                      }
                    },
                    endDrag: (details) async {
                      double maxLength =
                          (width.floor() - (R.appMargin.defaultMargin * 4));

                      if (update.floor() >= maxLength.floor() ||
                          update.floor() >= (maxLength.floor() - 3)) {
                        await loginHandler();

                        setState(() {
                          update = 0;
                        });
                      }
                      setState(() {
                        update = 0;
                      });
                    },
                  ),
                  const Spacer(),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        GestureDetector(
                          onTap: () async {},
                          child: Image.asset(R.appAssets.google),
                        ),
                        const SizedBox(width: 50),
                        GestureDetector(
                          onTap: () {},
                          child: Image.asset(R.appAssets.apple),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Don't have an account?",
                          style: R.appTextStyle.darkTextStyle
                              .copyWith(fontSize: 12),
                        ),
                        TextButton(
                          style: TextButton.styleFrom(
                            foregroundColor: Colors.transparent,
                            shadowColor: Colors.transparent,
                          ),
                          onPressed: () {
                            CustomNavigation.pushFromRight(context,
                                page: const SignUpPage());
                          },
                          child: Text(
                            "Sign up",
                            style: R.appTextStyle.secondaryTextStyle.copyWith(
                              fontSize: 12,
                              color: R.appColors.primaryColor,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
