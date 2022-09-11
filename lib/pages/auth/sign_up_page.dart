import 'package:flutter/material.dart';
import 'package:shamo/R/r.dart';
import 'package:shamo/R/r_export.dart';
import 'package:shamo/pages/auth/sign_in_page.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  static const String route = '/sign-up';

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  double update = 0;

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
            child: SizedBox(
              width: width,
              height: height,
              child: Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: R.appMargin.defaultMargin,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const AuthAppBar(
                        title: 'Sign Up', label: 'Register and Happy Shoping'),
                    const AuthTextField(
                      label: 'Full Name',
                      hintText: 'Your Full Name',
                      icon: Icons.person,
                    ),
                    const AuthTextField(
                      label: 'Username',
                      hintText: 'Your Username',
                      icon: Icons.radio_button_checked_rounded,
                    ),
                    const AuthTextField(
                      label: 'Email',
                      hintText: 'Your Email Address',
                      icon: Icons.radio_button_checked_rounded,
                    ),
                    const AuthTextField(
                      label: 'Password',
                      hintText: 'Your Password',
                      icon: Icons.lock,
                      isPassword: true,
                    ),
                    const SizedBox(height: 30),
                    SizedBox(
                      child: Stack(
                        children: [
                          Container(
                            width: width,
                            height: height * 0.07,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(100),
                              color: Colors.grey.withOpacity(0.03),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Icon(Icons.arrow_forward_ios,
                                    color: Colors.grey.shade900, size: 15),
                                Icon(Icons.arrow_forward_ios,
                                    color: Colors.grey.shade900, size: 15),
                                Icon(Icons.arrow_forward_ios,
                                    color: Colors.grey.shade900, size: 15),
                                Icon(Icons.arrow_forward_ios,
                                    color: Colors.grey.shade900, size: 15),
                              ],
                            ),
                          ),
                          Transform.translate(
                            offset: Offset(update, 0),
                            child: GestureDetector(
                              onHorizontalDragUpdate: (details) {
                                if (details.localPosition.dx > 0 &&
                                    details.localPosition.dx < (width * 0.7)) {
                                  setState(() {
                                    update = details.localPosition.dx;
                                    if (update >= (width * 0.68)) {
                                      Navigator.pushNamed(
                                          context, SignInPage.route);
                                    }
                                  });
                                }
                              },
                              child: AuthButton(
                                  title: 'Sign Up', size: height * 0.07),
                            ),
                          ),
                        ],
                      ),
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
                              Navigator.pushNamed(context, SignInPage.route);
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
          ),
        ],
      ),
    );
  }
}
