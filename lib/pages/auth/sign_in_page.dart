// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:provider/provider.dart';
import 'package:shamo/R/r.dart';
import 'package:shamo/R/r_export.dart';
import 'package:shamo/helpers/user_helpers.dart';
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

    if (await userProvider.isLogin(context, payload: {
      'email': emailC.text,
      'password': passC.text,
    })) {
      Navigator.pushReplacementNamed(context, HomePage.route);
    } else {
      // Snackbar ada di provider
      log('Error');
    }

    setState(() {
      isLoading = false;
    });
  }

  Future<UserCredential> signInWithGoogle() async {
    // Trigger the authentication flow
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

    // Obtain the auth details from the request
    final GoogleSignInAuthentication? googleAuth =
        await googleUser?.authentication;

    // Create a new credential
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );

    // Once signed in, return the UserCredential
    return await FirebaseAuth.instance.signInWithCredential(credential);
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
                            children: List.generate(
                              4,
                              (index) => Icon(Icons.arrow_forward_ios,
                                  color: Colors.grey.shade900, size: 15),
                            ),
                          ),
                        ),
                        Transform.translate(
                          offset: Offset(update, 0),
                          child: GestureDetector(
                            onHorizontalDragEnd: (details) async {
                              if (update >= (width * 0.68)) {
                                await loginHandler();

                                setState(() {
                                  update = 0;
                                });
                              }
                              setState(() {
                                update = 0;
                              });
                            },
                            onHorizontalDragUpdate: (details) {
                              if (details.localPosition.dx > 0 &&
                                  details.localPosition.dx < (width * 0.7)) {
                                setState(() {
                                  update = details.localPosition.dx;
                                });
                              }
                            },
                            child: AuthButton(
                                isLoading: isLoading,
                                title: 'Sign In',
                                size: height * 0.07),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const Spacer(),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        GestureDetector(
                          onTap: () async {
                            await signInWithGoogle();

                            final user = UserHelpers.getUserEmail();
                            log(user.toString());
                            if (user != null) {
                              Navigator.pushReplacementNamed(
                                  context, HomePage.route);
                            }
                          },
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
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
