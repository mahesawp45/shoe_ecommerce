// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:shamo/R/r.dart';
import 'package:shamo/R/r_export.dart';
import 'package:shamo/pages/auth/sign_up_page.dart';
import 'package:shamo/pages/core/home_page.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({super.key});

  static const String route = '/sign-in';

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  double update = 0;

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return Scaffold(
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.only(bottom: 20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Don't have an account?",
              style: R.appTextStyle.darkTextStyle.copyWith(fontSize: 12),
            ),
            TextButton(
              style: TextButton.styleFrom(
                foregroundColor: Colors.transparent,
                shadowColor: Colors.transparent,
              ),
              onPressed: () {
                Navigator.pushNamed(context, SignUpPage.route);
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
      body: Stack(
        children: [
          DecorationOne(height: height, top: -120, right: -70),
          SizedBox(
            height: height,
            width: width,
            child: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: R.appMargin.defaultMargin,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const AuthAppBar(
                      title: 'Login', label: 'Sign In to Continue'),
                  SingleChildScrollView(
                    physics: const BouncingScrollPhysics(),
                    child: Column(
                      children: [
                        const AuthTextField(
                          label: 'Email',
                          hintText: 'Your Email Address',
                          icon: Icons.email,
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
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
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
                                        details.localPosition.dx <
                                            (width * 0.7)) {
                                      setState(() {
                                        update = details.localPosition.dx;
                                        if (update >= (width * 0.68)) {
                                          Navigator.pushNamed(
                                              context, HomePage.route);
                                        }
                                      });
                                    }
                                  },
                                  child: AuthButton(
                                      title: 'Sign In', size: height * 0.07),
                                ),
                              ),
                            ],
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
