// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/cupertino.dart';
import 'package:shamo/R/r.dart';

class CustomNavigation {
  static pushFromRight(BuildContext context, {required Widget page}) {
    Navigator.push(
      context,
      PageRouteBuilder(
        pageBuilder: (BuildContext context, Animation<double> animation,
            Animation<double> secondaryAnimation) {
          return ClipRRect(
            borderRadius: const BorderRadius.vertical(
              top: Radius.circular(
                40,
              ),
            ),
            child: page,
          );
        },
        transitionsBuilder: (BuildContext context, Animation<double> animation,
            Animation<double> secondaryAnimation, Widget child) {
          return SlideTransition(
            position: Tween<Offset>(
              begin: const Offset(1, 0),
              end: Offset.zero,
            ).animate(
              CurvedAnimation(
                parent: animation,
                curve: Curves.easeInOutCubic,
              ),
            ),
            child: child,
          );
        },
        barrierColor: R.appColors.darkBgColor.withOpacity(0.2),
        opaque: true,
        barrierDismissible: true,
        fullscreenDialog: true,
      ),
    );
  }

  static pushFromRightReplacement(BuildContext context,
      {required Widget page}) {
    Navigator.pushReplacement(
      context,
      PageRouteBuilder(
        pageBuilder: (BuildContext context, Animation<double> animation,
            Animation<double> secondaryAnimation) {
          return ClipRRect(
            borderRadius: const BorderRadius.vertical(
              top: Radius.circular(
                40,
              ),
            ),
            child: page,
          );
        },
        transitionsBuilder: (BuildContext context, Animation<double> animation,
            Animation<double> secondaryAnimation, Widget child) {
          return SlideTransition(
            position: Tween<Offset>(
              begin: const Offset(1, 0),
              end: Offset.zero,
            ).animate(
              CurvedAnimation(
                parent: animation,
                curve: Curves.easeInOutCubic,
              ),
            ),
            child: child,
          );
        },
        barrierColor: R.appColors.darkBgColor.withOpacity(0.2),
        opaque: true,
        barrierDismissible: true,
        fullscreenDialog: true,
      ),
    );
  }

  static pushFromBottom(BuildContext context, {required Widget page}) {
    Navigator.push(
      context,
      PageRouteBuilder(
        pageBuilder: (BuildContext context, Animation<double> animation,
            Animation<double> secondaryAnimation) {
          return ClipRRect(
            borderRadius: const BorderRadius.vertical(
              top: Radius.circular(
                40,
              ),
            ),
            child: page,
          );
        },
        transitionsBuilder: (BuildContext context, Animation<double> animation,
            Animation<double> secondaryAnimation, Widget child) {
          return SlideTransition(
            position: Tween<Offset>(
              begin: const Offset(0, 1),
              end: Offset.zero,
            ).animate(
              CurvedAnimation(
                parent: animation,
                curve: Curves.easeInOutCubic,
              ),
            ),
            child: child,
          );
        },
        barrierColor: R.appColors.darkBgColor.withOpacity(0.2),
        opaque: true,
        barrierDismissible: true,
        fullscreenDialog: true,
      ),
    );
  }

  static pushFromBottomReplacement(BuildContext context,
      {required Widget page}) {
    Navigator.pushReplacement(
      context,
      PageRouteBuilder(
        pageBuilder: (BuildContext context, Animation<double> animation,
            Animation<double> secondaryAnimation) {
          return ClipRRect(
            borderRadius: const BorderRadius.vertical(
              top: Radius.circular(
                40,
              ),
            ),
            child: page,
          );
        },
        transitionsBuilder: (BuildContext context, Animation<double> animation,
            Animation<double> secondaryAnimation, Widget child) {
          return SlideTransition(
            position: Tween<Offset>(
              begin: const Offset(0, 1),
              end: Offset.zero,
            ).animate(
              CurvedAnimation(
                parent: animation,
                curve: Curves.easeInOutCubic,
              ),
            ),
            child: child,
          );
        },
        barrierColor: R.appColors.darkBgColor.withOpacity(0.2),
        opaque: true,
        barrierDismissible: true,
        fullscreenDialog: true,
      ),
    );
  }

  static pushFromBottomRemoveUntil(BuildContext context,
      {required Widget page}) {
    Navigator.pushAndRemoveUntil(
      context,
      PageRouteBuilder(
        pageBuilder: (BuildContext context, Animation<double> animation,
            Animation<double> secondaryAnimation) {
          return ClipRRect(
            borderRadius: const BorderRadius.vertical(
              top: Radius.circular(
                40,
              ),
            ),
            child: page,
          );
        },
        transitionsBuilder: (BuildContext context, Animation<double> animation,
            Animation<double> secondaryAnimation, Widget child) {
          return SlideTransition(
            position: Tween<Offset>(
              begin: const Offset(0, 1),
              end: Offset.zero,
            ).animate(
              CurvedAnimation(
                parent: animation,
                curve: Curves.easeInOutCubic,
              ),
            ),
            child: child,
          );
        },
        barrierColor: R.appColors.darkBgColor.withOpacity(0.2),
        opaque: true,
        barrierDismissible: true,
        fullscreenDialog: true,
      ),
      (route) => false,
    );
  }
}
