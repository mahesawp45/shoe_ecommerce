// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:shamo/R/r.dart';

class UserProfileAvatar extends StatelessWidget {
  const UserProfileAvatar({
    Key? key,
    this.size,
    required this.img,
    this.isUser,
  }) : super(key: key);

  final double? size;
  final String img;
  final bool? isUser;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(100),
      child: Container(
        height: size ?? 54,
        width: size ?? 54,
        padding: const EdgeInsets.symmetric(horizontal: 10),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              R.appColors.secondaryColor,
              Colors.cyan.shade900,
            ],
          ),
        ),
        child: Align(
          alignment: isUser == true ? Alignment.bottomCenter : Alignment.center,
          child: Image.asset(
            img,
            color: Colors.white.withOpacity(0.8),
          ),
        ),
      ),
    );
  }
}
