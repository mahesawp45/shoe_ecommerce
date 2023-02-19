import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shamo/R/r.dart';
import 'package:shamo/R/r_export.dart';
import 'package:shamo/R/widgets/auth_slide_button.dart';
import 'package:shamo/pages/auth/sign_in_page.dart';
import 'package:shamo/providers/user_provider.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  static const String route = '/sign-up';

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  late double update;
  late bool isPassword;
  late UserProvider userProvider =
      Provider.of<UserProvider>(context, listen: false);

  late bool isLoading;

  late TextEditingController fullNameC;
  late TextEditingController userNameC;
  late TextEditingController emailC;
  late TextEditingController passC;

  @override
  void initState() {
    update = 0;
    isPassword = true;
    isLoading = false;
    fullNameC = TextEditingController();
    userNameC = TextEditingController();
    emailC = TextEditingController();
    passC = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    fullNameC.dispose();
    userNameC.dispose();
    emailC.dispose();
    passC.dispose();
    super.dispose();
  }

  registerHandler() async {
    setState(() {
      isLoading = true;
    });

    try {
      if (await userProvider.isRegister(context, payload: {
        'name': fullNameC.text,
        'username': userNameC.text,
        'email': emailC.text,
        'password': passC.text,
      })) {
        Navigator.pushReplacementNamed(context, SignInPage.route);
      } else {
        // Snackbar ada di provider
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
              width: width,
              height: height,
              padding: EdgeInsets.symmetric(
                horizontal: R.appMargin.defaultMargin,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const AuthAppBar(
                      title: 'Sign Up', label: 'Register and Happy Shoping'),
                  AuthTextField(
                    controller: fullNameC,
                    label: 'Full Name',
                    hintText: 'Your Full Name',
                    icon: Icons.person,
                  ),
                  AuthTextField(
                    controller: userNameC,
                    label: 'Username',
                    hintText: 'Your Username',
                    icon: Icons.radio_button_checked_rounded,
                  ),
                  AuthTextField(
                    controller: emailC,
                    label: 'Email',
                    hintText: 'Your Email Address',
                    icon: Icons.email,
                    isEmail: true,
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
                    label: 'Sign Up',
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
                        await registerHandler();

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
                  Container(
                    padding: const EdgeInsets.only(bottom: 20),
                    color: Colors.transparent,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Already have an account?",
                          style: R.appTextStyle.darkTextStyle
                              .copyWith(fontSize: 12),
                        ),
                        TextButton(
                          style: TextButton.styleFrom(
                            foregroundColor: Colors.transparent,
                            shadowColor: Colors.transparent,
                          ),
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          child: Text(
                            "Log in",
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
